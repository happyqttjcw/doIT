package dao;

import java.util.HashMap;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.UserMapper;
import logic.Setting;
import logic.User;

@Repository
public class UserDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.UserMapper.";
	private Map<String, Object> param = new HashMap<String, Object>();

	public void update(User user) {
		sqlSession.getMapper(UserMapper.class).update(user);
	}
	public void passUpdate(User user) {
		sqlSession.getMapper(UserMapper.class).passUpdate(user);
	}
	public User selectOne(String id) {
		param.clear();
		param.put("id", id);
		return sqlSession.selectOne(NS+"select",param);
	}
	public void insert(User user) {
		sqlSession.getMapper(UserMapper.class).insert(user);
	}
	public int getMaxno() {
		return sqlSession.getMapper(UserMapper.class).maxno();
	}
	public int likeMaxNo() {
		return sqlSession.getMapper(UserMapper.class).likeMaxNo();
	}
	public void likeCreate(Setting st) {
		sqlSession.getMapper(UserMapper.class).likeCreate(st);
	}
}
