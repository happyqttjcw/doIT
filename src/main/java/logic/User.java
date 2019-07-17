package logic;

import org.springframework.web.multipart.MultipartFile;

public class User {
	private int userno;
	private String name;
	private String id;
	private String pass;
	private int age;
	private int gender;
	private String phone;
	private String email;
	private int emailkey;
	private int emailkeycheck;
	private String picture;
	private MultipartFile pictureUrl;
	
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getEmailkey() {
		return emailkey;
	}
	public void setEmailkey(int emailkey) {
		this.emailkey = emailkey;
	}
	public int getEmailkeycheck() {
		return emailkeycheck;
	}
	public void setEmailkeycheck(int emailkeycheck) {
		this.emailkeycheck = emailkeycheck;
	}
	
	public MultipartFile getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(MultipartFile pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	@Override
	public String toString() {
		return "User [userno=" + userno + ", name=" + name + ", id=" + id + ", pass=" + pass + ", age=" + age
				+ ", gender=" + gender + ", phone=" + phone + ", email=" + email + ", emailkey=" + emailkey
				+ ", emailkeycheck=" + emailkeycheck + ", picture=" + picture + ", pictureUrl=" + pictureUrl + "]";
	}
	
}
