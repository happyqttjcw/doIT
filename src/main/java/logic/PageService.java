package logic;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardDao;
import dao.CompanyDao;
import dao.UserDao;
import security.CipherUtil;

@Service
public class PageService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private CompanyDao companyDao;
	@Autowired
	private BoardDao boardDao;
	
	public User userSelect(String id) {
		User user = userDao.selectOne(id);
		return user;
	}

	public void userCreate(User user) {
		int maxno = userDao.getMaxno()+1;
		user.setUserno(maxno);
		user.setPass(CipherUtil.encrypt(user.getPass(), user.getId()));
		user.setEmail(CipherUtil.encrypt(user.getEmail(), user.getPass()));
		userDao.insert(user);
	}
	
	public User selectOne(int userno) {
		return userDao.selectOne(userno);
	}
	
	public List<CV> getCVlist(int userno) {
		return userDao.getCVlist(userno);
	}
	
	public void userUpdate(User user, HttpServletRequest request) {
		if (user.getPictureUrl() != null && !user.getPictureUrl().isEmpty()) {
			uploadFileCreate(user.getPictureUrl(), request, "user/img/");
			user.setPicture(user.getPictureUrl().getOriginalFilename());
		}
		userDao.update(user);
	}

	public void cvImg(CV cv, HttpServletRequest request) {
		if (cv.getPictureUrl() != null && !cv.getPictureUrl().isEmpty()) {
			uploadFileCreate(cv.getPictureUrl(), request, "user/curriImg/");
			cv.setPicture(cv.getPictureUrl().getOriginalFilename());
		}
	}

	private void uploadFileCreate(MultipartFile picture, HttpServletRequest request, String path) {
		// 업로드된 실제 파일의 이름
		String orgFile = picture.getOriginalFilename();
		String uploadPath = request.getServletContext().getRealPath("/") + path;
		File fpath = new File(uploadPath);
		if (!fpath.exists())
			fpath.mkdirs();
		try {
			// 업로드된 파일 생성하기
			picture.transferTo(new File(uploadPath + orgFile));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void passUpdate(User user) {
		userDao.passUpdate(user);
	}


	public int likeMaxNo() {
		return userDao.likeMaxNo();
	}

	public void likeCreat(Setting st) {
		userDao.likeCreate(st);
	}

	//커리어//
	public Integer getCareerno() {
		return userDao.getCareerno();
	}
	public void insertCareer(Career cr) {
		userDao.insertCareer(cr);
	}
	/////////
	
	//대외활동//
	public Integer getAcno() {
		return userDao.getAcno();
	}
	public void insertActivity(Activity ac) {
		userDao.insertActivity(ac);
	}
	///////////

	//자격증/언어//
	public Integer getNo() {
		return userDao.getNo();
	}
	public void insertLL(LL ll) {
		userDao.insertLL(ll);
	}
	/////////////
	
	//보유기술//
	public Integer getHaveno() {
		return userDao.getHaveno();
	}
	public void insertHaveskill(Haveskill hs) {
		userDao.insertHaveskill(hs);
	}
	///////////

	//포트폴리오//
	public Integer getPortno() {
		return userDao.getPortno();
	}
	public void insertPortfolio(Portfolio pf) {
		userDao.insertPortfolio(pf);
	}
	/////////////

	//이력서//
	public int getCvno() {
		return userDao.getCvno();
	}
	public void insertCV(CV cv) {
		userDao.insertCV(cv);
	}
	/////////
	
	//자소서//
	public int getResumeno() {
		return userDao.getResumeno();
	}
	public void insertResume(Resume rs) {
		userDao.insertResume(rs);
	}
	/////////

	//이력서 찾기//
	public CV getCV(int cvno) {
		return userDao.selectCV(cvno);
	}
	public List<Career> getCareer(int cvno) {
		return userDao.selectCareer(cvno);
	}
	public List<Activity> getActivity(int cvno) {
		return userDao.selectActivity(cvno);
	}
	public List<LL> getLL(int cvno) {
		return userDao.selectLL(cvno);
	}
	public List<Haveskill> getHaveskill(int cvno) {
		return userDao.selectHaveskill(cvno);
	}
	public List<Portfolio> getPortfolio(int cvno) {
		return userDao.selectPortfolio(cvno);
	}
	public List<Resume> getResume(int cvno) {
		return userDao.selectResume(cvno);
	}
	/////////////

	//company//
	public Company comselect(Integer comno) {
		return companyDao.selectOneByNo(comno);
	}
	public Company comselect(String comid) {
		return companyDao.selectOne(comid);
	}
	public void companyCreate(Company company) {
		String compass = CipherUtil.encrypt(company.getCompass(),company.getComid());
		company.setCompass(compass);
		company.setManageremail(CipherUtil.encrypt(company.getManageremail(), company.getCompass()));
		companyDao.insert(company);

	}
	/////////////
	
	//board//
	public List<ResumeEdit> getResumeList() {
		return boardDao.selectList();
	}
	public int getCommentno() {
		return boardDao.getCommentno();
	}
	public int getRef() {
		return boardDao.getRef();
	}
	public ResumeEdit getResumeEdit(int editno) {
		return boardDao.getResumeEdit(editno);
	}
	public List<Resumecomment> getResumecomment(int editno) {
		return boardDao.getResumecomment(editno);
	}
	public void addComment(Resumecomment rc) {
		boardDao.addComment(rc);
	}
	public int getRefLevel(int editno) {
		return boardDao.getRefLevel(editno);
	}
	public void delComment(int commentno) {
		boardDao.delComment(commentno);		
	}
	public int getEditno() {
		return boardDao.getEditno();
	}
	public int getEditRef() {
		return boardDao.getEditRef();
	}
	public void addWrite(ResumeEdit re) {
		boardDao.addWrite(re);
	}
	public void addCount(int editno) {
		boardDao.addCount(editno);
	}
	/////////


}
