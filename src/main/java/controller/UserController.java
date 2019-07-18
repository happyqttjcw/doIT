package controller;


import java.util.Properties;

import javax.mail.Authenticator;
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


import exception.LoginException;
import logic.CV;
import logic.Company;
import logic.PageService;
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
		return null;
	}
	@PostMapping("userEntry")
	   public ModelAndView userEntry(@Valid User user, BindingResult bindResult) {
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
	            mav.addObject("company", new Company());
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	         bindResult.reject("error.duplicate.user");
	      }
	      return mav;
	}
	
	

//	@PostMapping("login")
//	   public ModelAndView login(@Valid User user , HttpSession session) {
//	      ModelAndView mav = new ModelAndView();
//	      
//	      User dbUser = service.userSelect(user.getId());
//	      
//	      if(dbUser == null) {
//	         return mav;
//	      }
//	      String password = service.messageDigest(user.getPass());
//	      if(password.equals(dbUser.getPass())) {
//	         session.setAttribute("loginUser", dbUser);
//	         mav.setViewName("redirect:main.shop");
//	      } else {
//	    	  System.out.println("비번 틀림");
//	         return mav;
//	      }
//	         // 아이디 없음(), 비밀번호 오류, 화면에 출력
//	         // 로그인 성공 : 세션에 loginUser 이름으로 dbUser 저장 
//	         //         main.shop 리다이렉트
//	      return mav;
//	   }
	
	@PostMapping("login")
	   public ModelAndView login(@Valid User user, BindingResult bindResult , HttpSession session) {
	      ModelAndView mav = new ModelAndView();
	      if(bindResult.hasErrors()) {
	         bindResult.reject("error.input.user");
	         return mav;
	      }
	      
	      User dbUser = service.userSelect(user.getId());
	      
	      if(dbUser == null) {
	         bindResult.reject("error.login.id");
	         return mav;
	      }
	      String password = CipherUtil.messageDigest(user.getPass());
	      if(password.equals(dbUser.getPass())) {
	         session.setAttribute("loginUser", dbUser);
	         mav.setViewName("redirect:usermain.shop");
	      } else {
	    	  mav.addObject("msg", "비밀번호가 틀립니다");
	          mav.addObject("url", "../user/login.shop");
	          mav.setViewName("alert");
	          return mav;
	      }
	      return mav;
	   }
	
	
	@RequestMapping("main")
	public String checkmain(HttpSession session) {
		return "user/main";
	}
	
	
	@PostMapping("companyEntry")
	   public ModelAndView userEntry(@Valid Company company, BindingResult bindResult) {
	      ModelAndView mav = new ModelAndView();
	      if (bindResult.hasErrors()) {
	         mav.getModel().putAll(bindResult.getModel());
	         mav.addObject("company", company);
	         mav.setViewName("../user/userEntry.shop");
	         return mav;
	      }

	      try {
	         if (service.companySelect(company.getComid())!=null) {
	            mav.addObject("msg", "이미 존재하는 아이디입니다.");
	            mav.addObject("url", "../user/userEntry.shop");
	            mav.setViewName("alert");
	            return mav;
	         } else {
	            service.companyCreate(company);
	            mav.setViewName("user/login");
	            mav.addObject("user", new User());
	            mav.addObject("company", company);
	         }
	      } catch (DataIntegrityViolationException e) {
	         e.printStackTrace();
	         bindResult.reject("error.duplicate.user");
	      }
	      return mav;
	   }
	@PostMapping("comlogin")
	public ModelAndView login(@Valid Company company,BindingResult bindResult,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(bindResult.hasErrors()) {
			bindResult.reject("error.input.company");
			return mav;
		}
		Company dbCompany = service.companySelect(company.getComid());
		if(dbCompany == null) {
			bindResult.reject("error.login.comid");
			return mav;
		}
		String compass =  CipherUtil.messageDigest(company.getCompass());
		if(compass.equals(dbCompany.getCompass())){
			session.setAttribute("loginCompany",dbCompany);
			mav.setViewName("redirect:../com/commypage.shop");	
		}else {
			mav.addObject("msg", "비밀번호가 틀립니다..");
            mav.addObject("url", "../user/login.shop");
            mav.setViewName("alert");
			return mav;
		}
		return mav;
	}
	
	@PostMapping("cv")
	public ModelAndView cv(User user,CV cv) {
		ModelAndView mav = new ModelAndView();
		user = service.cvinsert(user.getUserno());
		mav.addObject("user", user);
		mav.addObject("cv",cv);
		return mav;
	}
	@RequestMapping("emailAuth")
	public ModelAndView emailAuth(HttpServletResponse response, HttpServletRequest request) {
		String email = request.getParameter("email");
		String authNum=RandomNum();
		
		sendEmail(email,authNum);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/emailAuth");
		mav.addObject("email",email);
		mav.addObject("authNum",authNum);
		
		
		return mav;
		
	}
	
	private void sendEmail(String email, String authNum) {
		String host= "smtp.gmail.com";
		String subject = "인증번호";
		String fromName = "doIT 관리자";
		String from = "xoalas55@gmail.com";
		String pass="rlaxo7080!";
		String to1 = email;
		System.out.println(email);
		String content ="인증번호 [ " +authNum +"]";
		try {
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable","true");
			props.put("mail.transport.protocol","smtp");
			props.put("mail.smtp.host",host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port","465");
			props.put("mail.smtp.user",from);
			props.put("mail.smtp.auth","true");
			
			Session mailSession = Session.getInstance(props,new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(from,pass);
				}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from,MimeUtility.encodeText(fromName,"euc-kr","B")));
			
			InternetAddress[] address1 = {new InternetAddress(to1)};
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content,"text/html; charst=euc-kr");
			Transport.send(msg);
		}catch(MessagingException e) {
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	private String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for(int i=0; i<=6; i++) {
			int n = (int)(Math.random()*10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	
	
}
