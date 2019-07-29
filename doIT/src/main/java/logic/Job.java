package logic;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class Job {
   private int jobno;
   private int comno;
   private String subject;
   private String duty;
   private String career;
   private String employ;
   private String education;
   private String major;
   private String likecdt;
   private String language;
   private String skill;
   private String gender;
   private String startage;
   private String endage;
   private String salary;
   private String industry;
   private String worklocation;
   private String workday;
   private String worktime;
   private String startdate;
   private String enddate;
   private String receivetype;
   private String name;
   private String phone;
   private String mobile;
   private String email;
   private String num;
   private String field;
   private String task;
   private String dept;
   private String position;
   private String cdt;
   
   public int getJobno() {
      return jobno;
   }
   public void setJobno(int jobno) {
      this.jobno = jobno;
   }
   public int getComno() {
      return comno;
   }
   public void setComno(int comno) {
      this.comno = comno;
   }
   public String getSubject() {
      return subject;
   }
   public void setSubject(String subject) {
      this.subject = subject;
   }
   public String getDuty() {
      return duty;
   }
   public void setDuty(String duty) {
      this.duty = duty;
   }
   public String getCareer() {
      return career;
   }
   public void setCareer(String career) {
      this.career = career;
   }
   public String getEmploy() {
      return employ;
   }
   public void setEmploy(String employ) {
      this.employ = employ;
   }
   public String getEducation() {
      return education;
   }
   public void setEducation(String education) {
      this.education = education;
   }
   public String getMajor() {
      return major;
   }
   public void setMajor(String major) {
      this.major = major;
   }
   public String getLikecdt() {
      return likecdt;
   }
   public void setLikecdt(String likecdt) {
      this.likecdt = likecdt;
   }
   public String getLanguage() {
      return language;
   }
   public void setLanguage(String language) {
      this.language = language;
   }
   public String getSkill() {
      return skill;
   }
   public void setSkill(String skill) {
      this.skill = skill;
   }
   public String getGender() {
      return gender;
   }
   public void setGender(String gender) {
      this.gender = gender;
   }
   
   public String getStartage() {
      return startage;
   }
   public void setStartage(String startage) {
      this.startage = startage;
   }
   public String getEndage() {
      return endage;
   }
   public void setEndage(String endage) {
      this.endage = endage;
   }
   public String getSalary() {
      return salary;
   }
   public void setSalary(String salary) {
      this.salary = salary;
   }
   public String getIndustry() {
      return industry;
   }
   public void setIndustry(String industry) {
      this.industry = industry;
   }
   public String getWorklocation() {
      return worklocation;
   }
   public void setWorklocation(String worklocation) {
      this.worklocation = worklocation;
   }
   public String getWorkday() {
      return workday;
   }
   public void setWorkday(String workday) {
      this.workday = workday;
   }
   public String getWorktime() {
      return worktime;
   }
   public void setWorktime(String worktime) {
      this.worktime = worktime;
   }
   
   public String getStartdate() {
      return startdate;
   }
   public void setStartdate(String startdate) {
      this.startdate = startdate;
   }
   public String getEnddate() {
      return enddate;
   }
   public void setEnddate(String enddate) {
      this.enddate = enddate;
   }
   public String getReceivetype() {
      return receivetype;
   }
   public void setReceivetype(String receivetype) {
      this.receivetype = receivetype;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
   }
   public String getMobile() {
      return mobile;
   }
   public void setMobile(String mobile) {
      this.mobile = mobile;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getNum() {
      return String.join(", ", num);
   }
   public String getField() {
      return String.join(", ", field);
   }
   public String getTask() {
      return String.join(", ", task);
   }
   public String getDept() {
      return String.join(", ", dept);
   }
   public String getPosition() {
      return String.join(", ", position);
   }
   public String getCdt() {
      return String.join(", ", cdt);
   }
   public void setNum(String num) {
      this.num = num;
   }
   public void setField(String field) {
      this.field = field;
   }
   public void setTask(String task) {
      this.task = task;
   }
   public void setDept(String dept) {
      this.dept = dept;
   }
   public void setPosition(String position) {
      this.position = position;
   }
   public void setCdt(String cdt) {
      this.cdt = cdt;
   }
   @Override
   public String toString() {
      return "Job [jobno=" + jobno + ", comno=" + comno + ", subject=" + subject + ", duty=" + duty + ", career="
            + career + ", employ=" + employ + ", education=" + education + ", major=" + major + ", likecdt="
            + likecdt + ", language=" + language + ", skill=" + skill + ", gender=" + gender + ", startage="
            + startage + ", endage=" + endage + ", salary=" + salary + ", industry=" + industry + ", worklocation="
            + worklocation + ", workday=" + workday + ", worktime=" + worktime + ", startdate=" + startdate
            + ", enddate=" + enddate + ", receivetype=" + receivetype + ", name=" + name + ", phone=" + phone
            + ", mobile=" + mobile + ", email=" + email + ", num=" + num + ", field=" + field + ", task=" + task
            + ", dept=" + dept + ", position=" + position + ", cdt=" + cdt + "]";
   }
   
   
}