package logic;

public class Pickjob {
   private int pickjobno;
   private int userno;
   private int jobno;
   private Integer readornot;
   private Integer apply;
   private Integer pick;
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

   public int getJobno() {
      return jobno;
   }

   public void setJobno(int jobno) {
      this.jobno = jobno;
   }

   public Integer getReadornot() {
      return readornot;
   }

   public void setReadornot(Integer readornot) {
      this.readornot = readornot;
   }

   public Integer getApply() {
      return apply;
   }

   public void setApply(Integer apply) {
      this.apply = apply;
   }

   public Integer getPick() {
      return pick;
   }

   public void setPick(Integer pick) {
      this.pick = pick;
   }

   @Override
   public String toString() {
      return "Pickjob [pickjobno=" + pickjobno + ", userno=" + userno + ", jobno=" + jobno + ", readornot="
            + readornot + ", apply=" + apply + ", pick=" + pick + "]";
   }
}