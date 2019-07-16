package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.PageService;

@Controller
@RequestMapping("com")
public class ComController {
	@Autowired
	private PageService service;
	
	@RequestMapping("*")
	public String list() {
		return null;
	}

}
