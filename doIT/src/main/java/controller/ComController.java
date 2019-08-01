package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.LogInException;
import logic.CV;
import logic.Company;
import logic.Job;
import logic.PageService;
import logic.Pickjob;
import logic.Pickuser;
import logic.Setting;
import logic.User;
import security.CipherUtil;

@Controller
@RequestMapping("com")
public class ComController {
   @Autowired
   private PageService service;

   @PostMapping("comEntry")
   public ModelAndView userEntry(@Valid Company company, BindingResult bindResult, User user) {
      ModelAndView mav = new ModelAndView();
      if (bindResult.hasErrors()) {
         mav.getModel().putAll(bindResult.getModel());
         mav.addObject("company", company);
         mav.setViewName("comEntry.shop");
         return mav;
      }

      try {
         if (service.comselect(company.getComid()) != null) {
            mav.addObject("msg", "이미 존재하는 아이디입니다.");
            mav.addObject("url", "comEntry.shop");
            mav.setViewName("alert");
            return mav;
         } else {
            service.companyCreate(company);
            mav.setViewName("com/comLogin");
//            mav.addObject("user", new User());
            mav.addObject("company", company);
         }
      } catch (DataIntegrityViolationException e) {
         e.printStackTrace();
         bindResult.reject("error.duplicate.user");
      }
      return mav;
   }

   @PostMapping("comLogin")
   public ModelAndView comLogin(Company company, HttpSession session, User user) {
      ModelAndView mav = new ModelAndView();
      Company dbCompany = service.comselect(company.getComid());
      if (dbCompany == null) {
         throw new LogInException("아이디 또는 비밀번호가 틀립니다.", "comLogin.shop");
      }
      String compass = CipherUtil.encrypt(company.getCompass(), company.getComid());
      if (compass.equals(dbCompany.getCompass())) {
         session.setAttribute("logincom", dbCompany);
         mav.setViewName("redirect:commypage.shop?comid=" + company.getComid());
      } else {
         mav.addObject("user", new User());
         mav.addObject("company", new Company());
         return mav;
      }
      return mav;
   }

   @RequestMapping("logout")
   public String logout(HttpSession session) {
      session.invalidate();
      return "redirect:comLogin.shop";
   }

   // 해인, 찬웅 기업 부분//
   @RequestMapping("commypage")
   public ModelAndView commypage(Company company, HttpSession session) {
      ModelAndView mav = new ModelAndView();
      Company scom = (Company) session.getAttribute("logincom");
      Company com = service.comselect(scom.getComid());
      CV cv = null;
      User user = null;
      List<Job> job = null;
      List<Pickuser> pulist = new ArrayList<Pickuser>();
      if (service.getlist(com.getComno()) == null) {
         pulist = null;
      } else {
         pulist = service.getlist(com.getComno());
      }

      for (Pickuser p : pulist) {
         cv = service.getCV(p.getCvno());
         user = service.userSelect(cv.getUserno());
         p.setUser(user);
         p.setCv(cv);
      }
      job = service.jobselect(com.getComno());

      session.setAttribute("logincom", com);
      mav.addObject("pulist", pulist);
      mav.addObject("com", com);
      mav.addObject("job", job);
      return mav;
   }

   @RequestMapping(value = { "setting", "writejobform" })
   public ModelAndView settingform(HttpServletRequest request) throws IOException {
      ModelAndView mav = new ModelAndView();
      String rootPath = request.getSession().getServletContext().getRealPath("/");
      String filePath = rootPath + "\\WEB-INF\\view\\com\\setting.txt";
      File file = new File(filePath);
      FileReader fr = new FileReader(file);
      BufferedReader br = new BufferedReader(fr);
      String line = "";
      String[] str;
      String[] fstr;
      while ((line = br.readLine()) != null) {
         str = line.split(":");
         fstr = str[1].split(",");
         mav.addObject(str[0], fstr);
      }
      fr.close();
      br.close();
      if (request.getRequestURI().contains("setting")) {
         int comno = Integer.parseInt(request.getParameter("comno"));
         Setting s = service.getcomset(comno);
         mav.addObject("setting", s);
      }
      mav.addObject("job", new Job());
      return mav;
   }

   @PostMapping("comsetting")
   public ModelAndView comsetting(Setting s) {
      ModelAndView mav = new ModelAndView();
      if(s.getComno()==null) s.setComno(0);
      if(s.getUserno()==null) s.setUserno(0);
      service.addset(s);
      mav.setViewName("redirect:recommenduser.shop?comno=" + s.getComno());
      return mav;
   }

