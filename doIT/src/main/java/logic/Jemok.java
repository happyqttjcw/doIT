package logic;

public class Jemok {
	private Integer jemokno;
	private int userno;
	private String jemok;
	Integer getJemokno() {
		return jemokno;
	}
	void setJemokno(Integer jemokno) {
		this.jemokno = jemokno;
	}
	int getUserno() {
		return userno;
	}
	void setUserno(int userno) {
		this.userno = userno;
	}
	String getJemok() {
		return jemok;
	}
	void setJemok(String jemok) {
		this.jemok = jemok;
	}
	@Override
	public String toString() {
		return "Jemok [jemokno=" + jemokno + ", userno=" + userno + ", jemok=" + jemok + "]";
	}
}
