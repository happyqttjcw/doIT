package dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.CompanyMapper;
import dao.mapper.UserMapper;
import logic.Activity;
import logic.CV;
import logic.Career;
import logic.Haveskill;
import logic.LL;
import logic.Portfolio;
import logic.Resume;
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
	public User selectOneByNo(Integer userno) {
		param.clear();
		param.put("userno", userno);
		return sqlSession.selectOne(NS + "select", param);
	}
	public User selectOne(int userno) {
		param.clear();
		param.put("userno", userno);
		return sqlSession.selectOne(NS+"select",param);
	}
	public void insert(User user) {
		user.setUserno(sqlSession.getMapper(UserMapper.class).maxUserno() + 1);
		sqlSession.getMapper(UserMapper.class).insert(user);
	}
<<<<<<< HEAD

	public User selectOneById(String id) {
=======
	public int getMaxno() {
		return sqlSession.getMapper(UserMapper.class).maxno();
	}
	public int likeMaxNo() {
		return sqlSession.getMapper(UserMapper.class).likeMaxNo();
	}
	public void likeCreate(Setting st) {
		sqlSession.getMapper(UserMapper.class).likeCreate(st);
	}
	public int getCvno() {
		return sqlSession.getMapper(UserMapper.class).getCvno();
	}
	//커리어//
	public Integer getCareerno() {
		return sqlSession.getMapper(UserMapper.class).getCareerno();
	}
	public void insertCareer(Career cr) {
		sqlSession.getMapper(UserMapper.class).insertCareer(cr);
	}
	/////////
	
	//대외활동//
	public Integer getAcno() {
		return sqlSession.getMapper(UserMapper.class).getAcno();
	}
	public void insertActivity(Activity ac) {
		sqlSession.getMapper(UserMapper.class).insertActivity(ac);
	}
	///////////
	
	//자격증/언어//
	public Integer getNo() {
		return sqlSession.getMapper(UserMapper.class).getNo();
	}
	public void insertLL(LL ll) {
		sqlSession.getMapper(UserMapper.class).insertLL(ll);
	}
	//////////////
	
	//보유기술//
	public Integer getHaveno() {
		return sqlSession.getMapper(UserMapper.class).getHaveno();
	}
	public void insertHaveskill(Haveskill hs) {
		sqlSession.getMapper(UserMapper.class).insertHaveskill(hs);
	}
	//////////////
	
	//포트폴리오//
	public Integer getPortno() {
		return sqlSession.getMapper(UserMapper.class).getPortno();
	}
	public void insertPortfolio(Portfolio pf) {
		sqlSession.getMapper(UserMapper.class).insertPortfolio(pf);
	}
	////////////
	
	public void insertCV(CV cv) {
		sqlSession.getMapper(UserMapper.class).insertCV(cv);
	}
	public int getResumeno() {
		return sqlSession.getMapper(UserMapper.class).getResumeno();
	}
	public void insertResume(Resume rs) {
		sqlSession.getMapper(UserMapper.class).insertResume(rs);
	}
	
	//이력서 검색//
	public CV selectCV(int cvno) {
>>>>>>> refs/remotes/CGH/CGH
		param.clear();
<<<<<<< HEAD
		param.put("id", id);
		return sqlSession.selectOne(NS + "list", param);
=======
		param.put("cvno", cvno);
		return sqlSession.selectOne(NS+"selectCV", param);
>>>>>>> refs/remotes/CGH/CGH
	}
<<<<<<< HEAD

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
=======
	public List<Career> selectCareer(int cvno) {
>>>>>>> refs/remotes/CGH/CGH
		param.clear();
<<<<<<< HEAD
		param.put("ids", idchks);
		return sqlSession.selectList(NS + "list", param);

=======
		param.put("cvno",cvno);
		return sqlSession.selectList(NS+"selectCareer",param);
>>>>>>> refs/remotes/CGH/CGH
	}
<<<<<<< HEAD

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
=======
	public List<Activity> selectActivity(int cvno) {
		param.clear();
		param.put("cvno",cvno);
		return sqlSession.selectList(NS+"selectActivity",param);
	}
	public List<LL> selectLL(int cvno) {
		param.clear();
		param.put("cvno",cvno);
		return sqlSession.selectList(NS+"selectLL",param);
	}
	public List<Haveskill> selectHaveskill(int cvno) {
		param.clear();
		param.put("cvno",cvno);
		return sqlSession.selectList(NS+"selectHaveskill",param);
	}
	public List<Portfolio> selectPortfolio(int cvno) {
		param.clear();
		param.put("cvno",cvno);
		return sqlSession.selectList(NS+"selectPortfolio",param);
	}
	public List<Resume> selectResume(int cvno) {
		param.clear();
		param.put("cvno",cvno);
		return sqlSession.selectList(NS+"selectResume",param);
	}
	//////////////
	public List<CV> getCVlist(int userno) {
		param.clear();
		param.put("userno", userno);
		return sqlSession.selectList(NS+"selectCV",param);
	}
	public Setting getSetting(int userno) {
		param.clear();
		param.put("userno", userno);
		return sqlSession.selectOne(NS+"selectSetting",param);
>>>>>>> refs/remotes/CGH/CGH
	}
}