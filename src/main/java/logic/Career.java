package logic;

import java.util.Date;

public class Career {
	private int careerno;
	private int cvno;
	private String ename;
	private Date workstart;
	private Date workend;
	private String reason;
	private String position;
	private int pyear;
	private String worktype;
	private String worklocation;
	private String dept;
	private int salary;
	private String task;
	public int getCareerno() {
		return careerno;
	}
	public void setCareerno(int careerno) {
		this.careerno = careerno;
	}
	public int getCvno() {
		return cvno;
	}
	public void setCvno(int cvno) {
		this.cvno = cvno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public Date getWorkstart() {
		return workstart;
	}
	public void setWorkstart(Date workstart) {
		this.workstart = workstart;
	}
	public Date getWorkend() {
		return workend;
	}
	public void setWorkend(Date workend) {
		this.workend = workend;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public int getPyear() {
		return pyear;
	}
	public void setPyear(int pyear) {
		this.pyear = pyear;
	}
	public String getWorktype() {
		return worktype;
	}
	public void setWorktype(String worktype) {
		this.worktype = worktype;
	}
	public String getWorklocation() {
		return worklocation;
	}
	public void setWorklocation(String worklocation) {
		this.worklocation = worklocation;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getTask() {
		return task;
	}
	public void setTask(String task) {
		this.task = task;
	}
	
	@Override
	public String toString() {
		return "Career [careerno=" + careerno + ", cvno=" + cvno + ", ename=" + ename + ", workstart=" + workstart
				+ ", workend=" + workend + ", reason=" + reason + ", position=" + position + ", pyear=" + pyear
				+ ", worktype=" + worktype + ", worklocation=" + worklocation + ", dept=" + dept + ", salary=" + salary
				+ ", task=" + task + "]";
	}
	
}
