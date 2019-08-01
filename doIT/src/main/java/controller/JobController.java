package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Company;
import logic.Job;
import logic.PageService;
import logic.Pickjob;
import logic.Setting;
import logic.User;

@Controller
@RequestMapping("job")
public class JobController {
	@Autowired
	private PageService service;
	
	@GetMapping("*")
	public String form(Model model) {
		model.addAttribute(new User());
		model.addAttribute(new Company());
		model.addAttribute(new Job());
		return null;
	}
	
	@RequestMapping(value= { "jobList" , "searchjob" })
	public ModelAndView jobList(HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView();
		String path = request.getRealPath("/");
		File file = new File(path + "/WEB-INF/view/user/setting.txt");
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
		String[] p = request.getServletPath().split("/");
		int count = 0;
		List<Job> list = null;
		if(p[2].equals("jobList.shop")) {
			list = service.getJobList();
			count = service.getJobCnt();
		} else {
			String search = request.getParameter("search");
			String type = request.getParameter("type");
			list = service.jobList(search,type);
			count = service.getJobCnt2(search,type);
			mav.addObject("search", search);
			mav.setViewName("job/jobList");
		}
		mav.addObject("list", list);
		mav.addObject("count", count);
		return mav;
	}
	
	@RequestMapping("settingJob")
	public ModelAndView settingJob(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int userno = Integer.parseInt(request.getParameter("userno"));
		Setting st = service.getSetting(userno);
		List<Job> list = service.getjobListBySetting(st);
		
		mav.addObject("setting", st);
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("jobdetail")
    public ModelAndView jobdetail(HttpServletRequest request, HttpSession session) {
      ModelAndView mav = new ModelAndView();
      Integer jobno = Integer.parseInt(request.getParameter("jobno"));
      Integer comno = Integer.parseInt(request.getParameter("comno"));
      User user = (User)session.getAttribute("loginUser");
      
      if(user == null) {
    	  mav.addObject("msg", "로그인 후 이용 가능합니다.");
    	  mav.addObject("url", "user/userLogin.shop");
    	  mav.setViewName("alert");
    	  return mav;
      } else {
    	  Job job = service.jobselect(jobno, comno);
    	  Company com = service.comselect(comno);
    	  if(service.selectPickJob(jobno,user.getUserno()) == 0 ) {
    		  System.out.println("insert pickjob");
    		  Pickjob pickjob = new Pickjob();
    		  pickjob.setPickjobno(service.pickJobNo()+1);
    		  pickjob.setJobno(jobno);
    		  pickjob.setUserno(user.getUserno());
    		  pickjob.setReadornot(1);
    		  pickjob.setApply(null);
    		  pickjob.setPick(null);
    		  service.insertPickJob(pickjob);
    	  }
    	  mav.addObject("job", job);
    	  mav.addObject("com", com);    	  
      }
      return mav;
    }
}
