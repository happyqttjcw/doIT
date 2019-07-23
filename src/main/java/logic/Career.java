package logic;

public class Career {
	private Integer careerno;
	private Integer cvno;
	private String cename;
	private String cworkstart;
	private String cworkend;
	private String creason;
	private String cposition;
	private Integer cpyear;
	private String cworktype;
	private String cworklocation;
	private String cdept;
	private Integer csalary;
	private String ctask;
	public Integer getCareerno() {
		return careerno;
	}
	public void setCareerno(Integer careerno) {
		this.careerno = careerno;
	}
	public Integer getCvno() {
		return cvno;
	}
	public void setCvno(Integer cvno) {
		this.cvno = cvno;
	}
	public String getCename() {
		return cename;
	}
	public void setCename(String cename) {
		this.cename = cename;
	}
	
	public String getCworkstart() {
		return cworkstart;
	}
	public void setCworkstart(String cworkstart) {
		this.cworkstart = cworkstart;
	}
	public String getCworkend() {
		return cworkend;
	}
	public void setCworkend(String cworkend) {
		this.cworkend = cworkend;
	}
	public String getCreason() {
		return creason;
	}
	public void setCreason(String creason) {
		this.creason = creason;
	}
	public String getCposition() {
		return cposition;
	}
	public void setCposition(String cposition) {
		this.cposition = cposition;
	}
	public Integer getCpyear() {
		return cpyear;
	}
	public void setCpyear(Integer cpyear) {
		this.cpyear = cpyear;
	}
	public String getCworkttype() {
		return cworktype;
	}
	public void setCworkttype(String cworkttype) {
		this.cworktype = cworkttype;
	}
	public String getCworklocation() {
		return cworklocation;
	}
	public void setCworklocation(String cworklocation) {
		this.cworklocation = cworklocation;
	}
	public String getCdept() {
		return cdept;
	}
	public void setCdept(String cdept) {
		this.cdept = cdept;
	}
	public Integer getCsalary() {
		return csalary;
	}
	public void setCsalary(Integer csalary) {
		this.csalary = csalary;
	}
	public String getCtask() {
		return ctask;
	}
	public void setCtask(String ctask) {
		this.ctask = ctask;
	}
	@Override
	public String toString() {
		return "Career [careerno=" + careerno + ", cvno=" + cvno + ", cename=" + cename + ", cworkstart=" + cworkstart
				+ ", cworkend=" + cworkend + ", creason=" + creason + ", cposition=" + cposition
				+ ", cpyear=" + cpyear + ", cworktype=" + cworktype + ", cworklocation=" + cworklocation + ", cdept="
				+ cdept + ", csalary=" + csalary + ", ctask=" + ctask + "]";
	}
}