   @RequestMapping("recommenduser")
   public ModelAndView recommenduser(HttpServletRequest request) {
      ModelAndView mav = new ModelAndView();
      int comno = Integer.parseInt(request.getParameter("comno"));
      Company com = service.comselect(comno);
      Setting comset = service.getcomset(comno);
      List<Setting> recomUser = new ArrayList<Setting>();
      recomUser = service.getsameuser(comno);
      List<CV> cv = new ArrayList<CV>();
      List<CV> viewcv = new ArrayList<CV>();

      for (int i = 0; i < recomUser.size(); i++) {
         for (int j = 0; j < service.getCVlist(recomUser.get(i).getUserno()).size(); j++) {
            cv = service.getCVlist(recomUser.get(i).getUserno(), comno);
            viewcv.add(cv.get(j));
         }
      }

      mav.addObject("viewcv", viewcv);
      mav.addObject("comset", comset);
      mav.addObject("com", com);
      mav.setViewName("com/recommenduser");
      return mav;
   }

   @RequestMapping("myCurriculumDetail")
   public ModelAndView myCurriculumDetail(HttpServletRequest request) {
      ModelAndView mav = new ModelAndView();
      int cvno = Integer.parseInt(request.getParameter("cvno"));
      CV cv = service.getCV(cvno);
      cv.setCareer(service.getCareer(cvno));
      cv.setActivity(service.getActivity(cvno));
      cv.setLl(service.getLL(cvno));
      cv.setHaveskill(service.getHaveskill(cvno));
      cv.setPortfolio(service.getPortfolio(cvno));
      cv.setResume(service.getResume(cvno));

      System.out.println(cv);

      mav.addObject("cv", cv);
      return mav;
   }

   @PostMapping("updateset")
   public ModelAndView updateset(Setting s) {
      ModelAndView mav = new ModelAndView();
//      if(s.getComno()==null) s.setComno(0);
//      if(s.getUserno()==null) s.setUserno(0);
      service.updatecomset(s);
      mav.setViewName("redirect:recommenduser.shop?comno=" + s.getComno());
      return mav;
   }

   @RequestMapping("comdetail")
   public ModelAndView comdetail(HttpServletRequest request) {
      ModelAndView mav = new ModelAndView();
      String comid = request.getParameter("comid");
      Company com = service.comselect(comid);
      System.out.println("com:" + com);
      mav.addObject("com", com);
      return mav;
   }

   @GetMapping("comupdateform")
   public ModelAndView comupdateform(HttpServletRequest request) throws IOException {
      ModelAndView mav = new ModelAndView();
      String rootPath = request.getSession().getServletContext().getRealPath("/");
      String filePath = rootPath + "\\WEB-INF\\view\\com\\setting.txt";
      File file = new File(filePath);
      FileReader fr = new FileReader(file);
      BufferedReader br = new BufferedReader(fr);
      String line = "";
      String[] str;
      String[] fstr;
      while ((line = br.readLine()) != null) {
         str = line.split(":");
         fstr = str[1].split(",");
         mav.addObject(str[0], fstr);
      }

      String comid = request.getParameter("comid");
      Company com = service.comselect(comid);
      mav.addObject("company", com);
      return mav;
   }

   @PostMapping("comupdateform")
   public ModelAndView comupdate(@Valid Company com, BindingResult bindResult, HttpSession session,
         HttpServletRequest request) throws Exception {
      ModelAndView mav = new ModelAndView();

      if (bindResult.hasErrors()) {
         mav = comupdateform(request);
         mav.addObject("company", com);
         bindResult.reject("error.input.user");
         return mav;
      }
      Company dbcom = service.comselect(com.getComid());
      String password = CipherUtil.encrypt(com.getCompass(), com.getComid());
      if (!dbcom.getCompass().equals(password)) {
         bindResult.reject("error.login.password");
         mav = comupdateform(request);
         mav.addObject("company", com);
         return mav;
      }
      try {
         com.setCompass(password);
         service.comUpdate(com, request);
         mav.addObject("com", service.comselect(com.getComid()));
         mav.setViewName("redirect:commypage.shop?comid=" + com.getComid());
      } catch (Exception e) {
         e.printStackTrace();
         bindResult.reject("error.user.update");
      }
      return mav;

      // End 기환, 태민 부분//
   }

