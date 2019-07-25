package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.CompanyMapper;
import dao.mapper.JobMapper;
import logic.Job;

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
}