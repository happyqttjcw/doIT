package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.LogInException;
import logic.Activity;
import logic.CV;
import logic.Career;
import logic.Company;
import logic.Haveskill;
import logic.LL;
import logic.Setting;
import logic.PageService;
import logic.Portfolio;
import logic.Resume;
import logic.ResumeEdit;
import logic.SettingArray;
import logic.User;
import security.CipherUtil;

@Controller
@RequestMapping("user")
public class UserController {
   @Autowired
   private PageService service;

   @GetMapping("*")
   public String form(Model model) {
      model.addAttribute(new User());
      model.addAttribute(new Company());
      model.addAttribute(new CV());
      model.addAttribute(new ResumeEdit());
      return null;
   }

   @PostMapping("userEntry")
   public ModelAndView userEntry(@Valid User user, BindingResult bindResult, Company company) {
      ModelAndView mav = new ModelAndView();
      if (bindResult.hasErrors()) {
         mav.getModel().putAll(bindResult.getModel());
         mav.addObject("user", user);
         mav.setViewName("user/userEntry.shop");
         return mav;
      }
      try {
         if (service.userSelect(user.getId()) != null) {
            mav.addObject("msg", "이미 존재하는 아이디입니다.");
            mav.addObject("url", "../user/userEntry.shop");
            mav.setViewName("alert");
            return mav;
         } else {
            service.userCreate(user);
            mav.setViewName("user/userLogin");
            mav.addObject("user", user);
         }
      } catch (Exception e) {
         e.printStackTrace();
         bindResult.reject("error.duplicate.user");
      }
      return mav;
   }

   @PostMapping("userLogin")
   public ModelAndView login(User user, HttpSession session) {
      ModelAndView mav = new ModelAndView();
      User dbUser = service.userSelect(user.getId());
      if (dbUser == null) {
         throw new LogInException("아이디 또는 비밀번호가 틀립니다.", "userLogin.shop");
      }
      String password = CipherUtil.encrypt(user.getPass(), user.getId());
      if (password.equals(dbUser.getPass())) {
         session.setAttribute("loginUser", dbUser);
         mav.setViewName("redirect:userMain.shop");
      } else {
         return mav;
      }
      return mav;
   }
   
   @RequestMapping("logout")
   public String logout(HttpSession session) {
      session.invalidate();
      return "redirect:userLogin.shop";
   }

   @RequestMapping("userMyPage")
   public ModelAndView userMyPage(HttpServletRequest request) {
      ModelAndView mav = new ModelAndView();
      int userno = Integer.parseInt(request.getParameter("userno"));
      User dbUser = service.selectOne(userno);
      List<CV> cv = new ArrayList<CV>();
      cv = service.getCVlist(dbUser.getUserno());
      List<Resume> rs = service.getResumeListByNo(dbUser.getUserno());
      
      
      mav.addObject("cv", cv);
      mav.addObject("user", dbUser);
      mav.addObject("rs",rs);
      return mav;
   }

   @RequestMapping("settingForm")
   public ModelAndView settingForm(HttpSession session, HttpServletRequest request) throws IOException {
      ModelAndView mav = new ModelAndView();
      String path = request.getRealPath("/");
      File file = new File(path + "/WEB-INF/view/user/setting.txt");
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
      int userno = Integer.parseInt(request.getParameter("userno"));
      Setting st = service.getSetting(userno);
      mav.addObject("setting", st);
      return mav;
   }

