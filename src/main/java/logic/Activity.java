package logic;

public class Activity {
<<<<<<< HEAD
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
=======
	private Integer acno;
	private int cvno;
	private String actype;
	private String aclocation;
	private String acstart;
	private String acend;
	private String accontent;

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
	public String getAclocation() {
		return aclocation;
	}
	public void setAclocation(String aclocation) {
		this.aclocation = aclocation;
	}
	public String getAcstart() {
		return acstart;
	}
	public void setAcstart(String acstart) {
		this.acstart = acstart;
	}
	public String getAcend() {
		return acend;
	}
	public void setAcend(String acend) {
		this.acend = acend;
	}
	public String getAccontent() {
		return accontent;
	}
	public void setAccontent(String accontent) {
		this.accontent = accontent;
	}
	public void setAcno(Integer acno) {
		this.acno = acno;
	}
	@Override
	public String toString() {
		return "Activity [acno=" + acno + ", cvno=" + cvno + ", actype=" + actype + ", aclocation=" + aclocation
				+ ", acstart=" + acstart + ", acend=" + acend + ", accontent=" + accontent + "]";
	}
}
>>>>>>> refs/remotes/CGH/CGH
