package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.LogInException;
import logic.CV;
import logic.Company;
import logic.PageService;
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
		return null;
	}

	@PostMapping("userEntry")
	public ModelAndView userEntry(@Valid User user, BindingResult bindResult,Company company) {
		ModelAndView mav = new ModelAndView();
		if (bindResult.hasErrors()) {
			mav.getModel().putAll(bindResult.getModel());
			mav.addObject("user", user);
			mav.setViewName("../user/userEntry.shop");
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
				mav.setViewName("user/login");
				mav.addObject("user", user);
//				mav.addObject("company", new Company());
			}
		} catch (Exception e) {
			e.printStackTrace();
			bindResult.reject("error.duplicate.user");
		}
		return mav;
	}

	@PostMapping("companyEntry")
	public ModelAndView userEntry(@Valid Company company, BindingResult bindResult, User user) {
		ModelAndView mav = new ModelAndView();
		if (bindResult.hasErrors()) {
			mav.getModel().putAll(bindResult.getModel());
			mav.addObject("company", company);
			mav.setViewName("../user/userEntry.shop");
			return mav;
		}

		try {
			if (service.comselect(company.getComid()) != null) {
				mav.addObject("msg", "이미 존재하는 아이디입니다.");
				mav.addObject("url", "../user/userEntry.shop");
				mav.setViewName("alert");
				return mav;
			} else {
				service.companyCreate(company);
				mav.setViewName("user/login");
//				mav.addObject("user", new User());
				mav.addObject("company", company);
			}
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
			bindResult.reject("error.duplicate.user");
		}
		return mav;
	}

	@PostMapping("login")
	public ModelAndView login(User user, HttpSession session, Company company) {
		ModelAndView mav = new ModelAndView();
		User dbUser = service.userSelect(user.getId());
		if (dbUser == null) {
			throw new LogInException("아이디 또는 비밀번호가 틀립니다.", "login.shop");
		}
		String password = CipherUtil.messageDigest(user.getPass());
		if (password.equals(dbUser.getPass())) {
			session.setAttribute("loginUser", dbUser);
			mav.setViewName("redirect:main.shop");
		} else {
			return mav;
		}
		return mav;
	}

	@PostMapping("comlogin")
	public ModelAndView login(Company company, HttpSession session, User user) {
		ModelAndView mav = new ModelAndView();
		Company dbCompany = service.comselect(company.getComid());
		if (dbCompany == null) {
			throw new LogInException("아이디 또는 비밀번호가 틀립니다.", "login.shop");
		}
		String compass = CipherUtil.messageDigest(company.getCompass());
		if (compass.equals(dbCompany.getCompass())) {
			session.setAttribute("logincom", dbCompany);
			mav.setViewName("redirect:../com/commypage.shop?comid=" + company.getComid());
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
		return "redirect:login.shop";
	}

	@RequestMapping("main")
	public String checkmain(HttpSession session) {
		return "user/main";
	}

	@GetMapping(value = { "update", "delete" })
	public ModelAndView checkUpdateForm(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = service.userSelect(id);
		mav.addObject("user", user);
		return mav;
	}

	@PostMapping("update")
	public ModelAndView update(@Valid User user, BindingResult bindResult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (bindResult.hasErrors()) {
			bindResult.reject("error.input.user");
			mav.getModel().putAll(bindResult.getModel());
			return mav;
		}
		User loginUser = (User) session.getAttribute("loginUser");
		User dbUser = service.userSelect(user.getId());
		String password = CipherUtil.messageDigest(user.getPass());
		if (!dbUser.getPass().equals(password)) {
			bindResult.reject("error.login.password");
			return mav;
		}
		try {
			user.setPass(password);
			service.userUpdate(user);
			mav.setViewName("redirect:mypage.shop?id=" + user.getId());
			if (!loginUser.getId().equals("admin"))
				password = CipherUtil.messageDigest(user.getPass());
			user.setPass(password);
			session.setAttribute("loginUser", user);
		} catch (Exception e) {
			e.printStackTrace();
			bindResult.reject("error.user.update");
		}
		return mav;
	}

	@PostMapping("delete")
	public ModelAndView delete(User user, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User loginUser = (User) session.getAttribute("loginUser");
		String password = CipherUtil.messageDigest(user.getPass());
		if (!loginUser.getPass().equals(password)) {
			throw new LogInException("비밀번호가 일치하지 않습니다.", "delete.shop?id=" + user.getId());
		}

		try {
			service.userdelete(user);
			if (loginUser.getId().equals("admin")) {
				mav.setViewName("redirect:../admin/list.shop?id=" + loginUser.getId());
			} else {
				session.invalidate();
				mav.addObject("msg", "탈퇴 되었습니다. 안녕히 가세요.");
				mav.addObject("url", "login.shop");
				mav.setViewName("alert");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new LogInException("회원탈퇴를 할 수 없습니다.", "delete.shop?id=" + loginUser.getId());
		}
		return mav;
	}

	@PostMapping("cv")
	public ModelAndView cv(User user, CV cv) {
		ModelAndView mav = new ModelAndView();
		user = service.cvinsert(user.getUserno());
		mav.addObject("user", user);
		mav.addObject("cv", cv);
		return mav;
	}

	@RequestMapping("settingForm")
	public ModelAndView settingForm(HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView();
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		String filePath = rootPath + "\\WEB-INF\\view\\user\\setting.txt";
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
		return mav;
	}

	@RequestMapping(value = { "userInfo", "editUser" })
	public ModelAndView userInfo(String id) {
		ModelAndView mav = new ModelAndView();
		User user = service.userSelect(id);
		mav.addObject("user", user);
		return mav;
	}

	@RequestMapping("passChgForm")
	public ModelAndView passChgForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User loginUser = (User) session.getAttribute("loginUser");
		User user = service.userSelect(loginUser.getId());
		user.setPass(CipherUtil.decrypt(user.getPass()));
		mav.addObject("user", user);
		return mav;
	}

	@PostMapping("userUpdate")
	public ModelAndView userUpdate(User user, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/userInfo");
		service.userUpdate(user, request);
		return mav;
	}

	@PostMapping("setting")
	public ModelAndView setting(SettingArray setting, HttpSession session) {
		ModelAndView mav = new ModelAndView("user/userMyPage"); // 맞춤 공고 페이지 아직 없어서 마이페이지로 일단 보냄.

//		User loginUser = (User)session.getAttribute("loginUser");
//		service.userSetting(loginUser.getUserno(), setting);
		return mav;
	}

	@PostMapping("passChg")
	public ModelAndView passChg(User user) {
		ModelAndView mav = new ModelAndView("user/userMyPage");
		service.passUpdate(user);
		return mav;
	}
}