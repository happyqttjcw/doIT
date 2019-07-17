package logic;

import java.security.Key;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.AlgorithmParameterSpec;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.CVDao;
import dao.CompanyDao;
import dao.JobDao;
import dao.PickuserDao;
import dao.UserDao;
import security.CipherUtil;

@Service
public class PageService {
	@Autowired
	private JobDao jobDao;
	@Autowired
	private CompanyDao companyDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private PickuserDao pickuserDao;
	@Autowired
	private CVDao cvDao;

	//기업 부분//
	public Company comselect(String comid) {
		Company company = companyDao.selectOne(comid); 
		if (company != null) {
			company.setManageremail(CipherUtil.decript(company.getManageremail(),company.getCompass()));
		}
		return company;
	}

	public List<Job> jobselect(Integer comno) {
		System.out.println("comno:" + comno);
		return jobDao.list(comno);
	}
	
	public List<Pickuser> getlist(Integer comno) {
		return pickuserDao.list(comno);
	}
	
	public CV getCV(Integer userno, Integer cvno) {
		System.out.println("userno"+userno);
		return cvDao.selectOne(userno, cvno);
	}
	
	
	//End 기업부분//
	
	//유저부분 - 태민//
	public User userSelect(String id) {
		User user = userDao.selectOneById(id);
		if (user != null) {
			user.setEmail(CipherUtil.decript(user.getEmail(), user.getPass()));
		}
		return user;

	}

	public User userSelect(Integer userno) {
		return userDao.selectOneByNo(userno);
	}

	
	public void userCreate(User user) {
		String pass = CipherUtil.messageDigest(user.getPass());
		user.setPass(pass);
		user.setEmail(CipherUtil.encrypt(user.getEmail(), user.getPass()));
		userDao.insert(user);

	}

	public void userUpdate(User user) {
		user.setEmail(CipherUtil.encrypt(user.getEmail(), user.getPass()));
		userDao.update(user);
	}

	public void userdelete(User user) {
		userDao.delete(user);

	}

	public void companyCreate(Company company) {
		String compass = CipherUtil.messageDigest(company.getCompass());
		company.setCompass(compass);
		company.setManageremail(CipherUtil.encrypt(company.getManageremail(), company.getCompass()));
		companyDao.insert(company);

	}
	//End 유저 부분 - 태민//

	

	

	
	
	//유저 부분 - 기환//
	//End 유저 부분 - 기환//
	
}
