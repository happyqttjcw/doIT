package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import logic.User;

public interface UserMapper {

	@Insert("insert into useraccount (userid, password, username, phoneno, postcode, "
				+ " address, email, birthday) values "
				+ " (#{userId}, #{password}, #{userName}, #{phoneNo}, #{postcode},"
				+ " #{address}, #{email}, #{birthDay});")
	void insert(User user);

	@Update("update useraccount set username=#{userName},"
				+ " phoneno=#{phoneNo}, postcode=#{postcode}, address=#{address}, "
				+ " email=#{email}, birthday=#{birthDay} where userid=#{userId};")
	void update(User updateUser);
	
	@Delete("delete from useraccount where userid=#{userId}")
	void delete(User user);
	
	
	
	
}
