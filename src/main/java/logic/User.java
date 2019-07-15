package logic;

public class User {
	private int userno;
	private String name;
	private String id;
	private int age;
	private int gender;
	private String phone;
	private String email;
	private int emailkey;
	private int emailkeycheck;
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
	@Override
	public String toString() {
		return "User [userno=" + userno + ", name=" + name + ", id=" + id + ", age=" + age + ", gender=" + gender
				+ ", phone=" + phone + ", email=" + email + ", emailkey=" + emailkey + ", emailkeycheck="
				+ emailkeycheck + "]";
	}
	
	
}
