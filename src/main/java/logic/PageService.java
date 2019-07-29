package logic;

import java.io.File;
import java.security.Key;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.AlgorithmParameterSpec;
import java.util.ArrayList;
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
import dao.SettingDao;
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
	@Autowired
	private SettingDao settingDao;

	// 기업 부분//
	public Company comselect(String comid) {
		Company company = companyDao.selectOne(comid);
		if (company != null) {
			company.setManageremail(CipherUtil.decript(company.getManageremail(), company.getCompass()));
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
		System.out.println("userno" + userno);
		return cvDao.selectOne(userno, cvno);
	}

	public User userSelect(Integer userno) {
		return userDao.selectOneByNo(userno);
	}
	// End 기업부분//

	// 유저부분 - 태민//
	public User userSelect(String id) {
		User user = userDao.selectOneById(id);
		if (user != null) {
			user.setEmail(CipherUtil.decript(user.getEmail(), user.getPass()));
		}
		return user;

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

	public User cvinsert(int userno) {
		// TODO: git에 안올라와 있어서 수정 못함. 0717
		return null;
	}

	// End 유저 부분 - 태민//

	// 유저 부분 - 기환//
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

	public void passUpdate(User user) {
		user.setEmail(CipherUtil.decrypt(user.getEmail(), user.getPass()));
		user.setPass(CipherUtil.encrypt(user.getPass()));
		user.setEmail(CipherUtil.decrypt(user.getEmail(), user.getPass()));
		userDao.passUpdate(user);
	}

	public void writeJob(Job job) {
		jobDao.writejob(job);
	}

	public Job jobselect(Integer jobno, Integer comno) {
		Job job = jobDao.jobselect(jobno, comno);
		return job;
	}

	public Company comselect(Integer comno) {
		Company com = companyDao.selectOneByNo(comno);
		return com;
	}

	public void comUpdate(Company com, HttpServletRequest request) {
		if (com.getCompicture() != null && com.getCompicture().isEmpty()) {
			uploadFileCreate(com.getCompicture(), request, "com/img/");
			com.setCompic(com.getCompicture().getOriginalFilename());
		}
		com.setManageremail(CipherUtil.encrypt(com.getManageremail(), com.getCompass()));
		companyDao.comUpdate(com);

	}

	public void deletejob(Integer comno, Integer jobno) {
		Job job = new Job();
		job.setComno(comno);
		job.setJobno(jobno);
		jobDao.deletejob(job);
	}

	public void deletejob(Integer jobno) {
		Job job = new Job();
		job.setJobno(jobno);
		jobDao.deletejobbyjobno(job);
	}

	public void compasschg(Company com) {
		companyDao.compasschg(com);
	}

	public void addset(Setting s) {
		settingDao.addset(s);
	}

	public Setting getcomset(Integer comno) {
		Setting s = settingDao.getcomset(comno);
		return s;
	}

	public void updatecomset(Setting s) {
		settingDao.updatecomset(s);
	}
	
	public void updateuserset(Setting s) {
		settingDao.updateuserset(s);
	}

	public List<Setting> getsameuser(int comno) {
		Setting comset = settingDao.getcomset(comno);
		String[] comskills = comset.getSkill().split(",");
		String[] comwelfares = comset.getWelfare().split(",");
		String[] compluses = comset.getPluse().split(",");
		String[] comlocs = comset.getLocation().split(",");
		String[] comjobs = comset.getJob().split(",");

		List<Setting> allUserSet = new ArrayList<Setting>();
		List<Setting> sameUserSet = new ArrayList<Setting>();
		allUserSet = settingDao.getalluser();

		for (int i = 0; i < allUserSet.size(); i++) {
			String[] userskills = allUserSet.get(i).getSkill().split(",");
			String[] userwelfares = allUserSet.get(i).getWelfare().split(",");
			String[] userpluses = allUserSet.get(i).getPluse().split(",");
			String[] userlocs = allUserSet.get(i).getLocation().split(",");
			String[] userjobs = allUserSet.get(i).getJob().split(",");

			for (int j = 0; j < comskills.length; j++) {
				for (int k = 0; k < userskills.length; k++) {
					if (comskills[j].equals(userskills[k])) {
						if (sameUserSet.contains(allUserSet.get(i)))
							continue;
						else {
							sameUserSet.add(allUserSet.get(i));
							continue;
						}
					}
				}
			}
			for (int j = 0; j < comwelfares.length; j++) {
				for (int k = 0; k < userwelfares.length; k++) {
					if (comwelfares[j].equals(userwelfares[k])) {
						if (sameUserSet.contains(allUserSet.get(i)))
							continue;
						else {
							sameUserSet.add(allUserSet.get(i));
							continue;
						}
					}
				}
			}
			for (int j = 0; j < compluses.length; j++) {
				for (int k = 0; k < userpluses.length; k++) {
					if (compluses[j].equals(userpluses[k])) {
						if (sameUserSet.contains(allUserSet.get(i)))
							continue;
						else {
							sameUserSet.add(allUserSet.get(i));
							continue;
						}
					}
				}
			}
			for (int j = 0; j < comlocs.length; j++) {
				for (int k = 0; k < userlocs.length; k++) {
					if (comlocs[j].equals(userlocs[k])) {
						if (sameUserSet.contains(allUserSet.get(i)))
							continue;
						else {
							sameUserSet.add(allUserSet.get(i));
							continue;
						}
					}
				}
			}
			for (int j = 0; j < comjobs.length; j++) {
				for (int k = 0; k < userjobs.length; k++) {
					if (comjobs[j].equals(userjobs[k])) {
						if (sameUserSet.contains(allUserSet.get(i)))
							continue;
						else {
							sameUserSet.add(allUserSet.get(i));
							continue;
						}
					}
				}
			}
		}

		return sameUserSet;
	}

	

	// End 유저 부분 - 기환//

}
