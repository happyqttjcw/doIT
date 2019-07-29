package logic;

<<<<<<< HEAD
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
	
=======
public class Career {
	private Integer careerno; //�⺻Ű
	private Integer cvno;
	private String cename;
	private String cworkstart;
	private String cworkend;
	private String creason;
	private String cposition1;
	private String cposition2;
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
	public String getCposition1() {
		return cposition1;
	}
	public void setCposition1(String cposition1) {
		this.cposition1 = cposition1;
	}
	public String getCposition2() {
		return cposition2;
	}
	public void setCposition2(String cposition2) {
		this.cposition2 = cposition2;
	}
	public Integer getCpyear() {
		return cpyear;
	}
	public void setCpyear(Integer cpyear) {
		this.cpyear = cpyear;
	}
	public String getCworktype() {
		return cworktype;
	}
	public void setCworktype(String cworktype) {
		this.cworktype = cworktype;
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
				+ ", cworkend=" + cworkend + ", creason=" + creason + ", cposition1=" + cposition1 + ", cposition2="
				+ cposition2 + ", cpyear=" + cpyear + ", cworktype=" + cworktype + ", cworklocation=" + cworklocation
				+ ", cdept=" + cdept + ", csalary=" + csalary + ", ctask=" + ctask + "]";
	}
>>>>>>> refs/remotes/CGH/CGH
}
