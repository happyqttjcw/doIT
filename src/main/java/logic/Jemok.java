package logic;

public class Jemok {
	private int jemokno;
	private int userno;
	private String jemok;
	public int getJemokno() {
		return jemokno;
	}
	public void setJemokno(int jemokno) {
		this.jemokno = jemokno;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getJemok() {
		return jemok;
	}
	public void setJemok(String jemok) {
		this.jemok = jemok;
	}
	@Override
	public String toString() {
		return "Jemok [jemokno=" + jemokno + ", userno=" + userno + ", jemok=" + jemok + "]";
	}
	
}
