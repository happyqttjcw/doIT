package logic;

import java.util.Date;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Company {
   private int comno;
   private String comid;
   @NotEmpty(message="비밀번호를 입력하세요.2222")
   private String compass;
   private int bussno;
   private String comtype;
   private String comsize;
   private String managername;
   private String managerphone;
   private String manageremail;
   private String comcontent;
   private String compic;
   private String comhomepage;
   private String comwelfare;
   private String comname;
   private String combrand;
   private String comboss;
   private String comaddr;
   private String comphone;
   private int comstaffnum;
   private String combirth;
   private int comsales;
   private MultipartFile compicture;
 
   public int getComno() {
      return comno;
   }

   public void setComno(int comno) {
      this.comno = comno;
   }

   public String getComid() {
      return comid;
   }

   public void setComid(String comid) {
      this.comid = comid;
   }

   public String getCompass() {
      return compass;
   }

   public void setCompass(String compass) {
      this.compass = compass;
   }

   public int getBussno() {
      return bussno;
   }

   public void setBussno(int bussno) {
      this.bussno = bussno;
   }

   public String getComtype() {
      return comtype;
   }

   public void setComtype(String comtype) {
      this.comtype = comtype;
   }

   public String getComsize() {
      return comsize;
   }

   public void setComsize(String comsize) {
      this.comsize = comsize;
   }

   public String getManagername() {
      return managername;
   }

   public void setManagername(String managername) {
      this.managername = managername;
   }

   public String getManagerphone() {
      return managerphone;
   }

   public void setManagerphone(String managerphone) {
      this.managerphone = managerphone;
   }

   public String getManageremail() {
      return manageremail;
   }

   public void setManageremail(String manageremail) {
      this.manageremail = manageremail;
   }

   public String getComcontent() {
      return comcontent;
   }

   public void setComcontent(String comcontent) {
      this.comcontent = comcontent;
   }

   public String getCompic() {
      return compic;
   }

   public void setCompic(String compic) {
      this.compic = compic;
   }

   public String getComhomepage() {
      return comhomepage;
   }

   public void setComhomepage(String comhomepage) {
      this.comhomepage = comhomepage;
   }

   public String getComwelfare() {
      return comwelfare;
   }

   public void setComwelfare(String comwelfare) {
      this.comwelfare = comwelfare;
   }

   public String getComname() {
      return comname;
   }

   public void setComname(String comname) {
      this.comname = comname;
   }

   public String getCombrand() {
      return combrand;
   }

   public void setCombrand(String combrand) {
      this.combrand = combrand;
   }

   public String getComboss() {
      return comboss;
   }

   public void setComboss(String comboss) {
      this.comboss = comboss;
   }

   public String getComaddr() {
      return comaddr;
   }

   public void setComaddr(String comaddr) {
      this.comaddr = comaddr;
   }

   public String getComphone() {
      return comphone;
   }

   public void setComphone(String comphone) {
      this.comphone = comphone;
   }

   public int getComstaffnum() {
      return comstaffnum;
   }

   public void setComstaffnum(int comstaffnum) {
      this.comstaffnum = comstaffnum;
   }

   public String getCombirth() {
      return combirth;
   }

   public void setCombirth(String combirth) {
      this.combirth = combirth;
   }

   public int getComsales() {
      return comsales;
   }

   public void setComsales(int comsales) {
      this.comsales = comsales;
   }

   public MultipartFile getCompicture() {
      return compicture;
   }

   public void setCompicture(MultipartFile compicture) {
      this.compicture = compicture;
   }

   @Override
   public String toString() {
      return "Company [comno=" + comno + ", comid=" + comid + ", compass=" + compass + ", bussno=" + bussno
            + ", comtype=" + comtype + ", comsize=" + comsize + ", managername=" + managername + ", managerphone="
            + managerphone + ", manageremail=" + manageremail + ", comcontent=" + comcontent + ", compic=" + compic
            + ", comhomepage=" + comhomepage + ", comwelfare=" + comwelfare + ", comname=" + comname + ", combrand="
            + combrand + ", comboss=" + comboss + ", comaddr=" + comaddr + ", comphone=" + comphone
            + ", comstaffnum=" + comstaffnum + ", combirth=" + combirth + ", comsales=" + comsales + ", compicture="
            + compicture + "]";
   }

}