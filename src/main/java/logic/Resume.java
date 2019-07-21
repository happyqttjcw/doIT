package logic;

import java.util.Date;

public class Resume {
	private Integer resumeno;
	private Integer jemokno;
	private String rsubject;
	private String rcontent;
	private Date rdate;
	public Integer getResumeno() {
		return resumeno;
	}
	public void setResumeno(Integer resumeno) {
		this.resumeno = resumeno;
	}
	public Integer getJemokno() {
		return jemokno;
	}
	public void setJemokno(Integer jemokno) {
		this.jemokno = jemokno;
	}
	public String getRsubject() {
		return rsubject;
	}
	public void setRsubject(String rsubject) {
		this.rsubject = rsubject;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	@Override
	public String toString() {
		return "Resume [resumeno=" + resumeno + ", jemokno=" + jemokno + ", rsubject=" + rsubject + ", rcontent="
				+ rcontent + ", rdate=" + rdate + "]";
	}
}
