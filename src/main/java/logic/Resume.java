package logic;

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
	
	
}
