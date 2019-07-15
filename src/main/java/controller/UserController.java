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
import logic.ShopService;
import logic.User;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private ShopService service;
	
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
		if(dbuser == null) {//아이디 잘못 입력한 경우
			bindResult.reject("error.login.id");
			return mav;
		}
		String password = service.messageDigest(user.getPassword());
		if(password.equals(dbuser.getPassword())) {
			session.setAttribute("loginUser", dbuser);
			mav.setViewName("redirect:main.shop");
			return mav;
		}else {//비밀번호 잘못 입력한 경우
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
	public String checkmain(HttpSession session) {//로그인이 되어 있는지 확인하는 메서드.
		return "user/main";
	}
	
	@RequestMapping("mypage")
	public ModelAndView checkmypage(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//user :  사용자 id의 db정보
		User user = service.userSelect(id);
		//salelist : 사용자 id의 주문정보 목록 저장, 여기에는 상품 정보가 없음.
		List<Sale> salelist = service.salelist(id);
		for(Sale sa : salelist) {
			List<SaleItem> saleitemlist = service.saleItemList(sa.getSaleId());//주문 상품의 정보를 집어 넣어준다. 
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
	 * 1. 관리자가 강제 탈퇴
	 * 	- 비밀번호에 관리자 비밀번호 입력하기.
	 * 	- 관리자 비밀번호가 맞는 경우에 해당 회원정보 db에서 삭제.
	 * 	- 삭제 성공 : mypage.shop으로 페이지 이동
	 * 	- 삭제 실패 : delete.shop으로 페이지 이동
	 * 2. 본인 탈퇴
	 * 	- 비밀번호에 본인 비밀번호 입력하기.
	 * 	- 비밀번호 일치 : 회원정보 삭제. 세션 삭제. 
	 * 	- 삭제 성공 : login.shop 으로 페이지이동.
	 * 	- 삭제 실패 : delete.shop으로 페이지 이동
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
					mav.addObject("msg","탈퇴 되었습니다. admin 회원 목록 페이지로 이동합니다.");
					mav.setViewName("alert");
				}else {
					throw new LogInException
							("비밀번호가 일치하지 않습니다.","delete.shop?id="+user.getUserId() );
				}
			}else {
				if(password.equals(loginUser.getPassword())) {
					session.invalidate();
					mav.addObject("msg","탈퇴 되었습니다. 안녕히 가세요.");
					mav.addObject("url","login.shop");
					mav.setViewName("alert");
				}else {
					throw new LogInException
						("비밀번호가 일치하지 않습니다.","delete.shop?id="+user.getUserId() );
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw new LogInException("회원 삭제에 실패하였습니다." ,"delete.shop?id="+user.getUserId());
		}
		
		service.deleteUser(user);
		return mav;
	}
}
