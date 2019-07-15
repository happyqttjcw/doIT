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
		//detail.jsp���� �Ѿ���� �Ķ���� �̸��̶� ���� �Ķ���� �̸��� ���ƾ���.
		Item selectedItem = service.getItemDetail(id);
		Cart cart = (Cart)session.getAttribute("CART");
		if(cart == null) {
			cart = new Cart();
			session.setAttribute("CART", cart);
		}
		cart.push(new ItemSet(selectedItem, quantity));
		ModelAndView mav = new ModelAndView("cart/cart");
		mav.addObject("message", selectedItem.getName() + ":" + quantity + 
				"�� ��ٱ��� �߰�");
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
			//remove(idx); :  ������ ItemSet ��ü�� �����Ѵ�.
			selectedItem = cart.getItemSetList().remove(idx);
			mav.addObject("message", selectedItem.getItem().getName() + "��ǰ ��ٱ��Ͽ��� ����");
		}catch(Exception e) {
			e.printStackTrace();
			mav.addObject("message", selectedItem.getItem().getName() + "��ǰ ��ٱ��Ͽ��� ���� ����.");
		}
		mav.addObject("cart", cart);
		return mav;
	}
	@RequestMapping("cartView")
	public ModelAndView view(HttpSession session) {
		ModelAndView mav = new ModelAndView("cart/cart");
		Cart cart = (Cart) session.getAttribute("CART");
		if(cart==null || cart.isEmpty()) {
			throw new CartEmptyException("��ٱ��Ͽ� ��ǰ�� �����ϴ�.","../item/list.shop");
		}
		mav.addObject("cart", cart);
		return mav;
	}
	
	@RequestMapping("checkout")
	   public String checkout(HttpSession session){
	      return "cart/checkout";
	   }
	/*
	 * �ֹ�Ȯ��
	 * 1. �ֹ����̺�(sale), �ֹ���ǰ���̺�(saleitem)�� ���� ���
	 * 2. ��ٱ����� ��ǰ ����
	 * 3. 
	 */
	@RequestMapping("end")
	public ModelAndView checkend(HttpSession session){
		ModelAndView mav = new ModelAndView();
		Cart cart = (Cart)session.getAttribute("CART");
		User loginUser = (User)session.getAttribute("loginUser");
		Sale sale = service.checkEnd(loginUser, cart);
		long tot = cart.getTotal();
		cart.clearAll(session);//��ٱ��� ��ǰ ����
		mav.addObject("sale", sale);
		mav.addObject("tot", tot);
		return mav;
	}
	
	@RequestMapping("*")
	public String cart(HttpSession session){
		return "null";
	}
	
	
}