   @PostMapping(value = { "setting", "settingUpdate" })
   public ModelAndView setting(SettingArray setting, HttpSession sessionm, HttpServletRequest request) {
      ModelAndView mav = new ModelAndView(); // 맞춤 공고 페이지 아직 없어서 마이페이지로 일단 보냄.
      Setting st = new Setting();
      String[] p = request.getServletPath().split("/");
      
      System.out.println(setting);
      String skill = "";
      String welfare = "";
      String pluse = "";
      String location = "";
      String job = "";
      String workform = "";

      int length;
      int i;
      
      if(p[2].equals("setting.shop")) {
         int maxNo = service.likeMaxNo();
         st.setSetno(maxNo + 1);
         st.setUserno(setting.getUserno());
         st.setComno(0);
      }
      
      if (setting.getSkill() != null) {
         length = setting.getSkill().length;
         i = 1;
         for (String str : setting.getSkill()) {
            skill += str;
            i++;
            if (i == length) {
               st.setSkill(skill);
               break;
            } else
               skill += ",";
         }
      } else
         st.setSkill(null);

      if (setting.getWelfare() != null) {
         length = setting.getWelfare().length;
         i = 1;
         for (String str : setting.getWelfare()) {
            welfare += str;
            i++;
            if (i == length) {
               st.setWelfare(welfare);
               break;
            } else
               welfare += ",";
         }
      } else
         st.setWelfare(null);

      if (setting.getPluse() != null) {
         length = setting.getPluse().length;
         i = 1;
         for (String str : setting.getPluse()) {
            pluse += str;
            i++;
            if (i == length) {
               st.setPluse(pluse);
               break;
            } else
               pluse += ",";
         }
      } else
         st.setPluse(null);

      if (setting.getLocation() != null) {
         length = setting.getLocation().length;
         i = 1;
         for (String str : setting.getLocation()) {
            location += str;
            i++;
            if (i == length) {
               st.setLocation(location);
               break;
            } else
               location += ",";
         }
      } else
         st.setLocation(null);

      if (setting.getJob() != null) {
         length = setting.getJob().length;
         i = 1;
         for (String str : setting.getJob()) {
            job += str;
            i++;
            if (i == length) {
               st.setJob(job);
               break;
            } else
               job += ",";
         }
      } else
         st.setJob(null);

      if (setting.getWorkform() != null) {
         length = setting.getWorkform().length;
         i = 1;
         for (String str : setting.getWorkform()) {
            workform += str;
            i++;
            if (i == length) {
               st.setJob(workform);
               break;
            } else
               workform += ",";
         }
      } else
         st.setWorkform(null);
      
      st.setEducation(setting.getEducation());

      System.out.println(st);
      
      if(p[2].equals("setting.shop"))
         service.likeCreat(st);
      else {
         st.setUserno(setting.getUserno());
         service.likeUpdate(st);
      }
      mav.setViewName("redirect:http://localhost:8080/doIT/job/settingJob.shop?userno="+setting.getUserno());
      return mav;
   }   

   @RequestMapping(value = { "userInfo", "editUser" })
   public ModelAndView userInfo(String id) {
      ModelAndView mav = new ModelAndView();
      User user = service.userSelect(id);
      user.setEmail(CipherUtil.decrypt(user.getEmail(), user.getPass()));
      mav.addObject("user", user);
      return mav;
   }

   @RequestMapping("passChgForm")
   public ModelAndView passChgForm(HttpSession session) {
      ModelAndView mav = new ModelAndView();
      User loginUser = (User) session.getAttribute("loginUser");
      User user = service.userSelect(loginUser.getId());
      user.setPass(CipherUtil.decrypt(user.getPass(), user.getId()));
      mav.addObject("user", user);
      return mav;
   }

   @PostMapping("passChg")
   public ModelAndView passChg(User user) {
      ModelAndView mav = new ModelAndView();
      User dbUser = service.userSelect(user.getId());
      user.setEmail(CipherUtil.decrypt(dbUser.getEmail(), dbUser.getPass()));
      user.setPass(CipherUtil.encrypt(user.getPass(), user.getId()));
      user.setEmail(CipherUtil.encrypt(user.getEmail(), user.getPass()));
      service.passUpdate(user);
      mav.setViewName("redirect:userMyPage.shop");
      return mav;
   }

   @PostMapping("userUpdate")
   public ModelAndView userUpdate(User user, HttpServletRequest request) {
      ModelAndView mav = new ModelAndView("user/userInfo");
      User dbUser = service.userSelect(user.getId());
      user.setEmail(CipherUtil.encrypt(user.getEmail(), dbUser.getPass()));
      service.userUpdate(user, request);
      return mav;
   }

