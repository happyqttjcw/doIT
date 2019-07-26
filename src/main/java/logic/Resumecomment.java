package logic;

public class Resumecomment {
	private int commentno;
	private int editno;
	private int userno;
	private String name;
	private String content;
	private String date;
	private int ref;
	private int refstep;
	private int reflevel;
	
	public int getCommentno() {
		return commentno;
	}
	public void setCommentno(int commentno) {
		this.commentno = commentno;
	}
	public int getEditno() {
		return editno;
	}
	public void setEditno(int editno) {
		this.editno = editno;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRefstep() {
		return refstep;
	}
	public void setRefstep(int refstep) {
		this.refstep = refstep;
	}
	public int getReflevel() {
		return reflevel;
	}
	public void setReflevel(int reflevel) {
		this.reflevel = reflevel;
	}
	@Override
	public String toString() {
		return "Resumecomment [commentno=" + commentno + ", editno=" + editno + ", userno=" + userno + ", name=" + name
				+ ", content=" + content + ", date=" + date + ", ref=" + ref + ", refstep=" + refstep + ", reflevel="
				+ reflevel + "]";
	}
}