package logic;

public class LL {
	private Integer no;
	private int cvno;
	private String lltype;
	private String llname;
	private String llplace;
	private String lllang;
	private String lltesttype;
	private Integer llscore;
	private String lllevel;
	private String llpass;
	private String llpassdate;
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public int getCvno() {
		return cvno;
	}
	public void setCvno(int cvno) {
		this.cvno = cvno;
	}
	public String getLltype() {
		return lltype;
	}
	public void setLltype(String lltype) {
		this.lltype = lltype;
	}
	public String getLlname() {
		return llname;
	}
	public void setLlname(String llname) {
		this.llname = llname;
	}
	public String getLlplace() {
		return llplace;
	}
	public void setLlplace(String llplace) {
		this.llplace = llplace;
	}
	public String getLllang() {
		return lllang;
	}
	public void setLllang(String lllang) {
		this.lllang = lllang;
	}
	public String getLltesttype() {
		return lltesttype;
	}
	public void setLltesttype(String lltesttype) {
		this.lltesttype = lltesttype;
	}
	public Integer getLlscore() {
		return llscore;
	}
	public void setLlscore(Integer llscore) {
		this.llscore = llscore;
	}
	public String getLllevel() {
		return lllevel;
	}
	public void setLllevel(String lllevel) {
		this.lllevel = lllevel;
	}
	public String getLlpass() {
		return llpass;
	}
	public void setLlpass(String llpass) {
		this.llpass = llpass;
	}
	public String getLlpassdate() {
		return llpassdate;
	}
	public void setLlpassdate(String llpassdate) {
		this.llpassdate = llpassdate;
	}
	@Override
	public String toString() {
		return "LL [no=" + no + ", cvno=" + cvno + ", lltype=" + lltype + ", llname=" + llname + ", llplace=" + llplace
				+ ", lllang=" + lllang + ", lltesttype=" + lltesttype + ", llscore=" + llscore + ", lllevel=" + lllevel
				+ ", llpass=" + llpass + ", llpassdate=" + llpassdate + "]";
	}
}
