package logic;

public class Recruit {
	private int recruitno;
	private int jobno;
	private int num;
	private String field;
	private String task;
	private String dept;
	private String position;
	public int getRecruitno() {
		return recruitno;
	}
	public void setRecruitno(int recruitno) {
		this.recruitno = recruitno;
	}
	public int getJobno() {
		return jobno;
	}
	public void setJobno(int jobno) {
		this.jobno = jobno;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getTask() {
		return task;
	}
	public void setTask(String task) {
		this.task = task;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	@Override
	public String toString() {
		return "Recruit [recruitno=" + recruitno + ", jobno=" + jobno + ", num=" + num + ", field=" + field + ", task="
				+ task + ", dept=" + dept + ", position=" + position + "]";
	}
	
	
	
}
