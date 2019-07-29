package logic;

public class Pickjob {
	private int pickjobno;
	private int userno;
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
}
