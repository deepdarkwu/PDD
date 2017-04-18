package bean;

public class User {
	private String name;
	private String password;
	private int id;
	private String niname;
	public User(int id,String name,String password,String niname){
		this.id=id;
		this.name=name;
		this.password=password;
		this.niname=niname;
	}
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNiname() {
		return niname;
	}
	public void setNiname(String niname) {
		this.niname = niname;
	}
}
