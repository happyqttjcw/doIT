package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
<<<<<<< HEAD
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
=======
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.HashMap;
>>>>>>> refs/remotes/CGH/CGH
import java.util.List;
import java.util.Map;
import java.util.Properties;

<<<<<<< HEAD
import javax.servlet.http.HttpServletRequest;
=======
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
>>>>>>> refs/remotes/CGH/CGH
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
<<<<<<< HEAD
import org.springframework.beans.propertyeditors.CustomDateEditor;
=======
>>>>>>> refs/remotes/CGH/CGH
import org.springframework.dao.DataIntegrityViolationException;
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
<<<<<<< HEAD
import logic.CV;
import logic.Company;
import logic.PageService;
import logic.Setting;
=======
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
>>>>>>> refs/remotes/CGH/CGH
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
<<<<<<< HEAD
=======
		model.addAttribute(new CV());
		model.addAttribute(new ResumeEdit());
>>>>>>> refs/remotes/CGH/CGH
		return null;
	}

	@PostMapping("userEntry")
<<<<<<< HEAD
	public ModelAndView userEntry(@Valid User user, BindingResult bindResult,Company company) {
=======
	public ModelAndView userEntry(@Valid User user, BindingResult bindResult, Company company) {
>>>>>>> refs/remotes/CGH/CGH
		ModelAndView mav = new ModelAndView();
		if (bindResult.hasErrors()) {
			mav.getModel().putAll(bindResult.getModel());
			mav.addObject("user", user);
<<<<<<< HEAD
			mav.setViewName("../user/userEntry.shop");
=======
			mav.setViewName("user/userEntry.shop");
>>>>>>> refs/remotes/CGH/CGH
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
<<<<<<< HEAD
//				mav.addObject("company", new Company());
=======
>>>>>>> refs/remotes/CGH/CGH
			}
		} catch (Exception e) {
			e.printStackTrace();
			bindResult.reject("error.duplicate.user");
		}
		return mav;
	}

<<<<<<< HEAD
	

	@PostMapping("userLogin")
	public ModelAndView userLogin(User user, HttpSession session, Company company) {
=======
	@PostMapping("userLogin")
	public ModelAndView login(User user, HttpSession session) {
>>>>>>> refs/remotes/CGH/CGH
		ModelAndView mav = new ModelAndView();
		User dbUser = service.userSelect(user.getId());
		if (dbUser == null) {
			throw new LogInException("아이디 또는 비밀번호가 틀립니다.", "userLogin.shop");
<<<<<<< HEAD
=======
		}
		String password = CipherUtil.encrypt(user.getPass(), user.getId());
		if (password.equals(dbUser.getPass())) {
			session.setAttribute("loginUser", dbUser);
			mav.setViewName("redirect:userMain.shop");
		} else {
			return mav;
>>>>>>> refs/remotes/CGH/CGH
		}
<<<<<<< HEAD
		String password = CipherUtil.messageDigest(user.getPass());
		if (password.equals(dbUser.getPass())) {
			session.setAttribute("loginUser", dbUser);
			mav.setViewName("redirect:main.shop");
		} else {
			return mav;
		}
=======
>>>>>>> refs/remotes/CGH/CGH
		return mav;
	}

	

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:userLogin.shop";
	}

<<<<<<< HEAD
	@RequestMapping("main")
	public String checkmain(HttpSession session) {
		return "user/main";
	}

	@GetMapping(value = { "update", "delete" })
	public ModelAndView checkUpdateForm(String id, HttpSession session) {
=======
	@RequestMapping("userMyPage")
	public ModelAndView userMyPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int userno = Integer.parseInt(request.getParameter("userno"));
		User dbUser = service.selectOne(userno);
		List<CV> cv = new ArrayList<CV>();
		cv = service.getCVlist(dbUser.getUserno());
		
		
		mav.addObject("cv", cv);
		mav.addObject("user", dbUser);
		return mav;
	}

	@RequestMapping("settingForm")
	public ModelAndView settingForm(HttpSession session, HttpServletRequest request) throws IOException {
>>>>>>> refs/remotes/CGH/CGH
		ModelAndView mav = new ModelAndView();
<<<<<<< HEAD
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
=======
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
>>>>>>> refs/remotes/CGH/CGH
		}
		
<<<<<<< HEAD
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
=======
		int userno = Integer.parseInt(request.getParameter("userno"));
		Setting st = service.getSetting(userno);
		mav.addObject("setting", st);
		
>>>>>>> refs/remotes/CGH/CGH
		return mav;
	}

<<<<<<< HEAD
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

