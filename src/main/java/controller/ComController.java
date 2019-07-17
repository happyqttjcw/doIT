package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

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

	@RequestMapping("*")
	public ModelAndView getCompany(String comid, Integer userno, Integer comno) {
		ModelAndView mav = new ModelAndView();
		Company com = new Company();
		List<Job> job = null;
		List<User> userlist = new ArrayList<User>();
		//Pickuser pu = service.getCV(comno);
		List<Pickuser> pulist = service.getlist(1);//comno
		System.out.println("pulist:" + pulist);
		CV cv = null;
		User user = null;
		List<CV> cvlist = new ArrayList<CV>();
		for(int i=0;i<pulist.size();i++) {
			cv = service.getCV(pulist.get(i).getUserno(), pulist.get(i).getCvno());
			user = service.userselect(pulist.get(i).getUserno());
			System.out.println("user"+user);
			userlist.add(user);
			cvlist.add(cv);
		}
		job = service.jobselect(1);
		com = service.comselect(comid);
		
		System.out.println(com);
//		for(Job j : job) System.out.println(j);
		
		mav.addObject("userlist",userlist);
		mav.addObject("cvlist",cvlist);
		mav.addObject("com", com);
		mav.addObject("job",job);
		
		return mav;
	}
}
