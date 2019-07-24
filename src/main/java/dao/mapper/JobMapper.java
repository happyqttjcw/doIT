package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Job;

public interface JobMapper {

	@Insert("insert into job (jobno, comno, subject, employ, education, "
			+ " major, likecdt, language, skill, gender, startage, endage, "
			+ " salary, worklocation, workday, worktime, startdate, enddate, "
			+ " receivetype, name, phone, mobile, email, num, field, task, dept, position)"
			+ " values (#{jobno}, #{comno}, #{subject}, #{employ}, #{education}, #{major}, "
			+ " #{likecdt}, #{language}, #{skill}, #{gender}, #{startage}, "
			+ " #{endage}, #{salary}, #{worklocation}, #{workday}, #{worktime}, "
			+ " #{startdate}, #{enddate}, #{receivetype}, #{name}, #{phone}, #{mobile},"
			+ " #{email}, #{num}, #{field}, #{task}, #{dept}, #{position}); ")
	void insert(Job job);

	@Select("select ifnull(max(jobno),0) from job")
	int maxComno();
	
}
