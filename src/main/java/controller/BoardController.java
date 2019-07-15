package controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import exception.LogInException;
import logic.Board;
import logic.PageService;

@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired
	private PageService service;
	
	@RequestMapping("list")
	public ModelAndView list(Integer pageNum, String searchtype, String searchcontent) {
		ModelAndView mav = new ModelAndView();
		int limit = 10;//�� �������� ��µǴ� �Խù� ��
		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		//�˻� ��� �߰� �κ�
		String column = searchtype;
		String find = searchcontent;
		if(column !=null && column.equals("")) column=null;
		if(find !=null && find.equals("")) find=null;
		
		//��ϵ� ��ü �Խù� ����(db���� �����;� ��)
		int listcount = service.boardcount(column, find);
		//�� �������� ǥ�õ� �Խù� ����
		List<Board> boardlist = service.boardlist(pageNum, limit, column, find);
		//�˻� �߰� �κ� ��
				
		//��ü ������ ��
		int maxpage = (int) ((double)listcount/limit + 0.95);
		//ȭ�鿡 ��µ� ���� ������
		int startpage = (int)((pageNum/10.0 + 0.9)- 1)*10+1;
		//ȭ�鿡 ��µ� �� ������
		int endpage = startpage + 9;
		if(endpage > maxpage) endpage = maxpage;
		//��µǴ� ����
		int boardno = listcount - (pageNum - 1) * limit;
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("listcount", listcount);
		mav.addObject("boardlist", boardlist);
		mav.addObject("boardno", boardno);
		return mav;
	}
	
	@GetMapping("*")
	public ModelAndView getBoard(Integer num, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Board board = new Board();
		if(num!=null) {
			board = service.getBoard(num, request);
		}
		mav.addObject("board", board);
		return mav;
	}
	
	@PostMapping("write")
	public ModelAndView write(@Valid Board board, BindingResult br,
											HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if(br.hasErrors()) { return mav; }
		try {
			service.write(board, request);
			mav.setViewName("redirect:list.shop");
		}catch(Exception e) {
			e.printStackTrace();
			throw new LogInException("�Խù� ��Ͽ� �����߽��ϴ�.", "write.shop");
		}
		return mav;
	}
	
	@PostMapping("reply")
	public ModelAndView reply(@Valid Board board, BindingResult br, 
								HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if(br.hasErrors()) { 
			Board dbboard = service.getBoard(board.getNum(), request);
			Map<String, Object> map = br.getModel();
			Board b = (Board)map.get("board");
			b.setSubject(dbboard.getSubject());
			return mav; 
		}
		try {
			service.boardReply(board);
			mav.setViewName("redirect:list.shop");
		}catch(Exception e) {
			e.printStackTrace();
			throw new LogInException("��� ��Ͽ� �����߽��ϴ�.", "write.shop");
		}
		return mav;
	}
	
	
	@RequestMapping("imgupload")
	public String imgupload(MultipartFile upload, String CKEditorFuncNum, 
							HttpServletRequest request, Model model) {
		String path = request.getSession().getServletContext().getRealPath("/")
				+"board/imgfile";
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		if(!upload.isEmpty()) {
			File file = new File(path, upload.getOriginalFilename());
			try {
				upload.transferTo(file);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		String fileName="/shop3/board/imgfile/"+upload.getOriginalFilename();
		model.addAttribute("fileName", fileName );
		model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
		return "ckeditor";
	}
	
	@PostMapping("update")
	public ModelAndView update(@Valid Board board, BindingResult br,
							HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if(br.hasErrors()) return mav;
		
		Board dbboard = service.getBoard(board.getNum(),request);
		if(board.getPass().equals(dbboard.getPass())) {
			try{
				service.boardUpdate(board, request);
				mav.addObject("msg", "������ �Ϸ�Ǿ����ϴ�.");
				mav.addObject("url", "list.shop");
				mav.setViewName("alert");
			}catch(Exception e) {
				e.printStackTrace();
				throw new LogInException("�Խñ� ������ �����߽��ϴ�.", "list.shop");
			}
		}else {
			throw new LogInException("��й�ȣ�� Ȯ���ϼ���.", "update.shop?num="+board.getNum());
		}
		return mav;
	}
	
	@PostMapping("delete")
	public ModelAndView delete(Board board, BindingResult br,
												HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Board dbboard = service.getBoard(board.getNum(), request);
		if(board.getPass()==null || board.getPass().trim().equals("") ||
				!board.getPass().equals(dbboard.getPass())) {
			br.reject("error.login.password");
			return mav;
		}
		try {
			service.boardDelete(board);
			mav.addObject("msg", "�Խù��� �����Ǿ����ϴ�.");
			mav.addObject("url", "list.shop");
			mav.setViewName("alert");
		}catch(Exception e) {
			e.printStackTrace();
			throw new LogInException("�Խù� ���� ����.", "delete.shop?num="+board.getNum());
		}
		return mav;
	}
}
