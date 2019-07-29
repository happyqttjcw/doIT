package logic;

<<<<<<< HEAD
import java.util.Date;

public class Resume {
	private int resumeno;
	private int jemokno;
	private String subject;
	private String content;
	private Date date;
	public int getResumeno() {
		return resumeno;
	}
	public void setResumeno(int resumeno) {
		this.resumeno = resumeno;
	}
	public int getJemokno() {
		return jemokno;
	}
	public void setJemokno(int jemokno) {
		this.jemokno = jemokno;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Resume [resumeno=" + resumeno + ", jemokno=" + jemokno + ", subject=" + subject + ", content=" + content
				+ ", date=" + date + "]";
	}
	
	
=======
public class Resume {
	private int resumeno;
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
	@Override
	public String toString() {
		return "Resume [resumeno=" + resumeno + ", cvno=" + cvno + ", jemokno=" + jemokno + ", rsubject=" + rsubject
				+ ", rcontent=" + rcontent + ", rdate=" + rdate + "]";
	}
>>>>>>> refs/remotes/CGH/CGH
}