   @PostMapping("writejob")
   public ModelAndView writejob(@Valid Job job, String comid, BindingResult br) {
      ModelAndView mav = new ModelAndView();
      if (br.hasErrors()) {
         br.reject("error.input.user");
         mav.getModel().putAll(br.getModel());
         return mav;
      }
      try {
         service.writeJob(job);
         mav.addObject("msg", "공고등록이 완료되었습니다.");
         mav.addObject("url", "commypage.shop?comid=" + comid);
         mav.setViewName("alert");
      } catch (Exception e) {
         e.printStackTrace();
         throw new LogInException("공고 등록에 실패하였습니다.", "writejobform.shop");
      }
      // 수정함!
      Company com = service.comselect(comid);
      mav.addObject("com", com);
      return mav;
   }

   @RequestMapping("jobdetail")
   public ModelAndView jobdetail(HttpServletRequest request) {
      ModelAndView mav = new ModelAndView();
      Integer jobno = Integer.parseInt(request.getParameter("jobno"));
      Integer comno = Integer.parseInt(request.getParameter("comno"));
      Job job = service.jobselect(jobno, comno);
      Company com = service.comselect(comno);
      mav.addObject("job", job);
      mav.addObject("com", com);
      return mav;
   }

   @RequestMapping("deletejob")
   public ModelAndView deletejob(HttpServletRequest request) {
      ModelAndView mav = new ModelAndView();
      String comid = request.getParameter("comid");
      Integer comno = Integer.parseInt(request.getParameter("comno"));
      Integer jobno = Integer.parseInt(request.getParameter("jobno"));
      try {
         service.deletejob(comno, jobno);
         mav.addObject("msg", "삭제가 완료되었습니다.");
      } catch (Exception e) {
         e.printStackTrace();
         throw new LogInException("삭제 실패. 전산실 문의.", "commypage.shop?comid=" + comid);
      }
      mav.addObject("url", "commypage.shop?comid=" + comid);
      mav.setViewName("alert");
      return mav;
   }

   @RequestMapping("updatejobform")
   public ModelAndView updatejobform(HttpServletRequest request) throws IOException {
      ModelAndView mav = new ModelAndView();
      String rootPath = request.getSession().getServletContext().getRealPath("/");
      String filePath = rootPath + "\\WEB-INF\\view\\com\\setting.txt";
      File file = new File(filePath);
      FileReader fr = new FileReader(file);
      BufferedReader br = new BufferedReader(fr);
      String line = "";
      String[] str;
      String[] fstr;
      while ((line = br.readLine()) != null) {
         str = line.split(":");
         fstr = str[1].split(",");
         mav.addObject(str[0], fstr);
      }
      fr.close();
      br.close();

      Integer comno = Integer.parseInt(request.getParameter("comno"));
      Integer jobno = Integer.parseInt(request.getParameter("jobno"));
      Company com = service.comselect(comno);
      Job job = service.jobselect(jobno, comno);
      mav.addObject("company", com);
      mav.addObject("job", job);
      return mav;
   }

   @GetMapping("compasschg")
   public ModelAndView compasschg(HttpSession session) {
      ModelAndView mav = new ModelAndView();
      Company com = (Company) session.getAttribute("logincom");
      mav.addObject("company", com);
      return mav;
   }

   @PostMapping("compasschg")
   public ModelAndView compasschg(String chgpass, String chgpass2, Company com, BindingResult bindResult,
         HttpServletRequest request) throws IOException {
      ModelAndView mav = new ModelAndView();
      Company dbcom = service.comselect(com.getComid());
      String password = CipherUtil.encrypt(com.getCompass(), com.getComid());

      if (!dbcom.getCompass().equals(password)) {
         mav.setViewName("com/close");
         request.setAttribute("msg", "현재비밀번호를 확인하세요");
         request.setAttribute("url", "compasschg.shop?comid=" + com.getComid());
         request.setAttribute("closable", false);
         mav.addObject("company", com);
         return mav;
      }
      try {
         String cpass = CipherUtil.encrypt(chgpass, com.getComid());
         com.setCompass(cpass);
         service.compasschg(com);
         mav.setViewName("com/close");
         request.setAttribute("msg", "변경완료");
         request.setAttribute("url", "commypage.shop?=" + com.getComid());
         request.setAttribute("closable", true);
      } catch (Exception e) {
         e.printStackTrace();
         bindResult.reject("error.user.update");
      }
      return mav;
   }

