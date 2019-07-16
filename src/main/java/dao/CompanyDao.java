package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import logic.Company;
import logic.Item;

@Repository
public class CompanyDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.CompanyMapper.";
	private Map<String, Object> param = new HashMap<>();


	public Company selectOne(String comid) {
		param.clear();
		param.put("comid", comid);
		return sqlSession.selectOne(NS + "list", param);
	}
}
