package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Item;
import logic.ShopService;

@Controller
//@RequestMapping("item") 이렇게 설정해서 밑에를
//@RequestMapping("list") 로 설정해도 된다.
public class ItemController {
	@Autowired
	private ShopService service;
	
	@RequestMapping("item/list")
	public ModelAndView list() {
		List<Item> itemList = service.getItemList();
		ModelAndView mav = new ModelAndView(); //WEB-INF/view/item/list.jsp를 뷰로 지정
		mav.addObject("itemList", itemList);
		return mav;
	}
	
	@RequestMapping("item/*")//* : 아래 다른 Mapping태그에 설정한 것 외의 것들.
	public ModelAndView detail(Integer id) {
		Item i = service.getItemDetail(id);
		//* 로 설정한 경우 뷰 설정 못함.
		ModelAndView mav = new ModelAndView();
		mav.addObject("item", i);
		return mav;
	}
	
	@RequestMapping("item/create")
	public ModelAndView addForm() {
		ModelAndView mav = new ModelAndView("item/add");
		mav.addObject(new Item());//modelAttribute 태그 때문에.
		return mav;
	}
	
	@RequestMapping("item/register")
	public ModelAndView register(@Valid Item item, BindingResult bindResult,
									HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("item/add");
		if(bindResult.hasErrors()) {
			mav.getModel().putAll(bindResult.getModel());
			return mav;
		}
		service.itemCreate(item, request);
		mav.setViewName("redirect:/item/list.shop");
		return mav;
	}
	
	@RequestMapping("item/update")
	public ModelAndView update(@Valid Item item, BindingResult bindResult,
									HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("item/edit");
		if(bindResult.hasErrors()) {
			mav.getModel().putAll(bindResult.getModel());
			return mav;
		}
		service.itemUpdate(item, request);
		mav.setViewName("redirect:/item/list.shop");
		return mav;

	}
	
	@RequestMapping("item/delete")
	public String delete(Integer id) {
		service.itemDelete(id);
		return "redirect:/item/list.shop";
	}
}
