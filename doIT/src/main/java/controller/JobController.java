package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
      System.out.println(p[0]+","+p[1]+","+p[2]);
      if(p[2].equals("jobList.shop")) {
         list = service.getJobList();
         count = service.getJobCnt();
      } else {
         String search = request.getParameter("search");
         String type = request.getParameter("type");
         System.out.println(search+","+type);
         list = service.jobList(search,type);
         count = service.getJobCnt2(search,type);
         mav.addObject("search", search);
         mav.setViewName("job/jobList");
      }
      mav.addObject("list", list);
      mav.addObject("count", count);
      return mav;
   }
}