package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import logic.CV;
import logic.Company;
import logic.Job;
import logic.PageService;
import logic.Pickuser;
import logic.User;
import security.CipherUtil;

@Controller
@RequestMapping("com")
public class ComController {
	@Autowired
	private PageService service;

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
		System.out.println("com:" + com);
		if (service.getlist(com.getComno()) == null) {
			pulist = null;
		} else {
			pulist = service.getlist(com.getComno());
		}

		for (int i = 0; i < pulist.size(); i++) {
			cv = service.getCV(pulist.get(i).getUserno(), pulist.get(i).getCvno());
			user = service.userSelect(pulist.get(i).getUserno());
			pulist.get(i).setUser(user);
			pulist.get(i).setCv(cv);
		}
		job = service.jobselect(com.getComno());

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
		mav.addObject("job", new Job());
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

		// System.out.println("com:" + com);
		if (bindResult.hasErrors()) {
			mav = comupdateform(request);
			mav.addObject("company", com);
			bindResult.reject("error.input.user");
			return mav;
		}
		Company dbcom = service.comselect(com.getComid());
		String password = CipherUtil.messageDigest(com.getCompass());
		if (!dbcom.getCompass().equals(password)) {
			bindResult.reject("error.login.password");
			mav = comupdateform(request);
			mav.addObject("company", com);
			return mav;
		}
		try {
			com.setCompass(password);
			service.comUpdate(com, request);
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
		System.out.println(job);
		if (br.hasErrors()) {
			br.reject("error.input.user");
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		try {
			service.writeJob(job);
			mav.setViewName("redirect:commypage.shop");
		} catch (Exception e) {
			e.printStackTrace();
			throw new LogInException("공고 등록에 실패하였습니다.", "writejobform.shop");
		}
		//수정함!
		Company com = service.comselect(comid);
		mav.addObject("com",com);
		return mav;
	}

	@RequestMapping("jobdetail")
	public ModelAndView jobdetail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Integer jobno = Integer.parseInt(request.getParameter("jobno"));
		Integer comno = Integer.parseInt(request.getParameter("comno"));
		Job job = service.jobselect(jobno, comno);
		Company com = service.comselect(comno);
		System.out.println("company?:" + com);
		mav.addObject("job", job);
		mav.addObject("com", com);
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

	// End 기환, 태민 부분//
}
