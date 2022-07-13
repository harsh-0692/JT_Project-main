package project.models;
import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;


@Entity
public class Admins implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6051892571454940325L;
	
	@Id
	private String email;
	private String password;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
		
}
