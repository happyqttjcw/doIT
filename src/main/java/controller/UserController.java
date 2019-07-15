package controller;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.LogInException;
import logic.Item;
import logic.Sale;
import logic.SaleItem;
import logic.PageService;
import logic.User;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private PageService service;
	
	@GetMapping("*")
	public String form(Model model) {
		model.addAttribute(new User());
		return null;
	}
	
	@PostMapping("userEntry")
	public ModelAndView userEntry(@Valid User user, BindingResult bindResult) throws NoSuchAlgorithmException {
		ModelAndView mav = new ModelAndView();
		if(bindResult.hasErrors()) {
			mav.getModel().putAll(bindResult.getModel());
			return mav;
		}
		try {
			service.userCreate(user);
			mav.setViewName("user/login");
			mav.addObject("user",user);
		}catch(DataIntegrityViolationException e) {
			bindResult.reject("error.duplicate.user");
		}
		return mav;
	}
	
	@PostMapping("login")
	public ModelAndView login(@Valid User user, BindingResult bindResult, 
													HttpSession session) throws NoSuchAlgorithmException {
		ModelAndView mav = new ModelAndView();
		if(bindResult.hasErrors()) {
			bindResult.reject("error.input.user");
			mav.getModel().putAll(bindResult.getModel());
			return mav;
		}
		User dbuser = service.userSelect(user.getUserId());
		if(dbuser == null) {//���̵� �߸� �Է��� ���
			bindResult.reject("error.login.id");
			return mav;
		}
		String password = service.messageDigest(user.getPassword());
		if(password.equals(dbuser.getPassword())) {
			session.setAttribute("loginUser", dbuser);
			mav.setViewName("redirect:main.shop");
			return mav;
		}else {//��й�ȣ �߸� �Է��� ���
			bindResult.reject("error.login.password");
			return mav;
		}
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login.shop";
	}
	
	@RequestMapping("main")
	public String checkmain(HttpSession session) {//�α����� �Ǿ� �ִ��� Ȯ���ϴ� �޼���.
		return "user/main";
	}
	
	@RequestMapping("mypage")
	public ModelAndView checkmypage(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//user :  ����� id�� db����
		User user = service.userSelect(id);
		//salelist : ����� id�� �ֹ����� ��� ����, ���⿡�� ��ǰ ������ ����.
		List<Sale> salelist = service.salelist(id);
		for(Sale sa : salelist) {
			List<SaleItem> saleitemlist = service.saleItemList(sa.getSaleId());//�ֹ� ��ǰ�� ������ ���� �־��ش�. 
			for(SaleItem si : saleitemlist) {
				Item item = service.getItemDetail(si.getItemId());
				si.setItem(item);
			}
			sa.setItemList(saleitemlist);
		}
		mav.addObject("user", user);
		mav.addObject("salelist", salelist);
		return mav;
	}
	
	@GetMapping(value= {"update","delete"})
	public ModelAndView checkUpdateForm(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = service.userSelect(id);
		mav.addObject("user", user);
		return mav;
	}
	
	@PostMapping("update")
	public ModelAndView checkUserUpdate(@Valid User user, BindingResult bindResult, 
									HttpSession session) throws NoSuchAlgorithmException {
		ModelAndView mav = new ModelAndView();
		if(bindResult.hasErrors()) {
			bindResult.reject("error.input.user");
			return mav;
		}
		User loginUser = (User) session.getAttribute("loginUser");
		User dbuser = service.userSelect(user.getUserId());
		String password = service.messageDigest(user.getPassword());
		if(!dbuser.getPassword().equals(password)) {
			bindResult.reject("error.login.password");
			return mav;
		}
		try {
			user.setPassword(password);
			service.userUpdate(user);
			mav.setViewName("redirect:mypage.shop?id="+ user.getUserId());
			if(!loginUser.getUserId().equals("admin")) {
				user.setPassword(password);
				session.setAttribute("loginUser", user);
			}
		}catch(Exception e) {
			e.printStackTrace();
			bindResult.reject("error.user.update");
		}
		return mav;
	}
	/*
	 * 1. �����ڰ� ���� Ż��
	 * 	- ��й�ȣ�� ������ ��й�ȣ �Է��ϱ�.
	 * 	- ������ ��й�ȣ�� �´� ��쿡 �ش� ȸ������ db���� ����.
	 * 	- ���� ���� : mypage.shop���� ������ �̵�
	 * 	- ���� ���� : delete.shop���� ������ �̵�
	 * 2. ���� Ż��
	 * 	- ��й�ȣ�� ���� ��й�ȣ �Է��ϱ�.
	 * 	- ��й�ȣ ��ġ : ȸ������ ����. ���� ����. 
	 * 	- ���� ���� : login.shop ���� �������̵�.
	 * 	- ���� ���� : delete.shop���� ������ �̵�
	 */
	@PostMapping("delete")
	public ModelAndView delete(User user, HttpSession session) throws NoSuchAlgorithmException {
		ModelAndView mav = new ModelAndView();
		User loginUser = (User)session.getAttribute("loginUser");
		String password = service.messageDigest(user.getPassword());
		try {
			if(loginUser.getUserId().equals("admin")) {
				if(password.equals(loginUser.getPassword())) {
					mav.addObject("url","../admin/list.shop");
					mav.addObject("msg","Ż�� �Ǿ����ϴ�. admin ȸ�� ��� �������� �̵��մϴ�.");
					mav.setViewName("alert");
				}else {
					throw new LogInException
							("��й�ȣ�� ��ġ���� �ʽ��ϴ�.","delete.shop?id="+user.getUserId() );
				}
			}else {
				if(password.equals(loginUser.getPassword())) {
					session.invalidate();
					mav.addObject("msg","Ż�� �Ǿ����ϴ�. �ȳ��� ������.");
					mav.addObject("url","login.shop");
					mav.setViewName("alert");
				}else {
					throw new LogInException
						("��й�ȣ�� ��ġ���� �ʽ��ϴ�.","delete.shop?id="+user.getUserId() );
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw new LogInException("ȸ�� ������ �����Ͽ����ϴ�." ,"delete.shop?id="+user.getUserId());
		}
		
		service.deleteUser(user);
		return mav;
	}
}
