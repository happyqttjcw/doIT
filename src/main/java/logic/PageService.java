package logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CVDao;
import dao.CompanyDao;
import dao.JobDao;
import dao.PickuserDao;
import dao.UserDao;

@Service
public class PageService {
	@Autowired
	private CompanyDao companyDao;
	@Autowired
	private JobDao jobDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private PickuserDao pickuserDao;
	@Autowired
	private CVDao cvDao;

	public Company comselect(String comid) {
		return companyDao.selectOne(comid);
	}

	public List<Job> jobselect(int comno) {
		System.out.println("comno:"+comno);
		return jobDao.list(comno);
	}

//	public Pickuser getCV(int comno) {
//		return pickuserDao.list(comno);
//	}

	public List<Pickuser> getlist(Integer comno) {
		return pickuserDao.list(comno);
	}

	public CV getCV(Integer userno, Integer cvno) {
		System.out.println("userno"+userno);
		return cvDao.selectOne(userno, cvno);
	}

	public User userselect(Integer userno) {
		return userDao.selectOne(userno);
	}

}
