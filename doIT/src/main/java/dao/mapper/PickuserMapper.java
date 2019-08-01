package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Pickuser;

public interface PickuserMapper {


   @Select("select ifnull(max(pickuserno),0) from pickuser")
   int pumaxno();

   @Insert("insert into pickuser (pickuserno, comno, cvno, calluser) values (#{pickuserno}, #{comno}, #{cvno}, 0)")
   void insert(Pickuser pu);

   @Delete("delete from pickuser where comno=#{comno} and cvno=#{cvno}")
   void deletepu(Pickuser pu);

}