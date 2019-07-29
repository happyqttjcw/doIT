package logic;

public class Portfolio {
	private Integer portno;
	private int cvno;
	private String porturl;
	private String portcontent;
	
	public Integer getPortno() {
		return portno;
	}
	public void setPortno(Integer portno) {
		this.portno = portno;
	}
	public int getCvno() {
		return cvno;
	}
	public void setCvno(int cvno) {
		this.cvno = cvno;
	}
	public String getPorturl() {
		return porturl;
	}
	public void setPorturl(String porturl) {
		this.porturl = porturl;
	}
	public String getPortcontent() {
		return portcontent;
	}
	public void setPortcontent(String portcontent) {
		this.portcontent = portcontent;
	}
	@Override
	public String toString() {
		return "Portfolio [portno=" + portno + ", cvno=" + cvno + ", porturl=" + porturl + ", portcontent="
				+ portcontent + "]";
	}
}
