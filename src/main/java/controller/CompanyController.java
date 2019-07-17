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
	
	@PostMapping("comlogin")
	public ModelAndView login(@Valid Company company,BindingResult bindResult,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(bindResult.hasErrors()) {
			bindResult.reject("error.input.company");
			return mav;
		}
		System.out.println(company.getComid());
		Company dbCompany = service.companySelect(company.getComid());
		if(dbCompany == null) {
			bindResult.reject("error.login.comid");
			return mav;
		}
		String compass =  CipherUtil.messageDigest(company.getCompass());
		if(compass.equals(dbCompany.getCompass())){
			session.setAttribute("loginCompany",dbCompany);
			mav.setViewName("redirect:../com/commypage.shop");	
		}else {
			bindResult.reject("error.login.compass");
			mav.getModel().putAll(bindResult.getModel());
			return mav;
		}
		return mav;
	}
	
	
}
