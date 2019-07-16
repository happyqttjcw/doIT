package controller;

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
	@PostMapping("companyEntry")
	public ModelAndView userEntry(@Valid Company company,BindingResult bindResult) {
		ModelAndView mav = new ModelAndView();
		if(bindResult.hasErrors()) {
			mav.getModel().putAll(bindResult.getModel());
			mav.addObject("company",company);
			mav.setViewName("../user/userEntry.shop");
			return mav;
		}
		
		try {
			
			service.companyCreate(company);
			mav.setViewName("user/login");
			mav.addObject("company",company);
			mav.addObject("user",new User());
		
		}catch(DataIntegrityViolationException e) {
			e.printStackTrace();
			bindResult.reject("error.duplicate.user");
		}
		return mav;
	}
	
	
}
