package logic;

import java.util.Date;

public class Activity {
	private Integer acno;
	private int cvno;
	private String actype;
	private String aclocation;
	private String acstart;
	private Date acend;
	private Date accontent;
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
	public Date getAcend() {
		return acend;
	}
	public void setAcend(Date acend) {
		this.acend = acend;
	}
	public Date getAccontent() {
		return accontent;
	}
	public void setAccontent(Date accontent) {
		this.accontent = accontent;
	}
	@Override
	public String toString() {
		return "activity [acno=" + acno + ", cvno=" + cvno + ", actype=" + actype + ", aclocation=" + aclocation
				+ ", acstart=" + acstart + ", acend=" + acend + ", accontent=" + accontent + "]";
	}
}