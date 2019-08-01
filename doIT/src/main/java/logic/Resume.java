package logic;

public class Resume {
	private int resumeno;
	private int userno;
	private Integer cvno;
	private Integer jemokno;
	private String rsubject;
	private String rcontent;
	private String rdate;
	
	public Integer getCvno() {
		return cvno;
	}
	public void setCvno(Integer cvno) {
		this.cvno = cvno;
	}
	public int getResumeno() {
		return resumeno;
	}
	public void setResumeno(int resumeno) {
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
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	@Override
	public String toString() {
		return "Resume [resumeno=" + resumeno + ", userno=" + userno + ", cvno=" + cvno + ", jemokno=" + jemokno
				+ ", rsubject=" + rsubject + ", rcontent=" + rcontent + ", rdate=" + rdate + "]";
	}
}
