package logic;

public class Pickuser {
   private int pickuserno;
   private int comno;
   private int userno; //ȸ����ȣ
   private int cvno;
   private int calluser;
   private User user; // user �� cv ��ü�� �ѹ��� �ޱ�����
   private CV cv;
   
   public int getPickuserno() {
      return pickuserno;
   }
   public void setPickuserno(int pickuserno) {
      this.pickuserno = pickuserno;
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
   public int getCalluser() {
      return calluser;
   }
   public void setCalluser(int calluser) {
      this.calluser = calluser;
   }

   public int getCvno() {
	return cvno;
	}
	public void setCvno(int cvno) {
		this.cvno = cvno;
	}
	public User getUser() {
      return user;
   }
   public void setUser(User user) {
      this.user = user;
   }
   public CV getCv() {
      return cv;
   }
   public void setCv(CV cv) {
      this.cv = cv;
   }
   @Override
   public String toString() {
      return "Pickuser [pickuserno=" + pickuserno + ", comno=" + comno + ", userno=" + userno
            + ", calluser=" + calluser + "]";
   }
   
}