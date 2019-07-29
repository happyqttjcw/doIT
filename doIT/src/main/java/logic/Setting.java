package logic;

public class Setting {
	private int setno;
	private Integer comno;
	private Integer userno;
	private String skill;
	private String welfare;
	private String pluse;
	private String location;
	private String job;
	private Integer minpay;
	private Integer maxpay;
	private String education;
	private String workform;
	
	public int getSetno() {
		return setno;
	}
	public void setSetno(int setno) {
		this.setno = setno;
	}
	public Integer getComno() {
		return comno;
	}
	public void setComno(Integer comno) {
		this.comno = comno;
	}
	public Integer getUserno() {
		return userno;
	}
	public void setUserno(Integer userno) {
		this.userno = userno;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public String getWelfare() {
		return welfare;
	}
	public void setWelfare(String welfare) {
		this.welfare = welfare;
	}
	public String getPluse() {
		return pluse;
	}
	public void setPluse(String pluse) {
		this.pluse = pluse;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public Integer getMinpay() {
		return minpay;
	}
	public void setMinpay(Integer minpay) {
		this.minpay = minpay;
	}
	public Integer getMaxpay() {
		return maxpay;
	}
	public void setMaxpay(Integer maxpay) {
		this.maxpay = maxpay;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getWorkform() {
		return workform;
	}
	public void setWorkform(String workform) {
		this.workform = workform;
	}
	@Override
	public String toString() {
		return "Setting [setno=" + setno + ", comno=" + comno + ", userno=" + userno + ", skill=" + skill + ", welfare="
				+ welfare + ", pluse=" + pluse + ", location=" + location + ", job=" + job + ", minpay=" + minpay
				+ ", maxpay=" + maxpay + ", education=" + education + ", workform=" + workform + "]";
	}

}