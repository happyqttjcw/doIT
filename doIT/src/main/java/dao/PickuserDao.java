package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.JobMapper;
import dao.mapper.PickuserMapper;
import logic.Pickuser;

@Repository
public class PickuserDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.PickuserMapper.";
	private Map<String, Object> param = new HashMap<>();

	public List<Pickuser> list(Integer comno) {
		param.clear();
		param.put("comno", comno);
		return sqlSession.selectList(NS + "list", param);
	}

	public int puMaxNo() {
		return sqlSession.getMapper(PickuserMapper.class).pumaxno();
	}

	public void insert(Pickuser pu) {
		sqlSession.getMapper(PickuserMapper.class).insert(pu);
	}

	public Pickuser selectOne(int comno, int cvno) {
		param.clear();
		param.put("comno", comno);
		param.put("cvno", cvno);
		return sqlSession.selectOne(NS + "list", param);
	}

	public void deletepu(Pickuser pu) {
		sqlSession.getMapper(PickuserMapper.class).deletepu(pu);
	}

}