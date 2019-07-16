package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import logic.User;

public interface UserMapper {
	
	@Insert("insert into user (userno,name,id,pass,age,gender,phone,email)"
				+ " value (#{userno},#{name},#{id},#{pass},#{age},#{gender},#{phone},#{email})")
	void insert(User user);
	
	@Update("update user set name=#{name},"
	            + " age=#{age},phone=#{phone},email=#{email} ,picture=#{picture}"
	            + " where id=#{id}")
	void update(User user);
	
	@Delete("delete from user where id=#{Id}")
	void delete(User user);
	
	
	
	


}
