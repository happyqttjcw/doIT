package logic;

public class Haveskill {
	private int haveno;
	private int cvno;
	private String ability;
	private String level;
	private String content;
	public int getHaveno() {
		return haveno;
	}
	public void setHaveno(int haveno) {
		this.haveno = haveno;
	}
	public int getCvno() {
		return cvno;
	}
	public void setCvno(int cvno) {
		this.cvno = cvno;
	}
	public String getAbility() {
		return ability;
	}
	public void setAbility(String ability) {
		this.ability = ability;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "HaveSkill [haveno=" + haveno + ", cvno=" + cvno + ", ability=" + ability + ", level=" + level
				+ ", content=" + content + "]";
	}
	
}
