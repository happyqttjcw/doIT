package dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import dao.mapper.UserMapper;
import logic.User;

@Repository
public class UserDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.UserMapper.";
	private Map<String, Object> param = new HashMap<String, Object>();

	public void insert(User user) {
		sqlSession.getMapper(UserMapper.class).insert(user);
	}

	public User selectOneById(String id) {
		param.clear();
		param.put("id", id);
		return sqlSession.selectOne(NS + "list", param);
	}

	public void update(User user) {
		sqlSession.getMapper(UserMapper.class).update(user);
	}

	public void delete(User user) {
		sqlSession.getMapper(UserMapper.class).delete(user);
	}

	public List<User> list() {
		return sqlSession.selectList(NS + "list");
	}

	public List<User> list(String[] idchks) {
//		String ids="";
//		for(int i=0; i<idchks.length; i++) {
//			ids+="'"+idchks[i] +((i==idchks.length-1)?"'":"',");
//		}
		param.clear();
		param.put("ids", idchks);
		return sqlSession.selectList(NS + "list", param);

	}

	public User selectOneByNo(Integer userno) {
		param.clear();
		param.put("userno", userno);
		return sqlSession.selectOne(NS + "list", param);
	}

	public User cvinsert(int userno) {
		return sqlSession.getMapper(UserMapper.class).cvinsert(userno);
		
	}

	public void passUpdate(User user) {
		sqlSession.getMapper(UserMapper.class).passUpdate(user);
	}
}