   @GetMapping("joblist")
   public ModelAndView joblist(HttpSession session) {
      ModelAndView mav = new ModelAndView();
      Company scom = (Company) session.getAttribute("logincom");
      Company com = service.comselect(scom.getComid());
      List<Job> job = null;
      job = service.jobselect(com.getComno());
      mav.addObject("com", com);
      mav.addObject("job", job);
      return mav;
   }

   @PostMapping("deletejobs")
   public ModelAndView deletejobs(String[] jobcheck) {
      ModelAndView mav = new ModelAndView();
      for (String n : jobcheck) {
         service.deletejob(Integer.parseInt(n));
      }
      mav.setViewName("redirect:joblist.shop");
      return mav;
   }

   // End 해인, 찬웅 부분//

   // 기환, 태민 부분//
   @GetMapping("*")
   public String form(Model model) {
      model.addAttribute(new User());
      model.addAttribute(new Company());
      return null;
   }

   @GetMapping("addpickuser")
   public ModelAndView addpickuser(HttpServletRequest request) {
      ModelAndView mav = new ModelAndView();
      Integer comno = Integer.parseInt(request.getParameter("comno"));
      Integer cvno = Integer.parseInt(request.getParameter("cvno"));
      Pickuser pu = new Pickuser();
      pu.setPickuserno(service.getpumaxno() + 1);
      pu.setComno(comno);
      pu.setCvno(cvno);
      service.addpickuser(pu);
      mav.setViewName("redirect:recommenduser.shop?comno=" + comno);
      return mav;
   }

   @PostMapping("addpickuser")
   public ModelAndView addpickuser2(HttpServletRequest request, String comno, String cvno) {
      ModelAndView mav = new ModelAndView();
      Pickuser pu = new Pickuser();
      String[] cvnos = cvno.split(",");
      for (String s : cvnos) {
         pu.setPickuserno(service.getpumaxno() + 1);
         pu.setComno(Integer.parseInt(comno));
         pu.setCvno(Integer.parseInt(s));
         if (service.selectPU(pu.getComno(), pu.getCvno()).getPickuserno() != 0) {
            continue;
         } else {
            service.addpickuser(pu);
         }
      }
      mav.setViewName("redirect:searchuser.shop");
      return mav;
   }

   @GetMapping("delpickuser")
   public ModelAndView delpickuser(HttpServletRequest request) {
      ModelAndView mav = new ModelAndView();
      Integer comno = Integer.parseInt(request.getParameter("comno"));
      Integer cvno = Integer.parseInt(request.getParameter("cvno"));
      Pickuser pu = new Pickuser();
      pu.setComno(comno);
      pu.setCvno(cvno);
      service.delpickuser(pu);
      mav.setViewName("redirect:recommenduser.shop?comno=" + comno);
      return mav;
   }

   @GetMapping("pickeduser")
   public ModelAndView pickeduser(HttpServletRequest request) {
      ModelAndView mav = new ModelAndView();
      Integer comno = Integer.parseInt(request.getParameter("comno"));
      List<Pickuser> pu = new ArrayList<Pickuser>();
      pu = service.getlist(comno);
      for (Pickuser p : pu) {
         p.setCv(service.getCV(p.getCvno()));
         p.setUser(service.selectOne(p.getCv().getUserno()));
      }
      mav.addObject("pulist", pu);
      return mav;
   }

   @PostMapping("deletepu")
   public ModelAndView deletepu(HttpServletRequest request, String comno, String cvno) {
      ModelAndView mav = new ModelAndView();
      System.out.println(cvno);
      String[] cvnos = cvno.split(",");
      System.out.println(cvnos);
      for (String s : cvnos) {
         service.deletepu(Integer.parseInt(comno), Integer.parseInt(s));
      }
      mav.setViewName("redirect:pickeduser.shop?comno=" + Integer.parseInt(comno));
      return mav;
   }

   @RequestMapping("searchuser")
   public ModelAndView searchuser(HttpServletRequest request) {
      ModelAndView mav = new ModelAndView();
      List<CV> cv = new ArrayList<CV>();
      cv = service.getallCV();
      for (CV c : cv) {
         c.setUser(service.selectOne(c.getUserno()));
      }
      mav.addObject("cvlist", cv);
      return mav;
   }

}