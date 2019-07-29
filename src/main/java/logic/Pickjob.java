package logic;

public class Pickjob {
	private int pickjobno;
	private int userno;
<<<<<<< HEAD
	private int readornot;
	private int apply;
	private int pick;
	private int recruitno;
	public int getPickjobno() {
		return pickjobno;
	}
	public void setPickjobno(int pickjobno) {
		this.pickjobno = pickjobno;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public int getReadornot() {
		return readornot;
	}
	public void setReadornot(int readornot) {
		this.readornot = readornot;
	}
	public int getApply() {
		return apply;
	}
	public void setApply(int apply) {
		this.apply = apply;
	}
	public int getPick() {
		return pick;
	}
	public void setPick(int pick) {
		this.pick = pick;
	}
	public int getRecruitno() {
		return recruitno;
	}
	public void setRecruitno(int recruitno) {
		this.recruitno = recruitno;
	}
	@Override
	public String toString() {
		return "PickJob [pickjobno=" + pickjobno + ", userno=" + userno + ", readornot=" + readornot + ", apply="
				+ apply + ", pick=" + pick + ", recruitno=" + recruitno + "]";
	}
	
	
=======
	private int jobno;
	private Integer readornot;
	private Integer apply;
	private Integer pick;
	int getPickjobno() {
		return pickjobno;
	}
	void setPickjobno(int pickjobno) {
		this.pickjobno = pickjobno;
	}
	int getUserno() {
		return userno;
	}
	void setUserno(int userno) {
		this.userno = userno;
	}
	int getJobno() {
		return jobno;
	}
	void setJobno(int jobno) {
		this.jobno = jobno;
	}
	Integer getReadornot() {
		return readornot;
	}
	void setReadornot(Integer readornot) {
		this.readornot = readornot;
	}
	Integer getApply() {
		return apply;
	}
	void setApply(Integer apply) {
		this.apply = apply;
	}
	Integer getPick() {
		return pick;
	}
	void setPick(Integer pick) {
		this.pick = pick;
	}
	@Override
	public String toString() {
		return "Pickjob [pickjobno=" + pickjobno + ", userno=" + userno + ", jobno=" + jobno + ", readornot="
				+ readornot + ", apply=" + apply + ", pick=" + pick + "]";
	}
>>>>>>> refs/remotes/CGH/CGH
}
