package logic;

public class ResumeEdit {
	private int editno;
	private Integer resumeno;
	private int userno;
	private String subject;
	private String name;
	private String date;
	private String content;
	private int count;
	private int ref;
	
	public int getEditno() {
		return editno;
	}
	public void setEditno(int editno) {
		this.editno = editno;
	}
	public Integer getResumeno() {
		return resumeno;
	}
	public void setResumeno(Integer resumeno) {
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
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
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	@Override
	public String toString() {
		return "ResumeEdit [editno=" + editno + ", resumeno=" + resumeno + ", userno=" + userno + ", subject=" + subject
				+ ", name=" + name + ", date=" + date + ", content=" + content + ", count=" + count + ", ref=" + ref
				+ "]";
	}
}