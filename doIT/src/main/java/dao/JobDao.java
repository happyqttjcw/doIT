package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.CompanyMapper;
import dao.mapper.JobMapper;
import logic.Company;
import logic.Job;
import logic.Setting;

@Repository
public class JobDao {
   @Autowired
   private SqlSessionTemplate sqlSession;
   private final String NS = "dao.mapper.JobMapper.";
   private Map<String, Object> param = new HashMap<>();

   public List<Job> list(int comno) {
      param.clear();
      param.put("comno", comno);
      return sqlSession.selectList(NS + "list", param);
   }

   public void writejob(Job job) {
      job.setJobno(sqlSession.getMapper(JobMapper.class).maxComno()+1);
      sqlSession.getMapper(JobMapper.class).insert(job);
   }

   public Job jobselect(Integer jobno, Integer comno) {
      param.clear();
      param.put("comno", comno);
      param.put("jobno", jobno);
      return sqlSession.selectOne(NS + "list", param);
   }

   public void deletejob(Job job) {
      sqlSession.getMapper(JobMapper.class).deletejob(job);
   }

   public void deletejobbyjobno(Job job) {
      sqlSession.getMapper(JobMapper.class).deletejobbyjobno(job);
   }

	public List<Job> getJobList() {
		param.clear();
		return sqlSession.selectList(NS+"list",param);
	}

	public List<Job> getJobListByStr(String search,String type) {
		param.clear();
		param.put("search", search);
		param.put("type", type);
		return sqlSession.selectList(NS+"list",param);
	}

	public int getJobCnt() {
		param.clear();
		return sqlSession.selectOne(NS+"listCnt",param);
	}

	public int getJobCnt2(String search,String type) {
		param.clear();
		param.put("search", search);
		param.put("type", type);
		return sqlSession.selectOne(NS+"listCnt",param);
	}

	public List<Job> getJobListBySetting(Setting st) {
		param.clear();
		if(st.getSkill() != null)
		param.put("skill", st.getSkill().split(","));
		if(st.getPluse() != null)
		param.put("pluse", st.getPluse().split(","));
		if(st.getLocation() != null)
		param.put("location", st.getLocation().split(","));
		if(st.getJob() != null)
		param.put("job", st.getJob().split(","));
		if(st.getSalary() != null)
		param.put("salary", st.getSalary());
		if(st.getWorkform() != null)
		param.put("workform", st.getWorkform().split(","));
		return sqlSession.selectList(NS+"selectBySetting",param);
	}
}