package logic;

public class Portfolio {
	private Integer portno;
	private int cvno;
	private String porturl;
	private String portcontent;
	Integer getPortno() {
		return portno;
	}
	void setPortno(Integer portno) {
		this.portno = portno;
	}
	int getCvno() {
		return cvno;
	}
	void setCvno(int cvno) {
		this.cvno = cvno;
	}
	String getPorturl() {
		return porturl;
	}
	void setPorturl(String porturl) {
		this.porturl = porturl;
	}
	String getPortcontent() {
		return portcontent;
	}
	void setPortcontent(String portcontent) {
		this.portcontent = portcontent;
	}
	@Override
	public String toString() {
		return "Portfolio [portno=" + portno + ", cvno=" + cvno + ", porturl=" + porturl + ", portcontent="
				+ portcontent + "]";
	}
}
