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
import logic.PageService;

@Controller
//@RequestMapping("item") �̷��� �����ؼ� �ؿ���
//@RequestMapping("list") �� �����ص� �ȴ�.
public class ItemController {
	@Autowired
	private PageService service;
	
	@RequestMapping("item/list")
	public ModelAndView list() {
		List<Item> itemList = service.getItemList();
		ModelAndView mav = new ModelAndView(); //WEB-INF/view/item/list.jsp�� ��� ����
		mav.addObject("itemList", itemList);
		return mav;
	}
	
	@RequestMapping("item/*")//* : �Ʒ� �ٸ� Mapping�±׿� ������ �� ���� �͵�.
	public ModelAndView detail(Integer id) {
		Item i = service.getItemDetail(id);
		//* �� ������ ��� �� ���� ����.
		ModelAndView mav = new ModelAndView();
		mav.addObject("item", i);
		return mav;
	}
	
	@RequestMapping("item/create")
	public ModelAndView addForm() {
		ModelAndView mav = new ModelAndView("item/add");
		mav.addObject(new Item());//modelAttribute �±� ������.
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
