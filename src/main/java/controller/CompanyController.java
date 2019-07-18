package controller;


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

import logic.Company;
import logic.PageService;
import logic.User;
import security.CipherUtil;



@Controller
@RequestMapping("company")
public class CompanyController {
	@Autowired
	private PageService service;
	
	
	@GetMapping("*")
	public String form(Model model) {
		model.addAttribute(new User());
		model.addAttribute(new Company());
		return null;
	}
	
	
	
}
