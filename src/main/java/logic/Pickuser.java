package logic;

public class Pickuser {
	private int pickuserno;
	private int comno;
	private int userno;
	private int cvno;
	private int calluser;
	public int getPickuserno() {
		return pickuserno;
	}
	public void setPickuserno(int pickuserno) {
		this.pickuserno = pickuserno;
	}
	public int getComno() {
		return comno;
	}
	public void setComno(int comno) {
		this.comno = comno;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public int getCvno() {
		return cvno;
	}
	public void setCvno(int cvno) {
		this.cvno = cvno;
	}
	public int getCalluser() {
		return calluser;
	}
	public void setCalluser(int calluser) {
		this.calluser = calluser;
	}
	@Override
	public String toString() {
		return "Pickuser [pickuserno=" + pickuserno + ", comno=" + comno + ", userno=" + userno + ", cvno=" + cvno
				+ ", calluser=" + calluser + "]";
	}
	
}
