package logic;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardDao;
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
	private UserDao userDao;
	@Autowired
	private CompanyDao companyDao;
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private PickuserDao	pickuserDao;
	@Autowired
	private CVDao cvDao;
	@Autowired
	private JobDao jobDao;
	@Autowired
	private SettingDao settingDao;
	
	public User userSelect(String id) {
		return userDao.selectOne(id);
	}
	public User userSelect(Integer userno) {
	      return userDao.selectOneByNo(userno);
	}

	public void userCreate(User user) {
		int maxno = userDao.getMaxno()+1;
		user.setUserno(maxno);
		user.setPass(CipherUtil.encrypt(user.getPass(), user.getId()));
		user.setEmail(CipherUtil.encrypt(user.getEmail(), user.getPass()));
		userDao.insert(user);
	}
	
	public User selectOne(int userno) {
		return userDao.selectOneByNo(userno);
	}
	
	public List<CV> getCVlist(int userno, int comno) {
      List<CV> list = userDao.getCVlist(userno);
      for (CV c : list) {
         c.setUser(selectOne(userno));
         c.setPu(selectPU(comno, c.getCvno()));
      }
      return list;
   }

   public List<CV> getCVlist(int userno) {
      List<CV> list = userDao.getCVlist(userno);
      for (CV c : list) {
         c.setUser(selectOne(userno));
      }
      return list;
   }
   public Pickuser selectPU(int comno, int cvno) {
	      if (pickuserDao.selectOne(comno, cvno) == null) {
	         return new Pickuser();
	      } else
	         return pickuserDao.selectOne(comno, cvno);
   }
	public void userUpdate(User user, HttpServletRequest request) {
		if (user.getPictureUrl() != null && !user.getPictureUrl().isEmpty()) {
			uploadFileCreate(user.getPictureUrl(), request, "userImg/");
			user.setPicture(user.getPictureUrl().getOriginalFilename());
		}
		userDao.update(user);
	}

	public void cvImg(CV cv, HttpServletRequest request) {
		if (cv.getPictureUrl() != null && !cv.getPictureUrl().isEmpty()) {
			uploadFileCreate(cv.getPictureUrl(), request, "curriImg/");
			cv.setPicture(cv.getPictureUrl().getOriginalFilename());
		}
	}

	private void uploadFileCreate(MultipartFile picture, HttpServletRequest request, String path) {
		// ���ε�� ���� ������ �̸�
		String orgFile = picture.getOriginalFilename();
		String uploadPath = request.getServletContext().getRealPath("/") + path;
		File fpath = new File(uploadPath);
		if (!fpath.exists())
			fpath.mkdirs();
		try {
			// ���ε�� ���� �����ϱ�
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

	//Ŀ����//
	public Integer getCareerno() {
		return userDao.getCareerno();
	}
	public void insertCareer(Career cr) {
		userDao.insertCareer(cr);
	}
	/////////
	
	//���Ȱ��//
	public Integer getAcno() {
		return userDao.getAcno();
	}
	public void insertActivity(Activity ac) {
		userDao.insertActivity(ac);
	}
	///////////

	//�ڰ���/���//
	public Integer getNo() {
		return userDao.getNo();
	}
	public void insertLL(LL ll) {
		userDao.insertLL(ll);
	}
	/////////////
	
	//�������//
	public Integer getHaveno() {
		return userDao.getHaveno();
	}
	public void insertHaveskill(Haveskill hs) {
		userDao.insertHaveskill(hs);
	}
	///////////

	//��Ʈ������//
	public Integer getPortno() {
		return userDao.getPortno();
	}
	public void insertPortfolio(Portfolio pf) {
		userDao.insertPortfolio(pf);
	}
	/////////////

	//�̷¼�//
	public int getCvno() {
		return userDao.getCvno();
	}
	public void insertCV(CV cv) {
		userDao.insertCV(cv);
	}
	/////////
	
	//�ڼҼ�//
	public int getResumeno() {
		return userDao.getResumeno();
	}
	public void insertResume(Resume rs) {
		userDao.insertResume(rs);
	}
	/////////

	//�̷¼� ã��//
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
	      Company company = companyDao.selectOne(comid);
	      if (company != null) {
	         company.setManageremail(CipherUtil.decrypt(company.getManageremail(), company.getCompass()));
	      }
	      return company;
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
	public List<ResumeEdit> getSearch(String select, String search) {
		return boardDao.getSearch(select, search);
	}
	/////////

	//���㼳��//
	public Setting getSetting(int userno) {
		return userDao.getSetting(userno);
	}
	///////////

	//company//
	public List<Pickuser> getlist(Integer comno) {
	      return pickuserDao.list(comno);
	}
	public CV getCV(Integer userno, Integer cvno) {
	      return cvDao.selectOne(userno, cvno);
	}
	public List<Job> jobselect(Integer comno) {
	      return jobDao.list(comno);
	}
	public Setting getcomset(Integer comno) {
	      Setting s = settingDao.getcomset(comno);
	      return s;
	}
	public void addset(Setting s) {
	      settingDao.addset(s);
	}
	public List<Setting> getsameuser(int comno) {
        Setting comset = settingDao.getcomset(comno);
        if (comset != null)   
            System.out.println("��ų: " +comset.getSkill());
        else {
           return new ArrayList<Setting>();//���࿡ �ش� ����� ���㼳���� ������ return ��.
        }
        //comset �� null�� �ƴ� ���
        String[] comskills = null;
        if (comset.getSkill() != null)
            comskills = comset.getSkill().split(",");
        String[] comwelfares = null;
        if(comset.getWelfare() != null) 
           comwelfares = comset.getWelfare().split(",");
        
        String[] compluses = null;
        if(comset.getPluse() != null)
           compluses = comset.getPluse().split(",");
        
        String[] comlocs = null;
        if(comset.getLocation() != null) 
           comlocs = comset.getLocation().split(",");
        
        String[] comjobs = null;
        if(comset.getJob() != null)  
           comjobs = comset.getJob().split(",");

        List<Setting> allUserSet = new ArrayList<Setting>();
        List<Setting> sameUserSet = new ArrayList<Setting>();
        allUserSet = settingDao.getalluser();
        
        
        for (int i = 0; i < allUserSet.size(); i++) {
           String[] userskills = null;
           if(allUserSet.get(i).getSkill() != null) userskills = allUserSet.get(i).getSkill().split(",") ;
           String[] userwelfares = null;
           if(allUserSet.get(i).getWelfare() != null) userwelfares = allUserSet.get(i).getWelfare().split(",");
           String[] userpluses = null;
           if(allUserSet.get(i).getPluse() != null) userpluses = allUserSet.get(i).getPluse().split(",");
           String[] userlocs = null;
           if(allUserSet.get(i).getLocation() != null) userlocs = allUserSet.get(i).getLocation().split(",");
           String[] userjobs = null;
           if(allUserSet.get(i).getJob() != null) userjobs = allUserSet.get(i).getJob().split(",");

           if(comskills != null && userskills != null) {
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
           }
           if(comwelfares != null && userwelfares != null) {
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
           }
           if(compluses != null && userpluses != null) {
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
           }
           if(comlocs != null && userlocs != null) {
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
           }
           if(comjobs != null && userjobs != null) {
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
        }
        return sameUserSet;
  }
	public void updatecomset(Setting s) {
	      settingDao.updatecomset(s);
	}
	public void comUpdate(Company com, HttpServletRequest request) {
		  if (com.getCompicture() != null && com.getCompicture().isEmpty()) {
		     uploadFileCreate(com.getCompicture(), request, "com/img/");
		     com.setCompic(com.getCompicture().getOriginalFilename());
		  }
		  com.setManageremail(CipherUtil.encrypt(com.getManageremail(), com.getCompass()));
		  companyDao.comUpdate(com);
	}
	public void writeJob(Job job) {
	      jobDao.writejob(job);
	}
	public Job jobselect(Integer jobno, Integer comno) {
	      Job job = jobDao.jobselect(jobno, comno);
	      return job;
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
	public void addResume(Resume rs) {
		userDao.addResume(rs);
	}
	public List<Resume> getResumeListByNo(int userno) {
		return userDao.getResumeListByNo(userno);
	}
	public int getBoardListCnt() {
		return boardDao.getBoardListCnt();
	}
	public Resume getResumeByNo(int resumeno) {
		return userDao.getResumeByNo(resumeno);
	}
	public void delResume(int resumeno) {
		userDao.delResume(resumeno);
	}
	public void updateResume(Resume rs) {
		userDao.updateResume(rs);
	}
	public List<Job> getJobList() {
		List<Job> list = jobDao.getJobList();
		for(Job j : list) {
			j.setCom(companyDao.selectOneByNo(j.getComno()));
		}
		return list;
	}
	public List<Job> jobList(String search, String type) {
		List<Job> list = jobDao.getJobListByStr(search,type);
		for(Job j : list) {
			j.setCom(companyDao.selectOneByNo(j.getComno()));
		}
		return list;
	}
	public List<Job> getjobListBySetting(Setting st) {
		List<Job> list = jobDao.getJobListBySetting(st);
		for(Job j : list) {
			j.setCom(companyDao.selectOneByNo(j.getComno()));
		}
		return list;
	}
	public int getJobCnt() {
		return jobDao.getJobCnt();
	}
	public int getJobCnt2(String search,String type) {
		return jobDao.getJobCnt2(search,type);
	}
	public void likeUpdate(Setting st) {
		userDao.likeUpdate(st);
	}
	
	//8.1//
	//pickjob//
	public int selectPickJob(int jobno, int userno) {
		return userDao.selectPickJob(jobno, userno);
	}
	public int pickJobNo() {
		return userDao.pickJobNo();
	}
	public void insertPickJob(Pickjob pickjob) {
		userDao.insertPickJob(pickjob);
	}
	//////
	public void addpickuser(Pickuser pu) {
	      pickuserDao.insert(pu);
	   }
	public int getpumaxno() {
	      return pickuserDao.puMaxNo();
	   }
	public void delpickuser(Pickuser pu) {
	      pickuserDao.deletepu(pu);
	   }
	public void deletepu(Integer comno, Integer cvno) {
	      Pickuser pu = new Pickuser();
	      pu.setComno(comno);
	      pu.setCvno(cvno);
	      pickuserDao.deletepu(pu);
	   }
	public List<CV> getallCV() {
	      return cvDao.getallCV();
	   }
}
