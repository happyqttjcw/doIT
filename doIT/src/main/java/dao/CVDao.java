package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import logic.CV;

@Repository
public class CVDao {
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

   public List<CV> getallCV() {
	   param.clear();
      return sqlSession.selectList(NS + "list", param);
   }
}