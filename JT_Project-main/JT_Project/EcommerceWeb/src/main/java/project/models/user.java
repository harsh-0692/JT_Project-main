package project.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class user {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	private String mobile; 
	private String email;
	private String password;
	private String address;
	private String shipping_address;
	private String lastlogin;

	public user() {
		super();
		// TODO Auto-generated constructor stub
	}
	public user(String name, String mobile, String email, String password, String address,
			String shipping_address, String lastlogin) {
		super();
		
		this.name = name;
		this.mobile = mobile;
		this.email = email;
		this.password = password;
		this.address = address;
		this.shipping_address = shipping_address;
		this.lastlogin = lastlogin;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLastlogin() {
		return lastlogin;
	}
	public void setLastlogin(String lastLogin) {
		this.lastlogin = lastLogin;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	} 
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getShipping_address() {
		return shipping_address;
	}
	public void setShipping_address(String shipping_address) {
		this.shipping_address = shipping_address;
	}
 
	

}
