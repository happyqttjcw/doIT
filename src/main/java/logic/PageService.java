package logic;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.CompanyDao;
import dao.UserDao;
import security.CipherUtil;

@Service
public class PageService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private CompanyDao companyDao;

	public void userUpdate(User user, HttpServletRequest request) {
		if (user.getPictureUrl() != null && !user.getPictureUrl().isEmpty()) {
			uploadFileCreate(user.getPictureUrl(), request, "user/img/");
			user.setPicture(user.getPictureUrl().getOriginalFilename());
		}
		userDao.update(user);
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

	public User userSelect(String id) {
		User user = userDao.selectOne(id);
		return user;
	}

	public void passUpdate(User user) {
		userDao.passUpdate(user);
	}

	public void userCreate(User user) {
		int maxno = userDao.getMaxno()+1;
		user.setUserno(maxno);
		user.setPass(CipherUtil.encrypt(user.getPass(), user.getId()));
		user.setEmail(CipherUtil.encrypt(user.getEmail(), user.getPass()));
		userDao.insert(user);
	}

	public void companyCreate(Company company) {
		int maxno = companyDao.maxNo();
		company.setComno(maxno);
		company.setCompass(CipherUtil.decrypt(company.getCompass()));
		company.setManageremail(CipherUtil.decrypt(company.getManageremail()));
		companyDao.insert(company);
	}

	public Object companySelect(String comid) {
		return companyDao.selectOne(comid);
	}

	public int likeMaxNo() {
		return userDao.likeMaxNo();
	}

	public void likeCreat(Setting st) {
		userDao.likeCreate(st);
	}

	public int getCvno() {
		return userDao.getCvno();
	}
}
