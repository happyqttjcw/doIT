package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.JobMapper;
import dao.mapper.SettingMapper;
import logic.Pickuser;
import logic.Setting;

@Repository
public class SettingDao {
   @Autowired
   private SqlSessionTemplate sqlSession;
   private final String NS = "dao.mapper.SettingMapper.";
   private Map<String, Object> param = new HashMap<>();
   
   public void addset(Setting s) {
      s.setSetno(sqlSession.getMapper(SettingMapper.class).maxSetno()+1);
      sqlSession.getMapper(SettingMapper.class).insert(s);
   }

   public Setting getcomset(Integer comno) {
      param.clear();
      param.put("comno", comno);
      return sqlSession.selectOne(NS + "list", param);
   }

   public void updatecomset(Setting s) {
      sqlSession.getMapper(SettingMapper.class).updatecomset(s);
   }

   public List<Setting> getalluser() {
      return sqlSession.getMapper(SettingMapper.class).getalluser();
   }

   public void updateuserset(Setting s) {
      sqlSession.getMapper(SettingMapper.class).updateuserset(s);
   }

}