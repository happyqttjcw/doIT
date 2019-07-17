package logic;

public class Activity {
	private int acno;
	private int cvno;
	private String actype;
	private String acperiod;
	private String accontent;
	public int getAcno() {
		return acno;
	}
	public void setAcno(int acno) {
		this.acno = acno;
	}
	public int getCvno() {
		return cvno;
	}
	public void setCvno(int cvno) {
		this.cvno = cvno;
	}
	public String getActype() {
		return actype;
	}
	public void setActype(String actype) {
		this.actype = actype;
	}
	public String getAcperiod() {
		return acperiod;
	}
	public void setAcperiod(String acperiod) {
		this.acperiod = acperiod;
	}
	public String getAccontent() {
		return accontent;
	}
	public void setAccontent(String accontent) {
		this.accontent = accontent;
	}
	@Override
	public String toString() {
		return "Activity [acno=" + acno + ", cvno=" + cvno + ", actype=" + actype + ", acperiod=" + acperiod
				+ ", accontent=" + accontent + "]";
	}
	
	
}
