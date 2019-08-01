package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Job;

public interface JobMapper {

   @Insert("insert into job (jobno, comno, subject, employ, education, "
         + " major, likecdt, language, skill, gender, startage, endage, "
         + " salary, worklocation, workday, worktime, startdate, enddate, "
         + " receivetype, name, phone, mobile, email, num, field, task, dept, position, cdt, jdate)"
         + " values (#{jobno}, #{comno}, #{subject}, #{employ}, #{education}, #{major}, "
         + " #{likecdt}, #{language}, #{skill}, #{gender}, #{startage}, "
         + " #{endage}, #{salary}, #{worklocation}, #{workday}, #{worktime}, "
         + " #{startdate}, #{enddate}, #{receivetype}, #{name}, #{phone}, #{mobile},"
         + " #{email}, #{num}, #{field}, #{task}, #{dept}, #{position}, #{cdt}, now()); ")
   void insert(Job job);

   @Select("select ifnull(max(jobno),0) from job")
   int maxComno();

   @Delete("delete from job where jobno=#{jobno} and comno=#{comno}")
   void deletejob(Job job);

   @Delete("delete from job where jobno=#{jobno}")
   void deletejobbyjobno(Job job);
   
}