//	@PostMapping("setting")
//	   public ModelAndView setting(SettingArray setting, HttpSession session) {
//	      ModelAndView mav = new ModelAndView(); // 맞춤 공고 페이지 아직 없어서 마이페이지로 일단 보냄.
//	      Setting st = new Setting();
//
//	      String skill = "";
//	      String welfare = "";
//	      String pluse = "";
//	      String location = "";
//	      String job = "";
//	      String workform = "";
//
//	      int length;
//	      int i;
//
//	      int maxNo = service.likeMaxNo();
//	      st.setSetno(maxNo + 1);
//	      st.setUserno(setting.getUserno());
//	      st.setComno(null);
//
//	      if (setting.getSkill() != null) {
//	         length = setting.getSkill().length;
//	         i = 1;
//	         for (String str : setting.getSkill()) {
//	            skill += str;
//	            i++;
//	            if (i == length) {
//	               st.setSkill(skill);
//	               break;
//	            } else
//	               skill += ",";
//	         }
//	      } else
//	         st.setSkill(null);
//
//	      if (setting.getWelfare() != null) {
//	         length = setting.getWelfare().length;
//	         i = 1;
//	         for (String str : setting.getWelfare()) {
//	            welfare += str;
//	            i++;
//	            if (i == length) {
//	               st.setWelfare(welfare);
//	               break;
//	            } else
//	               welfare += ",";
//	         }
//	      } else
//	         st.setWelfare(null);
//
//	      if (setting.getPluse() != null) {
//	         length = setting.getPluse().length;
//	         i = 1;
//	         for (String str : setting.getPluse()) {
//	            pluse += str;
//	            i++;
//	            if (i == length) {
//	               st.setPluse(pluse);
//	               break;
//	            } else
//	               pluse += ",";
//	         }
//	      } else
//	         st.setPluse(null);
//
//	      if (setting.getLocation() != null) {
//	         length = setting.getLocation().length;
//	         i = 1;
//	         for (String str : setting.getLocation()) {
//	            location += str;
//	            i++;
//	            if (i == length) {
//	               st.setLocation(location);
//	               break;
//	            } else
//	               location += ",";
//	         }
//	      } else
//	         st.setLocation(null);
//
//	      if (setting.getJob() != null) {
//	         length = setting.getJob().length;
//	         i = 1;
//	         for (String str : setting.getJob()) {
//	            job += str;
//	            i++;
//	            if (i == length) {
//	               st.setJob(job);
//	               break;
//	            } else
//	               job += ",";
//	         }
//	      } else
//	         st.setJob(null);
//
//	      if (setting.getWorkform() != null) {
//	         length = setting.getWorkform().length;
//	         i = 1;
//	         for (String str : setting.getWorkform()) {
//	            workform += str;
//	            i++;
//	            if (i == length) {
//	               st.setJob(workform);
//	               break;
//	            } else
//	               workform += ",";
//	         }
//	      } else
//	         st.setWorkform(null);
//
//	      if (setting.getMinpay() != null)
//	         st.setMinpay(setting.getMinpay());
//	      else
//	         st.setMinpay(null);
//
//	      if (setting.getMaxpay() != null)
//	         st.setMaxpay(setting.getMaxpay());
//	      else
//	         st.setMaxpay(null);
//
//	      st.setEducation(setting.getEducation());
//
//	      service.likeCreat(st);
//
//	      mav.setViewName("redirect:userMyPage.shop?userno="+setting.getUserno());
//	      return mav;
//	   }

	@PostMapping("passChg")
	public ModelAndView passChg(User user) {
		ModelAndView mav = new ModelAndView("user/userMyPage");
		service.passUpdate(user);
		return mav;
	}
	
	@PostMapping("usersetting")
	public ModelAndView comsetting(Setting s) {
		ModelAndView mav = new ModelAndView();
		if(s.getComno()==null) s.setComno(0);
		if(s.getUserno()==null) s.setUserno(0);
		service.addset(s);
		mav.setViewName("redirect:recommendcom.shop?userno="+s.getUserno());
		return mav;
	}
	
	@PostMapping("updateset")
	public ModelAndView updateset(Setting s) {
		ModelAndView mav = new ModelAndView();
		if(s.getComno()==null) s.setComno(0);
		if(s.getUserno()==null) s.setUserno(0);
		service.updateuserset(s);
		mav.setViewName("redirect:recommendcom.shop?userno="+s.getUserno());
		return mav;
	}
}
=======
	@PostMapping("setting")
	public ModelAndView setting(SettingArray setting, HttpSession session) {
		ModelAndView mav = new ModelAndView(); // 맞춤 공고 페이지 아직 없어서 마이페이지로 일단 보냄.
		Setting st = new Setting();

		String skill = "";
		String welfare = "";
		String pluse = "";
		String location = "";
		String job = "";
		String workform = "";

		int length;
		int i;

		int maxNo = service.likeMaxNo();
		st.setSetno(maxNo + 1);
		st.setUserno(setting.getUserno());
		st.setComno(null);

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

		if (setting.getMinpay() != null)
			st.setMinpay(setting.getMinpay());
		else
			st.setMinpay(null);

		if (setting.getMaxpay() != null)
			st.setMaxpay(setting.getMaxpay());
		else
			st.setMaxpay(null);

		st.setEducation(setting.getEducation());

		service.likeCreat(st);

		mav.setViewName("redirect:userMyPage.shop?userno="+setting.getUserno());
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
}
>>>>>>> refs/remotes/CGH/CGH
