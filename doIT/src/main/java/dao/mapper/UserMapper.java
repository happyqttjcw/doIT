package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Activity;
import logic.CV;
import logic.Career;
import logic.Haveskill;
import logic.LL;
import logic.Portfolio;
import logic.Resume;
import logic.Setting;
import logic.User;

public interface UserMapper {
	@Update("update user set name=#{name}, age=#{age}, gender=#{gender}, phone=#{phone}, email=#{email}, picture=#{picture} where userno = #{userno}")
	void update(User user);

	@Update("update user set pass=#{pass} where id=#{id}")
	void passUpdate(User user);

	@Insert("insert into user (userno, name, id, pass, age, gender, phone, email, emailkey, emailkeycheck) "
			+ " values(#{userno},#{name},#{id},#{pass},#{age},#{gender},#{phone},#{email},#{emailkey},#{emailkeycheck})")
	void insert(User user);

	@Select("select ifnull(max(userno),0) from user")
	int maxno();

	@Select("select ifnull(max(setno),0) from setting")
	int likeMaxNo();

	@Insert("insert into setting (setno, comno, userno, skill, welfare, pluse, location, job, minpay, maxpay, education, workform)"
			+ " values(#{setno},#{comno},#{userno},#{skill},#{welfare},#{pluse},#{location},#{job},#{minpay},#{maxpay},#{education},#{workform})")
	void likeCreate(Setting st);

	@Select("select count(*) from cv")
	int getCvno();

	@Select("select count(*) from career")
	Integer getCareerno();

	@Insert("insert into career (careerno,cvno,cename,cworkstart,cworkend,creason,cposition1,cposition2,cpyear,cworktype,cworklocation,cdept,csalary,ctask)"
			+ " values(#{careerno},#{cvno},#{cename},#{cworkstart},#{cworkend},#{creason},#{cposition1},#{cposition2},#{cpyear},#{cworktype},#{cworklocation},#{cdept},#{csalary},#{ctask})")
	void insertCareer(Career cr);

	@Select("select count(*) from activity")
	Integer getAcno();

	@Insert("insert into activity (acno,cvno,actype,aclocation,acstart,acend,accontent) "
			+ " values(#{acno},#{cvno},#{actype},#{aclocation},#{acstart},#{acend},#{accontent})")
	void insertActivity(Activity ac);

	@Select("select count(*) from LL")
	Integer getNo();

	@Insert("insert into LL (no,cvno,lltype,llname,llplace,lllang,lltesttype,llscore,lllevel,llpass,llpassdate) "
			+ " values(#{no},#{cvno},#{lltype},#{llname},#{llplace},#{lllang},#{lltesttype},#{llscore},#{lllevel},#{llpass},#{llpassdate})")
	void insertLL(LL ll);

	@Select("select count(*) from haveskill")
	Integer getHaveno();

	@Insert("insert into haveskill (haveno,cvno,hsability,hslevel,hscontent) "
			+ " values(#{haveno},#{cvno},#{hsability},#{hslevel},#{hscontent})")
	void insertHaveskill(Haveskill hs);

	@Select("select count(*) from portfolio")
	Integer getPortno();

	@Insert("insert into portfolio (portno,cvno,porturl,portcontent) values(#{portno},#{cvno},#{porturl},#{portcontent})")
	void insertPortfolio(Portfolio pf);

	@Insert("insert into cv (cvno,userno,publicornot,subject,name,birth,email,phone,addr,picture,school,schoolname,schoollocation,major,daynight,score,skillcontent,bohun,army,"
			+ "armytype,armyclass,armyreason,bohunreason,cdtsalary,cdtlocation1,cdtlocation2,cdtlocation3,cdtjob1,cdtjob2,cdtjob3,cdtjob4,cdtjob5,date)"
			+ " values(#{cvno},#{userno},#{publicornot},#{subject},#{name},#{birth},#{email},#{phone},#{addr},#{picture},#{school},#{schoolname},#{schoollocation},#{major},#{daynight},#{score},"
			+ "#{skillcontent},#{bohun},#{army},#{armytype},#{armyclass},#{armyreason},#{bohunreason},#{cdtsalary},#{cdtlocation1},#{cdtlocation2},#{cdtlocation3},#{cdtjob1},#{cdtjob2},#{cdtjob3},#{cdtjob4},"
			+ "#{cdtjob5},now())")
	void insertCV(CV cv);

	@Select("select count(*) from resume")
	int getResumeno();

	@Insert("insert into resume (resumeno,cvno,jemokno,rsubject,rcontent,rdate) values(#{resumeno},#{cvno},#{jemokno},#{rsubject},#{rcontent},now())")
	void insertResume(Resume rs);
}
