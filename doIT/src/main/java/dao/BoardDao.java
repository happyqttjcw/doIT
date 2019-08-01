package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import logic.ResumeEdit;
import logic.Resumecomment;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.BoardMapper.";
	private Map<String, Object> param = new HashMap<String, Object>();
	
	public List<ResumeEdit> selectList() {
		param.clear();
		return sqlSession.selectList(NS+"list",param);
	}

	public int getCommentno() {
		return sqlSession.getMapper(BoardMapper.class).getCommentno();
	}

	public int getRef() {
		return sqlSession.getMapper(BoardMapper.class).getRef();
	}

	public ResumeEdit getResumeEdit(int editno) {
		param.clear();
		param.put("editno", editno);
		return sqlSession.selectOne(NS+"select",param);
	}

	public List<Resumecomment> getResumecomment(int editno) {
		param.clear();
		param.put("editno", editno);
		return sqlSession.selectList(NS+"commentList",param);
	}

	public void addComment(Resumecomment rc) {
		sqlSession.getMapper(BoardMapper.class).addComment(rc);		
	}

	public int getRefLevel(int editno) {
		return sqlSession.getMapper(BoardMapper.class).getRefLevel(editno);
	}

	public void delComment(int commentno) {
		sqlSession.getMapper(BoardMapper.class).delComment(commentno);
	}

	public int getEditno() {
		return sqlSession.getMapper(BoardMapper.class).getEditno();
	}

	public int getEditRef() {
		return sqlSession.getMapper(BoardMapper.class).getEditRef();
	}

	public void addWrite(ResumeEdit re) {
		sqlSession.getMapper(BoardMapper.class).addWrite(re);
	}

	public void addCount(int editno) {
		sqlSession.getMapper(BoardMapper.class).addCount(editno);
	}

	public List<ResumeEdit> getSearch(String select, String search) {
		param.clear();
		param.put("select",select);
		param.put("search", search);
		return sqlSession.selectList(NS+"list",param);
	}

	public int getBoardListCnt() {
		return sqlSession.getMapper(BoardMapper.class).getBoardListCnt();
	}
}
