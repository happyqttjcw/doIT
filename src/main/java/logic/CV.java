package logic;

<<<<<<< HEAD
import java.util.Date;

public class CV {
	private int cvno;
	private int userno;
	private String subject;
	private String name;
	private String birth;
	private String email;
	private String phone;
	private String addr;
	private String picture;
	private String school;
	private String schoolname;
	private String schoollocation;
	private String major;
	private String daynight;
	private Double score;
	private String skillcontent;
	private String bohun;
	private String army;
	private String armytype;
	private String armyclass;
	private String armyreason;
	private String bohunreason;
	private String cdtsalary;
	private String cdtlocation1;
	private String cdtlocation2;
	private String cdtlocation3;
	private String cdtjob1;
	private String cdtjob2;
	private String cdtjob3;
	private String cdtjob4;
	private String cdtjob5;
	private int publicornot;
	private Date date;
	private int resumeno;
	public int getCvno() {
		return cvno;
	}
	public void setCvno(int cvno) {
		this.cvno = cvno;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getSchoolname() {
		return schoolname;
	}
	public void setSchoolname(String schoolname) {
		this.schoolname = schoolname;
	}
	public String getSchoollocation() {
		return schoollocation;
	}
	public void setSchoollocation(String schoollocation) {
		this.schoollocation = schoollocation;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getDaynight() {
		return daynight;
	}
	public void setDaynight(String daynight) {
		this.daynight = daynight;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	public String getSkillcontent() {
		return skillcontent;
	}
	public void setSkillcontent(String skillcontent) {
		this.skillcontent = skillcontent;
	}
	public String getBohun() {
		return bohun;
	}
	public void setBohun(String bohun) {
		this.bohun = bohun;
	}
	public String getArmy() {
		return army;
	}
	public void setArmy(String army) {
		this.army = army;
	}
	public String getArmytype() {
		return armytype;
	}
	public void setArmytype(String armytype) {
		this.armytype = armytype;
	}
	public String getArmyclass() {
		return armyclass;
	}
	public void setArmyclass(String armyclass) {
		this.armyclass = armyclass;
	}
	public String getArmyreason() {
		return armyreason;
	}
	public void setArmyreason(String armyreason) {
		this.armyreason = armyreason;
	}
	public String getBohunreason() {
		return bohunreason;
	}
	public void setBohunreason(String bohunreason) {
		this.bohunreason = bohunreason;
	}
	public String getCdtsalary() {
		return cdtsalary;
	}
	public void setCdtsalary(String cdtsalary) {
		this.cdtsalary = cdtsalary;
	}
	public String getCdtlocation1() {
		return cdtlocation1;
	}
	public void setCdtlocation1(String cdtlocation1) {
		this.cdtlocation1 = cdtlocation1;
	}
	public String getCdtlocation2() {
		return cdtlocation2;
	}
	public void setCdtlocation2(String cdtlocation2) {
		this.cdtlocation2 = cdtlocation2;
	}
	public String getCdtlocation3() {
		return cdtlocation3;
	}
	public void setCdtlocation3(String cdtlocation3) {
		this.cdtlocation3 = cdtlocation3;
	}
	public String getCdtjob1() {
		return cdtjob1;
	}
	public void setCdtjob1(String cdtjob1) {
		this.cdtjob1 = cdtjob1;
	}
	public String getCdtjob2() {
		return cdtjob2;
	}
	public void setCdtjob2(String cdtjob2) {
		this.cdtjob2 = cdtjob2;
	}
	public String getCdtjob3() {
		return cdtjob3;
	}
	public void setCdtjob3(String cdtjob3) {
		this.cdtjob3 = cdtjob3;
	}
	public String getCdtjob4() {
		return cdtjob4;
	}
	public void setCdtjob4(String cdtjob4) {
		this.cdtjob4 = cdtjob4;
	}
	public String getCdtjob5() {
		return cdtjob5;
	}
	public void setCdtjob5(String cdtjob5) {
		this.cdtjob5 = cdtjob5;
	}
	public int getPublicornot() {
		return publicornot;
	}
	public void setPublicornot(int publicornot) {
		this.publicornot = publicornot;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getResumeno() {
		return resumeno;
	}
	public void setResumeno(int resumeno) {
		this.resumeno = resumeno;
	}
	@Override
	public String toString() {
		return "CV [cvno=" + cvno + ", userno=" + userno + ", subject=" + subject + ", name=" + name + ", birth="
				+ birth + ", email=" + email + ", phone=" + phone + ", addr=" + addr + ", picture=" + picture
				+ ", school=" + school + ", schoolname=" + schoolname + ", schoollocation=" + schoollocation
				+ ", major=" + major + ", daynight=" + daynight + ", score=" + score + ", skillcontent=" + skillcontent
				+ ", bohun=" + bohun + ", army=" + army + ", armytype=" + armytype + ", armyclass=" + armyclass
				+ ", armyreason=" + armyreason + ", bohunreason=" + bohunreason + ", cdtsalary=" + cdtsalary
				+ ", cdtlocation1=" + cdtlocation1 + ", cdtlocation2=" + cdtlocation2 + ", cdtlocation3=" + cdtlocation3
				+ ", cdtjob1=" + cdtjob1 + ", cdtjob2=" + cdtjob2 + ", cdtjob3=" + cdtjob3 + ", cdtjob4=" + cdtjob4
				+ ", cdtjob5=" + cdtjob5 + ", publicornot=" + publicornot + ", date=" + date + ", resumeno=" + resumeno
				+ "]";
	}
	
	
=======
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CV {
	private int cvno;
	private int userno;
	private int publicornot;
	private String subject;
	private String name;
	private String birth;
	private String email;
	private String phone;
	private String addr;
	private String picture;
	private MultipartFile pictureUrl;
	private String school;
	private String schoolname;
	private String schoollocation;
	private String major;
	private String daynight;
	private Double score;
	private String skillcontent;
	private String bohun;
	private String army;
	private String armytype;
	private String armyclass;
	private String armyreason;
	private String bohunreason;
	private String cdtsalary;
	private String cdtlocation1;
	private String cdtlocation2;
	private String cdtlocation3;
	private String cdtjob1;
	private String cdtjob2;
	private String cdtjob3;
	private String cdtjob4;
	private String cdtjob5;
	private String date;
	private List<Activity> activity;
	private List<Career> career;
	private List<Haveskill> haveskill;
	private List<LL> ll;
	private List<Portfolio> portfolio;
	private List<Resume> resume;
	public int getCvno() {
		return cvno;
	}
	public void setCvno(int cvno) {
		this.cvno = cvno;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public int getPublicornot() {
		return publicornot;
	}
	public void setPublicornot(int publicornot) {
		this.publicornot = publicornot;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public MultipartFile getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(MultipartFile pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getSchoolname() {
		return schoolname;
	}
	public void setSchoolname(String schoolname) {
		this.schoolname = schoolname;
	}
	public String getSchoollocation() {
		return schoollocation;
	}
	public void setSchoollocation(String schoollocation) {
		this.schoollocation = schoollocation;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getDaynight() {
		return daynight;
	}
	public void setDaynight(String daynight) {
		this.daynight = daynight;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	public String getSkillcontent() {
		return skillcontent;
	}
	public void setSkillcontent(String skillcontent) {
		this.skillcontent = skillcontent;
	}
	public String getBohun() {
		return bohun;
	}
	public void setBohun(String bohun) {
		this.bohun = bohun;
	}
	public String getArmy() {
		return army;
	}
	public void setArmy(String army) {
		this.army = army;
	}
	public String getArmytype() {
		return armytype;
	}
	public void setArmytype(String armytype) {
		this.armytype = armytype;
	}
	public String getArmyclass() {
		return armyclass;
	}
	public void setArmyclass(String armyclass) {
		this.armyclass = armyclass;
	}
	public String getArmyreason() {
		return armyreason;
	}
	public void setArmyreason(String armyreason) {
		this.armyreason = armyreason;
	}
	public String getBohunreason() {
		return bohunreason;
	}
	public void setBohunreason(String bohunreason) {
		this.bohunreason = bohunreason;
	}
	public String getCdtsalary() {
		return cdtsalary;
	}
	public void setCdtsalary(String cdtsalary) {
		this.cdtsalary = cdtsalary;
	}
	public String getCdtlocation1() {
		return cdtlocation1;
	}
	public void setCdtlocation1(String cdtlocation1) {
		this.cdtlocation1 = cdtlocation1;
	}
	public String getCdtlocation2() {
		return cdtlocation2;
	}
	public void setCdtlocation2(String cdtlocation2) {
		this.cdtlocation2 = cdtlocation2;
	}
	public String getCdtlocation3() {
		return cdtlocation3;
	}
	public void setCdtlocation3(String cdtlocation3) {
		this.cdtlocation3 = cdtlocation3;
	}
	public String getCdtjob1() {
		return cdtjob1;
	}
	public void setCdtjob1(String cdtjob1) {
		this.cdtjob1 = cdtjob1;
	}
	public String getCdtjob2() {
		return cdtjob2;
	}
	public void setCdtjob2(String cdtjob2) {
		this.cdtjob2 = cdtjob2;
	}
	public String getCdtjob3() {
		return cdtjob3;
	}
	public void setCdtjob3(String cdtjob3) {
		this.cdtjob3 = cdtjob3;
	}
	public String getCdtjob4() {
		return cdtjob4;
	}
	public void setCdtjob4(String cdtjob4) {
		this.cdtjob4 = cdtjob4;
	}
	public String getCdtjob5() {
		return cdtjob5;
	}
	public void setCdtjob5(String cdtjob5) {
		this.cdtjob5 = cdtjob5;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public List<Activity> getActivity() {
		return activity;
	}
	public void setActivity(List<Activity> activity) {
		this.activity = activity;
	}
	public List<Career> getCareer() {
		return career;
	}
	public void setCareer(List<Career> career) {
		this.career = career;
	}
	public List<Haveskill> getHaveskill() {
		return haveskill;
	}
	public void setHaveskill(List<Haveskill> haveskill) {
		this.haveskill = haveskill;
	}
	public List<LL> getLl() {
		return ll;
	}
	public void setLl(List<LL> ll) {
		this.ll = ll;
	}
	public List<Portfolio> getPortfolio() {
		return portfolio;
	}
	public void setPortfolio(List<Portfolio> portfolio) {
		this.portfolio = portfolio;
	}
	public List<Resume> getResume() {
		return resume;
	}
	public void setResume(List<Resume> resume) {
		this.resume = resume;
	}
	@Override
	public String toString() {
		return "CV [cvno=" + cvno + ", userno=" + userno + ", publicornot=" + publicornot + ", subject=" + subject
				+ ", name=" + name + ", birth=" + birth + ", email=" + email + ", phone=" + phone + ", addr=" + addr
				+ ", picture=" + picture + ", pictureUrl=" + pictureUrl + ", school=" + school + ", schoolname="
				+ schoolname + ", schoollocation=" + schoollocation + ", major=" + major + ", daynight=" + daynight
				+ ", score=" + score + ", skillcontent=" + skillcontent + ", bohun=" + bohun + ", army=" + army
				+ ", armytype=" + armytype + ", armyclass=" + armyclass + ", armyreason=" + armyreason
				+ ", bohunreason=" + bohunreason + ", cdtsalary=" + cdtsalary + ", cdtlocation1=" + cdtlocation1
				+ ", cdtlocation2=" + cdtlocation2 + ", cdtlocation3=" + cdtlocation3 + ", cdtjob1=" + cdtjob1
				+ ", cdtjob2=" + cdtjob2 + ", cdtjob3=" + cdtjob3 + ", cdtjob4=" + cdtjob4 + ", cdtjob5=" + cdtjob5
				+ ", date=" + date + ", activity=" + activity + ", career=" + career + ", haveskill=" + haveskill
				+ ", ll=" + ll + ", portfolio=" + portfolio + ", resume=" + resume + "]";
	}
>>>>>>> refs/remotes/CGH/CGH
}
