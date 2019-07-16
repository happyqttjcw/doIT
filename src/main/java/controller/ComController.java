package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Company;
import logic.Job;
import logic.PageService;

@Controller
@RequestMapping("com")
public class ComController {
	@Autowired
	private PageService service;
	
	@RequestMapping("*")
	public ModelAndView getCompany(String comid) {
		ModelAndView mav = new ModelAndView();
		Company com = new Company();
		List<Job> job = null;
		job = service.jobselect(1);
		com = service.comselect(comid);
		System.out.println(com);
		for(Job j : job) System.out.println(j);
		mav.addObject("com", com);
		mav.addObject("job",job);
		return mav;
	}
	
   @RequestMapping("setting")
   public ModelAndView setting() throws IOException {
      ModelAndView mav = new ModelAndView();
      File file = new File("C:\\Users\\gd_4\\Desktop\\doIT\\workspace\\doIT\\src\\main\\webapp\\WEB-INF\\view\\com\\setting.txt");
	  FileReader fr = new FileReader(file);
	  BufferedReader br = new BufferedReader(fr);
	  String line = "";
	  String[] str;
	  String[] fstr;
	  while((line = br.readLine()) != null) {
	     str = line.split(":");
	     fstr = str[1].split(",");
	         mav.addObject(str[0], fstr);
	      }
      return mav;
   }

}
