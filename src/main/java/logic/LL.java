package logic;

import java.util.Date;

public class LL {
	private int no;
	private int cvno;
	private String type;
	private String name;
	private String place;
	private String lang;
	private int testtype;
	private String score;
	private String level;
	private String pass;
	private Date passdate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCvno() {
		return cvno;
	}
	public void setCvno(int cvno) {
		this.cvno = cvno;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	public int getTesttype() {
		return testtype;
	}
	public void setTesttype(int testtype) {
		this.testtype = testtype;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public Date getPassdate() {
		return passdate;
	}
	public void setPassdate(Date passdate) {
		this.passdate = passdate;
	}
	@Override
	public String toString() {
		return "LL [no=" + no + ", cvno=" + cvno + ", type=" + type + ", name=" + name + ", place=" + place + ", lang="
				+ lang + ", testtype=" + testtype + ", score=" + score + ", level=" + level + ", pass=" + pass
				+ ", passdate=" + passdate + "]";
	}
	
}
