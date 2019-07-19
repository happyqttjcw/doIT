package logic;

import java.util.Arrays;

public class SettingArray {
	private int likeno;
	private int comno;
	private int userno;
	private String[] skill;
	private String[] welfare;
	private String[] pluse;
	private String[] location;
	private String[] job;
	private Integer minpay;
	private Integer maxpay;
	private String education;
	private String[] workform;
	
	public int getLikeno() {
		return likeno;
	}
	public void setLikeno(int likeno) {
		this.likeno = likeno;
	}
	public int getComno() {
		return comno;
	}
	public void setComno(int comno) {
		this.comno = comno;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String[] getSkill() {
		return skill;
	}
	public void setSkill(String[] skill) {
		this.skill = skill;
	}
	public String[] getWelfare() {
		return welfare;
	}
	public void setWelfare(String[] welfare) {
		this.welfare = welfare;
	}
	public String[] getPluse() {
		return pluse;
	}
	public void setPluse(String[] pluse) {
		this.pluse = pluse;
	}
	public String[] getLocation() {
		return location;
	}
	public void setLocation(String[] location) {
		this.location = location;
	}
	public String[] getJob() {
		return job;
	}
	public void setJob(String[] job) {
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
	public String[] getWorkform() {
		return workform;
	}
	public void setWorkform(String[] workform) {
		this.workform = workform;
	}
	@Override
	public String toString() {
		return "SettingArray [likeno=" + likeno + ", comno=" + comno + ", userno=" + userno + ", skill="
				+ Arrays.toString(skill) + ", welfare=" + Arrays.toString(welfare) + ", pluse=" + Arrays.toString(pluse)
				+ ", location=" + Arrays.toString(location) + ", job=" + Arrays.toString(job)
				+ ", minpay=" + minpay + ", maxpay=" + maxpay + ", education=" + education
				+ ", workform=" + Arrays.toString(workform) + "]";
	}
}