package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.ResumeEdit;
import logic.Resumecomment;

public interface BoardMapper {

	@Select("select ifnull(max(commentno),0) from resumecomment")
	int getCommentno();

	@Select("select ifnull(max(ref),0) from resumecomment")
	int getRef();
	
	@Insert("insert into resumecomment (commentno,editno,userno,name,content,date,ref,refstep,reflevel) "
			+ " values(#{commentno},#{editno},#{userno},#{name},#{content},now(),#{ref},#{refstep},#{reflevel})")
	void addComment(Resumecomment rc);

	@Select("select ifnull(max(reflevel),0) from resumecomment where editno = #{editno}")
	int getRefLevel(int editno);

	@Delete("delete from resumecomment where commentno = #{commentno}")
	void delComment(int commentno);
	
	@Select("select ifnull(max(editno),0) from resumeedit")
	int getEditno();

	@Select("select ifnull(max(ref),0) from resumeedit")
	int getEditRef();

	@Insert("insert into resumeedit (editno,resumeno,userno,subject,name,date,content,count,ref)"
			+ " values(#{editno},#{resumeno},#{userno},#{subject},#{name},now(),#{content},0,#{ref})")
	void addWrite(ResumeEdit re);

	@Update("update resumeedit set count = count + 1 where editno = #{editno}")
	void addCount(int editno);

}
