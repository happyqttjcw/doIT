package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import logic.CV;
import logic.Company;
import logic.PageService;
import logic.Resume;
import logic.ResumeEdit;
import logic.Resumecomment;
import logic.User;

@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired
	private PageService service;

	@GetMapping("*")
	public String form(Model model) {
		model.addAttribute(new User());
		model.addAttribute(new Company());
		model.addAttribute(new CV());
		model.addAttribute(new ResumeEdit());
		return null;
	}

	@RequestMapping("resumeBoard")
	public ModelAndView resumeBoard() {
		ModelAndView mav = new ModelAndView();

		List<ResumeEdit> list = new ArrayList<ResumeEdit>();
		list = service.getResumeList();
		int num = service.getBoardListCnt();
		
		
		
		mav.addObject("list", list);
		mav.addObject("num", num);
		return mav;
	}

	@RequestMapping("boardDetail")
	public ModelAndView boardDetail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int editno = Integer.parseInt(request.getParameter("editno"));
		service.addCount(editno);
		ResumeEdit re = service.getResumeEdit(editno);
		List<Resumecomment> rc = service.getResumecomment(editno);
		mav.addObject("re", re);
		mav.addObject("rc", rc);
		return mav;
	}

	@PostMapping("comment")
	public ModelAndView comment(Resumecomment rc) {
		ModelAndView mav = new ModelAndView();
		rc.setCommentno(service.getCommentno() + 1);
		rc.setRef(service.getRef() + 1);
		rc.setRefstep(0);
		rc.setReflevel(service.getRefLevel(rc.getEditno()));
		service.addComment(rc);
		mav.setViewName("redirect:boardDetail.shop?editno=" + rc.getEditno());
		return mav;
	}
	
	@PostMapping("reply")
	public ModelAndView reply(Resumecomment rc) {
		ModelAndView mav = new ModelAndView();
		//editno,name,userno,ref
		rc.setCommentno(service.getCommentno()+1);
		rc.setRefstep(rc.getRef());
		rc.setReflevel(service.getRefLevel(rc.getEditno()));
		service.addComment(rc);
		mav.setViewName("redirect:boardDetail.shop?editno="+rc.getEditno());
		return mav;
	}
	   
	@RequestMapping("commentDel")
	public ModelAndView edit(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int commentno = Integer.parseInt(request.getParameter("commentno"));
		int editno = Integer.parseInt(request.getParameter("editno"));
		service.delComment(commentno);
		mav.setViewName("redirect:boardDetail.shop?editno="+editno);
		return mav;
	}
	
	@RequestMapping("boardWrite")
	public ModelAndView boardWrite(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = (User) session.getAttribute("loginUser");
		mav.addObject("user", user);		
		return mav;
	}
	
	@PostMapping("write")
	public ModelAndView write(ResumeEdit re) {
		ModelAndView mav = new ModelAndView();
		re.setEditno(service.getEditno()+1);
		re.setRef(service.getEditRef()+1);
		re.setContent(re.getContent().replaceAll("\r\n", "<br>"));
		service.addWrite(re);
		mav.setViewName("redirect:resumeBoard.shop?curPage=1");
		return mav;
	}
	
	@PostMapping("search")
	public ModelAndView search(String select, String search) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/resumeBoard");
		List<ResumeEdit> list = service.getSearch(select, search);
		mav.addObject("select",select);
		mav.addObject("search", search);
		mav.addObject("list", list);
		return mav;
	}
}