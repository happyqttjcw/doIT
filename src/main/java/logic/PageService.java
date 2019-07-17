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
		if (user != null) {
			user.setEmail(CipherUtil.decrypt(user.getEmail(), user.getPass()));
		}
		return user;
	}

	public void passUpdate(User user) {
		user.setEmail(CipherUtil.decrypt(user.getEmail(), user.getPass()));
		user.setPass(CipherUtil.encrypt(user.getPass()));
		user.setEmail(CipherUtil.decrypt(user.getEmail(), user.getPass()));
		userDao.passUpdate(user);
	}

	public void userCreate(User user) {
		int maxno = userDao.getMaxno();
		user.setUserno(maxno);
		user.setPass(CipherUtil.encrypt(user.getPass()));
		user.setEmail(CipherUtil.encrypt(user.getEmail(), user.getPass()));
		userDao.insert(user);
	}
}
