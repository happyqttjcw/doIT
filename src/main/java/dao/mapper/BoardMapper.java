package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;

public interface BoardMapper {
   
   @Update("update board set readcnt = readcnt +1 where num=#{num}")
   void readcntadd(Integer num);
   
   @Select("select ifnull(max(num),0) from board")
   int maxNum();

   @Insert("insert into board (num, name, pass, subject, content, "
   		+ " file1 , regdate, readcnt, ref, reflevel, refstep)" + 
        " values ( #{num}, #{name}, #{pass}, #{subject}, #{content}, "
        + "#{fileurl}, now(), 0, #{ref}, #{reflevel}, #{refstep})")
   void insert(Board board);

   @Update("update board set refstep = refstep +1 "
   		+ "where ref = #{ref} and refstep > #{refstep}")
   void updateRefStep(Board board);

   @Update("update board set name = #{name}, subject=#{subject}, "
   		+ "content=#{content},file1=#{fileurl} where num= #{num}")
   void update(Board board);

   @Delete("delete from board where num = #{num}")
   void delete(Integer num);
   
   /*
    * key1 : È«±æµ¿, value1 : 15
    * key1 : ±è»ñ°«, value1 : 3
    * 
    * map.put("key1", "È«±æµ¿")
    * map.put("value1", 15)
    * 
    * map.put("key1", "±è»ñ°«")
    * map.put("value1", 3)
    */
   @Select("select name key1, count(*) value1 from board "
   		+ " group by name having count(*) > 0")
   List<Map<String, Object>> graph();
}