package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Company;
import logic.Item;
import logic.ShopService;


@Controller
@RequestMapping("com")
public class ComController {
	@Autowired
	private ShopService service;
	
	@RequestMapping("*")
	public ModelAndView getCompany() {
		ModelAndView mav = new ModelAndView();
		Company com = new Company();
			com = service.comselect("goodee");
		System.out.println(com);
		mav.addObject("com", com);
		return mav;
	}
}
