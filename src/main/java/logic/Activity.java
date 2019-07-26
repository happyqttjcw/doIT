package logic;

public class Activity {
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