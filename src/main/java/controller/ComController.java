package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

import logic.CV;
import logic.Company;
import logic.Job;
import logic.PageService;
import logic.Pickuser;
import logic.User;

@Controller
@RequestMapping("com")
public class ComController {
	@Autowired
	private PageService service;

	// 우리 기업 부분//
	@RequestMapping("commypage")
	public ModelAndView commypage(HttpSession session) {
		//String comid, Integer userno, Integer comno,
		ModelAndView mav = new ModelAndView();
		Company com = (Company)session.getAttribute("logincom");
		CV cv = null;
		User user = null;
		List<Job> job = null;
		List<User> userlist = new ArrayList<User>();
		List<Pickuser> pulist = service.getlist(com.getComno());//comno
		List<CV> cvlist = new ArrayList<CV>();
		
		System.out.println("pulist:" + pulist);
		
		for(int i=0;i<pulist.size();i++) {
			cv = service.getCV(pulist.get(i).getUserno(), pulist.get(i).getCvno());
			user = service.userSelect(pulist.get(i).getUserno());
			System.out.println("user"+user);
			userlist.add(user);
			cvlist.add(cv);
		}
		job = service.jobselect(com.getComno());
		
		mav.addObject("userlist",userlist);
		mav.addObject("cvlist",cvlist);
		mav.addObject("com", com);
		mav.addObject("job",job);
		
		return mav;
	}

	@RequestMapping(value= {"setting","writejob"})
	public ModelAndView setting() throws IOException {
		ModelAndView mav = new ModelAndView();
		File file = new File(
				"C:\\Users\\gd_4\\Desktop\\doIT\\workspace\\doIT\\src\\main\\webapp\\WEB-INF\\view\\com\\setting.txt");
		FileReader fr = new FileReader(file);
		BufferedReader br = new BufferedReader(fr);
		String line = "";
		String[] str;
		String[] fstr;
		while ((line = br.readLine()) != null) {
			str = line.split(":");
			fstr = str[1].split(",");
			mav.addObject(str[0], fstr);
		}
		return mav;
	}

	// End 우리부분//

	// 기환, 태민 부분//
	@GetMapping("*")
	public String form(Model model) {
		model.addAttribute(new User());
		model.addAttribute(new Company());
		return null;
	}

	@PostMapping("companyEntry")
	public ModelAndView userEntry(@Valid Company company, BindingResult bindResult) {
		ModelAndView mav = new ModelAndView();
		if (bindResult.hasErrors()) {
			mav.getModel().putAll(bindResult.getModel());
			mav.addObject("company", company);
			mav.setViewName("../user/userEntry.shop");
			return mav;
		}

		try {
			service.companyCreate(company);
			mav.setViewName("user/login");
			mav.addObject("company", company);
			mav.addObject("user", new User());

		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
			bindResult.reject("error.duplicate.user");
		}
		return mav;
	}
	
	
	// End 기환, 태민 부분//
}
