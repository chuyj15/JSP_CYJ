package shop.dto;
//자바빈즈를 만들고 있어용. 시리얼라이저블을 임플리먼트해야하고, 기본생성자와 겟터셋터를 만들면 됩니당.
import java.io.Serializable;

public class User  implements Serializable {
	private  String id;
	private  String password ;
	private  String name ;
	private  String gender ;
	private  String birth ;
	private  String mail ;
	private  String phone ;
	private  String address ;
	private  String registDay ;
	
	public User() {
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRegistDay() {
		return registDay;
	}
	public void setRegistDay(String registDay) {
		this.registDay = registDay;
	}
}
