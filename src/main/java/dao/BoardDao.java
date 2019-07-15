package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import logic.Board;
import logic.Item;

@Repository
public class BoardDao {
   @Autowired
   private SqlSessionTemplate sqlSession;
   private final String NS = "dao.mapper.BoardMapper.";
   private Map<String, Object> param = new HashMap<>();

   public int count(String column, String find) {
	  param.clear();
	  param.put("column", column);
	  param.put("find", find);
      return sqlSession.selectOne(NS + "count", param);
   }

   public List<Board> list(int pageNum, int limit, String column, String find) {
      param.clear();
      param.put("startrow", (pageNum - 1) * limit);
      param.put("limit", limit);
      param.put("column", column);
      param.put("find", find);
      
      return sqlSession.selectList(NS + "list", param);
   }

   public void readcntadd(Integer num) {
      param.clear();
      param.put("num", num);
      sqlSession.getMapper(BoardMapper.class).readcntadd(num);
   }

   public Board selectOne(Integer num) {
      param.clear();
      param.put("num", num);
      return sqlSession.selectOne(NS + "list", param);
   }

   public void insert(Board board) {
      sqlSession.getMapper(BoardMapper.class).insert(board);
   }

   public int maxNum() {
      return sqlSession.getMapper(BoardMapper.class).maxNum();
   }

   public void updateRefStep(Board board) {
      param.clear();
      param.put("ref", board.getRef());
      param.put("refstep", board.getRefstep());
      sqlSession.getMapper(BoardMapper.class).updateRefStep(board);
   }

   public void update(Board board) {
      sqlSession.getMapper(BoardMapper.class).update(board);
   }

   public void delete(int num) {
      param.clear();
      param.put("num", num);
      sqlSession.getMapper(BoardMapper.class).delete(num);
   }

	public List<Map<String, Object>> graph() {
		return sqlSession.getMapper(BoardMapper.class).graph();
	}
}

