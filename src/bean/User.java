package bean;

public class User {
	private String name;
	private String password;
	private String id;
	private String qq;
	private String phone;
	private String mail;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}


	public User(String id,String name,String password,String phone,String qq,String mail){
		this.id=id;
		this.name=name;
		this.password=password;
		this.phone=phone;
		this.qq=qq;
		this.mail=mail;
	}

}