   /////////////////////
   /////// cv////////////
   /////////////////////

   @RequestMapping("myCurriculum")
   public ModelAndView myCurriculum(HttpServletRequest request) throws IOException {
      ModelAndView mav = new ModelAndView();
      String path = request.getRealPath("/");
      File file = new File(path + "/WEB-INF/view/user/");

      FileReader fr = new FileReader(file + "/setting.txt");
      BufferedReader br = new BufferedReader(fr);
      String line = "";
      String[] str = null;
      String[] fstr = null;
      while ((line = br.readLine()) != null) {
         str = line.split(":");
         fstr = str[1].split(",");
         mav.addObject(str[0], fstr);
         mav.addObject(str[0] + "2", fstr);
      }

      line = "";
      str = null;
      fstr = null;
      fr = new FileReader(file + "/level.txt");
      br = new BufferedReader(fr);
      while ((line = br.readLine()) != null) {
         str = line.split(":");
         fstr = str[1].split(",");
         mav.addObject(str[0], fstr);
      }

      line = "";
      str = null;
      fstr = null;
      fr = new FileReader(file + "/curriculumJob.txt");
      br = new BufferedReader(fr);
      while ((line = br.readLine()) != null) {
         str = line.split(":");
         fstr = str[1].split(",");
         mav.addObject(str[0], fstr);
      }
      return mav;
   }

   @PostMapping("curriculum")
   public ModelAndView curriculum(CV cv, HttpServletRequest request) {
      ModelAndView mav = new ModelAndView();
      cv.setCvno(service.getCvno());

      service.cvImg(cv, request); // 사진저장

      System.out.println(cv.toString());

      if (cv.getCareer() != null)
         for (Career cr : cv.getCareer()) {
            cr.setCareerno(service.getCareerno());
            cr.setCvno(cv.getCvno());
            System.out.println(cr.toString());
            System.out.println("career 데이터베이스에 저장!");
            try {
               service.insertCareer(cr);
            } catch (Exception e) {
               e.printStackTrace();
            }
         }
      if (cv.getActivity() != null)
         for (Activity ac : cv.getActivity()) {
            ac.setAcno(service.getAcno());
            ac.setCvno(cv.getCvno());
            System.out.println(ac.toString());
            System.out.println("activity 데이터베이스에 저장!");
            try {
               service.insertActivity(ac);
            } catch (Exception e) {
               e.printStackTrace();
            }
         }
      if (cv.getLl() != null)
         for (LL ll : cv.getLl()) {
            ll.setNo(service.getNo());
            ll.setCvno(cv.getCvno());
            System.out.println(ll.toString());
            System.out.println("ll 데이터베이스에 저장!");
            try {
               service.insertLL(ll);
            } catch (Exception e) {
               e.printStackTrace();
            }
         }
      if (cv.getHaveskill() != null)
         for (Haveskill hs : cv.getHaveskill()) {
            hs.setHaveno(service.getHaveno());
            hs.setCvno(cv.getCvno());
            System.out.println(hs.toString());
            System.out.println("haveskill 데이터베이스에 저장!");
            try {
               service.insertHaveskill(hs);
            } catch (Exception e) {
               e.printStackTrace();
            }
         }
      if (cv.getPortfolio() != null)
         for (Portfolio pf : cv.getPortfolio()) {
            pf.setPortno(service.getPortno());
            pf.setCvno(cv.getCvno());
            System.out.println(pf.toString());
            System.out.println("portfolio 데이터베이스에 저장!");
            try {
               service.insertPortfolio(pf);
            } catch (Exception e) {
               e.printStackTrace();
            }
         }
      if (cv.getResume() != null)
         for (Resume rs : cv.getResume()) {
            rs.setResumeno(service.getResumeno());
            rs.setCvno(cv.getCvno());
            System.out.println(rs.toString());
            System.out.println("resume 데이터베이스에 저장!");
            try {
               service.insertResume(rs);
            } catch (Exception e) {
               e.printStackTrace();
            }
         }

      service.insertCV(cv);

      mav.setViewName("redirect:userMyPage.shop?userno="+cv.getUserno());
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

   //////////////////////
   ///// email////////////
   //////////////////////

   @RequestMapping("emailAuth")
   public ModelAndView emailAuth(HttpServletResponse response, HttpServletRequest request) {
      String email = request.getParameter("email");
      String authNum = RandomNum();

      sendEmail(email, authNum);

      ModelAndView mav = new ModelAndView();
      mav.setViewName("user/emailAuth");
      mav.addObject("email", email);
      mav.addObject("authNum", authNum);

      return mav;
   }

   private void sendEmail(String email, String authNum) {
      String host = "smtp.gmail.com";
      String subject = "인증번호";
      String fromName = "doIT 관리자";
      String from = "xoalas55@gmail.com";
      String pass = "rlaxo7080!";
      String to1 = email;
      System.out.println(email);
      String content = "인증번호 [ " + authNum + "]";
      try {
         Properties props = new Properties();
         props.put("mail.smtp.starttls.enable", "true");
         props.put("mail.transport.protocol", "smtp");
         props.put("mail.smtp.host", host);
         props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
         props.put("mail.smtp.port", "465");
         props.put("mail.smtp.user", from);
         props.put("mail.smtp.auth", "true");

         Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(from, pass);
            }
         });
         Message msg = new MimeMessage(mailSession);
         msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "euc-kr", "B")));

         InternetAddress[] address1 = { new InternetAddress(to1) };
         msg.setRecipients(Message.RecipientType.TO, address1);
         msg.setSubject(subject);
         msg.setSentDate(new java.util.Date());
         msg.setContent(content, "text/html; charst=euc-kr");
         Transport.send(msg);
      } catch (MessagingException e) {
         e.printStackTrace();
      } catch (Exception e) {
         e.printStackTrace();
      }

   }

   private String RandomNum() {
      StringBuffer buffer = new StringBuffer();
      for (int i = 0; i <= 6; i++) {
         int n = (int) (Math.random() * 10);
         buffer.append(n);
      }
      return buffer.toString();
   }
   
   //자소서//
