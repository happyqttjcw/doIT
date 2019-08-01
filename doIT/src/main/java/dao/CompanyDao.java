package dao;

import java.util.HashMap;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.CompanyMapper;
import logic.Company;

@Repository
public class CompanyDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.CompanyMapper.";
	private Map<String, Object> param = new HashMap<String, Object>();
	
	public Company selectOne(String comid) {
		param.clear();
		param.put("comid", comid);
		return sqlSession.selectOne(NS + "list", param);
	}

	public void insert(Company company) {
		company.setComno(sqlSession.getMapper(CompanyMapper.class).maxComno() + 1);
		sqlSession.getMapper(CompanyMapper.class).insert(company);

	}

	public Company selectOneByNo(Integer comno) {
		param.clear();
		param.put("comno", comno);
		return sqlSession.selectOne(NS + "list", param);
	}

	public void comUpdate(Company com) {
		param.clear();
		param.put("comid", com.getComid());
		sqlSession.getMapper(CompanyMapper.class).comUpdate(com);
	}

	public void compasschg(Company com) {
		param.clear();
		param.put("compass", com.getCompass());
		param.put("comid", com.getComid());
		sqlSession.getMapper(CompanyMapper.class).compasschg(com);

	}
}
