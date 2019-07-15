package controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import exception.LogInException;
import logic.Board;
import logic.Mail;
import logic.PageService;
import logic.User;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private PageService service;
	
	@RequestMapping("list")
	public ModelAndView list(HttpSession session) {
		List<User> list = service.userList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("mailForm")
	public ModelAndView mailForm(String[] idchks, HttpSession session) {
		ModelAndView mav = new ModelAndView("admin/mail");
		if(idchks == null || idchks.length == 0) {
			throw new LogInException("메일을 보낼 대상자를 선택하세요.", "list.shop");
		}
		List<User> list = service.userList(idchks);
		mav.addObject("userList",list);
		return mav;
	}
	
	@RequestMapping("mail")
	public ModelAndView mail(Mail mail, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mailSend(mail);
		mav.addObject("msg","메일전송이 완료되었습니다.");
		mav.addObject("url", "list.shop");
		mav.setViewName("alert");
		return mav;
	}
	
	private final class MyAuthenticator extends Authenticator{
		private String id;
		private String pw;
		public MyAuthenticator(String id, String pw) {
			this.id = id;
			this.pw = pw;
		}
		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(id, pw);
		}
	}
	
	private void mailSend(Mail mail) {
		//네이버에 인증받기 위한 객체
		MyAuthenticator auth = new MyAuthenticator
				(mail.getNaverid(), mail.getNaverpw());
		//메일 전송 환경 설정(map객체)
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.naver.com");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.debug", "true");//false로 보내면 좀 더 빠름.
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "465");
		prop.put("mail.smtp.user", mail.getNaverid());
		prop.put("mail.smtp.socketFactory.port", "465");
		prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		prop.put("mail.smtp.socketFactory.fallback", "false");
		Session session = Session.getInstance(prop, auth);
		//mimeMsg : 하나의 메일 전송 객체
		MimeMessage mimeMsg = new MimeMessage(session);
		try {
			//보내는 사람 이메일 주소 설정
			mimeMsg.setFrom(new InternetAddress(mail.getNaverid()+"@naver.com"));
			//받는 이메일 설정
			List<InternetAddress> addrs = new ArrayList<InternetAddress>();
			String[] emails = mail.getRecipient().split(",");
			for(String email : emails) {
				//email : 받는사람이름<받는사람이메일주소>
				try {
					//"8859_1" : 한글이  
					addrs.add(new InternetAddress(new String(email.getBytes("euc-kr"),"8859_1")));
				}catch(UnsupportedEncodingException ue) {
					ue.printStackTrace();
				}
			}
			InternetAddress[] arr = new InternetAddress[emails.length];
			for(int i=0;i<addrs.size();i++) {
				arr[i] = addrs.get(i);
			}
			mimeMsg.setSentDate(new Date());//보낸 날짜
			//받는 사람의 이메일 설정
			/*
			 * Message.RecipientType.TO : 받는 사람
			 * Message.RecipientType.CC : 보내는 사람 
			 */
			mimeMsg.setRecipients(Message.RecipientType.TO, arr);
			mimeMsg.setSubject(mail.getTitle());
			//내용, 첨부파일1, 첨부파일2..
			MimeMultipart multipart = new MimeMultipart();
			MimeBodyPart message = new MimeBodyPart();
			//내용 설정
			message.setContent(mail.getContents(), mail.getMtype());
			multipart.addBodyPart(message);
			for(MultipartFile mf : mail.getFile1()) {
				if((mf != null) && (!mf.isEmpty())) {
					multipart.addBodyPart(bodyPart(mf));
				}
			}
			mimeMsg.setContent(multipart);
			Transport.send(mimeMsg);
		}catch(MessagingException e) {
			e.printStackTrace();
		}
	}

	private BodyPart bodyPart(MultipartFile mf) {
		MimeBodyPart body = new MimeBodyPart();
		String orgFile = mf.getOriginalFilename();
		File f1 = new File("C:/Users/gd_4/Desktop/spring/mailupload/" + orgFile);
		try {
			mf.transferTo(f1);//파일 업로드
			body.attachFile(f1);
			body.setFileName(new String(orgFile.getBytes("euc-kr"),"8859_1"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		return body;
	}
	
	@RequestMapping("graph*")
	public ModelAndView graph(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = service.graph();
		mav.addObject("map", map);
		return mav;
	}
	
}
