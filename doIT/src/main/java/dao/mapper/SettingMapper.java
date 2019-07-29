package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Setting;

public interface SettingMapper {

   @Insert("insert into setting values (#{setno},#{comno},#{userno},#{skill},"
         + " #{welfare},#{pluse},#{location},#{job},#{minpay},#{maxpay},"
         + " #{education},#{workform});" )
   void insert(Setting s);

   @Select("select ifnull(max(setno),0) from setting")
   int maxSetno();

   @Update("update setting set skill=#{skill}, welfare=#{welfare}, pluse=#{pluse},"
         + " location=#{location}, job=#{job}, minpay=#{minpay}, maxpay=#{maxpay},"
         + " education=#{education}, workform=#{workform} where comno=#{comno};")
   void updatecomset(Setting s);

   @Update("update setting set skill=#{skill}, welfare=#{welfare}, pluse=#{pluse},"
         + " location=#{location}, job=#{job}, minpay=#{minpay}, maxpay=#{maxpay},"
         + " education=#{education}, workform=#{workform} where userno=#{userno};")
   void updateuserset(Setting s);

   @Select("select * from setting where userno!=0")
   List<Setting> getalluser();

}