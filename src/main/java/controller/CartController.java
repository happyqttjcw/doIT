package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.CartEmptyException;
import logic.Cart;
import logic.Item;
import logic.ItemSet;
import logic.Sale;
import logic.PageService;
import logic.User;

@Controller
@RequestMapping("cart")
public class CartController {
	@Autowired
	private PageService service;
	
	@RequestMapping("cartAdd")
	public ModelAndView add(Integer id, Integer quantity,
							HttpSession session) {
		//detail.jsp에서 넘어오는 파라미터 이름이랑 위의 파라미터 이름이 같아야함.
		Item selectedItem = service.getItemDetail(id);
		Cart cart = (Cart)session.getAttribute("CART");
		if(cart == null) {
			cart = new Cart();
			session.setAttribute("CART", cart);
		}
		cart.push(new ItemSet(selectedItem, quantity));
		ModelAndView mav = new ModelAndView("cart/cart");
		mav.addObject("message", selectedItem.getName() + ":" + quantity + 
				"개 장바구니 추가");
		mav.addObject("cart", cart);
		return mav;
	}
	
	@RequestMapping("cartDelete")
	public ModelAndView delete(Integer index, HttpSession session) {
		ModelAndView mav = new ModelAndView("cart/cart");
		Cart cart = (Cart)session.getAttribute("CART");
		int idx = index;
		ItemSet selectedItem = null;
		try {
			//remove(idx); :  삭제된 ItemSet 객체를 리턴한다.
			selectedItem = cart.getItemSetList().remove(idx);
			mav.addObject("message", selectedItem.getItem().getName() + "상품 장바구니에서 삭제");
		}catch(Exception e) {
			e.printStackTrace();
			mav.addObject("message", selectedItem.getItem().getName() + "상품 장바구니에서 삭제 실패.");
		}
		mav.addObject("cart", cart);
		return mav;
	}
	@RequestMapping("cartView")
	public ModelAndView view(HttpSession session) {
		ModelAndView mav = new ModelAndView("cart/cart");
		Cart cart = (Cart) session.getAttribute("CART");
		if(cart==null || cart.isEmpty()) {
			throw new CartEmptyException("장바구니에 상품이 없습니다.","../item/list.shop");
		}
		mav.addObject("cart", cart);
		return mav;
	}
	
	@RequestMapping("checkout")
	   public String checkout(HttpSession session){
	      return "cart/checkout";
	   }
	/*
	 * 주문확정
	 * 1. 주문테이블(sale), 주문상품테이블(saleitem)에 내용 등록
	 * 2. 장바구니의 상품 제거
	 * 3. 
	 */
	@RequestMapping("end")
	public ModelAndView checkend(HttpSession session){
		ModelAndView mav = new ModelAndView();
		Cart cart = (Cart)session.getAttribute("CART");
		User loginUser = (User)session.getAttribute("loginUser");
		Sale sale = service.checkEnd(loginUser, cart);
		long tot = cart.getTotal();
		cart.clearAll(session);//장바구니 상품 제거
		mav.addObject("sale", sale);
		mav.addObject("tot", tot);
		return mav;
	}
	
	@RequestMapping("*")
	public String cart(HttpSession session){
		return "null";
	}
	
	
}
