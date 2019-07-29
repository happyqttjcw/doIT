package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import logic.CV;

@Repository
public class CVDao {
<<<<<<< HEAD
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.CVMapper.";
	private Map<String, Object> param = new HashMap<>();

	public CV selectOne(Integer userno, Integer cvno) {
		param.clear();
		param.put("userno", userno);
		param.put("cvno", cvno);
		return sqlSession.selectOne(NS + "list", param);
	}

}
=======
   @Autowired
   private SqlSessionTemplate sqlSession;
   private final String NS = "dao.mapper.CVMapper.";
   private Map<String, Object> param = new HashMap<>();

   public CV selectOne(Integer userno, Integer cvno) {
      param.clear();
      param.put("userno", userno);
      param.put("cvno", cvno);
      return sqlSession.selectOne(NS + "list", param);
   }

}
>>>>>>> refs/remotes/CGH/CGH
