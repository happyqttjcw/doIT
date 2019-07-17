package logic;

import org.springframework.web.multipart.MultipartFile;

public class User {
	private int userno;
	private String name;
	private String id;
	private String pass;
	private String age;
	private int gender;
	private String phone;
	private String email;
	private MultipartFile pictureUrl;
	private String picture;
	
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
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
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
				+ ", gender=" + gender + ", phone=" + phone + ", email=" + email + ", picture=" + picture + "]";
	}
}
