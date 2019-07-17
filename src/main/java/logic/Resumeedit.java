package logic;

import java.util.Date;

public class Resumeedit {
	private int editno;
	private int resumeno;
	private int userno;
	private String subject;
	private String name;
	private Date date;
	private String content;
	private int count;
	public int getEditno() {
		return editno;
	}
	public void setEditno(int editno) {
		this.editno = editno;
	}
	public int getResumeno() {
		return resumeno;
	}
	public void setResumeno(int resumeno) {
		this.resumeno = resumeno;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "Resumeedit [editno=" + editno + ", resumeno=" + resumeno + ", userno=" + userno + ", subject=" + subject
				+ ", name=" + name + ", date=" + date + ", content=" + content + ", count=" + count + "]";
	}
	
	
}
