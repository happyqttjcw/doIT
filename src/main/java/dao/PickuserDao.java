package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import logic.Pickuser;

@Repository
public class PickuserDao {
<<<<<<< HEAD
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.PickuserMapper.";
	private Map<String, Object> param = new HashMap<>();
	
	
	public List<Pickuser> list(Integer comno) {
		param.clear();
		param.put("comno", comno);
		return sqlSession.selectList(NS + "list", param);
	}	

}
=======
   @Autowired
   private SqlSessionTemplate sqlSession;
   private final String NS = "dao.mapper.PickuserMapper.";
   private Map<String, Object> param = new HashMap<>();
   
   
   public List<Pickuser> list(Integer comno) {
      param.clear();
      param.put("comno", comno);
      return sqlSession.selectList(NS + "list", param);
   }   

}
>>>>>>> refs/remotes/CGH/CGH