//  @PostMapping("saveResume")
//   public ModelAndView saveResume(Resume rs) {
//	      ModelAndView mav = new ModelAndView();
//	      rs.setResumeno(service.getResumeno());
//	      rs.setCvno(null);
//	      rs.setJemokno(null);
//	      rs.setRcontent(rs.getRcontent().replaceAll("\r\n", "<br>"));
//	      service.addResume(rs);
//	      mav.setViewName("redirect:userMyPage.shop?userno="+rs.getUserno());
//	      return mav;
//	   }
//   
//   @RequestMapping(value= { "resumeDetail" , "resumeUpdateForm" })
//   public ModelAndView resume(HttpServletRequest request) {
//      ModelAndView mav = new ModelAndView();
//      int resumeno = Integer.parseInt(request.getParameter("resumeno"));
//      Resume resume = service.getResumeByNo(resumeno);
//      String path = request.getServletPath();
//      String[] realPath = path.split("/");
//      if(realPath[2].equals("resumeUpdateForm.shop"))
//         resume.setRcontent(resume.getRcontent().replaceAll("<br>", "\r\n"));
//      mav.addObject("resume", resume);
//      return mav;
//   }
//   
//   @RequestMapping("resumeDel")
//   public ModelAndView resumeDel(HttpServletRequest request) {
//      ModelAndView mav = new ModelAndView();
//      int resumeno = Integer.parseInt(request.getParameter("resumeno"));
//      int userno = Integer.parseInt(request.getParameter("userno"));
//      service.delResume(resumeno);
//      mav.setViewName("redirect:userMyPage.shop?userno="+userno);
//      return mav;
//   }
//   
//   @PostMapping("resumeUpdate")
//   public ModelAndView resumeUpdate(Resume rs) {
//      ModelAndView mav = new ModelAndView();
//      rs.setRcontent(rs.getRcontent().replaceAll("\r\n", "<br>"));
//      service.updateResume(rs);
//      mav.setViewName("redirect:userMyPage.shop?userno="+rs.getUserno());
//      return mav;
//   }
}