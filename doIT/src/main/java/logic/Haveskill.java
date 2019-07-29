package logic;

public class Haveskill {
	private Integer haveno;
	private int cvno;
	private String hsability;
	private String hslevel;
	private String hscontent;
	public Integer getHaveno() {
		return haveno;
	}
	public void setHaveno(Integer haveno) {
		this.haveno = haveno;
	}
	public int getCvno() {
		return cvno;
	}
	public void setCvno(int cvno) {
		this.cvno = cvno;
	}
	public String getHsability() {
		return hsability;
	}
	public void setHsability(String hsability) {
		this.hsability = hsability;
	}
	public String getHslevel() {
		return hslevel;
	}
	public void setHslevel(String hslevel) {
		this.hslevel = hslevel;
	}
	public String getHscontent() {
		return hscontent;
	}
	public void setHscontent(String hscontent) {
		this.hscontent = hscontent;
	}
	@Override
	public String toString() {
		return "Haveskill [haveno=" + haveno + ", cvno=" + cvno + ", hsability=" + hsability + ", hslevel=" + hslevel
				+ ", hscontent=" + hscontent + "]";
	}
}
