package logic;

public class Pickjob {
	private int pickjobno;
	private int userno;
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
	
	
}
