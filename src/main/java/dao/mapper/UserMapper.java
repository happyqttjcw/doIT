package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Setting;
import logic.User;

public interface UserMapper {
	@Update("update user set name=#{name}, age=#{age}, gender=#{gender}, phone=#{phone}, email=#{email}, picture=#{picture} where userno = #{userno}")
	void update(User user);

	@Update("update user set pass=#{pass} where id=#{id}")
	void passUpdate(User user);

	@Insert("insert into user (userno, name, id, pass, age, gender, phone, email, emailkey, emailkeycheck, picture) "
			+ " values(#{userno},#{name},#{id},#{pass},#{age},#{gender},#{phone},#{email},#{emailkey},#{emailkeycheck},#{picture})")
	void insert(User user);

	@Select("select ifnull(max(userno),0) from user")
	int maxno();

	@Select("select ifnull(max(likeno),0) from culike")
	int likeMaxNo();

	@Insert("insert into culike (likeno, userno, skill, welfare, pluse, location, job, minpay, maxpay, education, workform)"
			+ " values(#{likeno},#{userno},#{skill},#{welfare},#{pluse},#{location},#{job},#{minpay},#{maxpay},#{education},#{workform})")
	void likeCreate(Setting st);
}
