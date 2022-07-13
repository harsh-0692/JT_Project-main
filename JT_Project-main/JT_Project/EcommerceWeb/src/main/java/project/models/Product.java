package project.models;


import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Transient;


@Entity
public class Product implements Serializable{
	
	
	private static final long serialVersionUID = 5795572774487272163L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int pid;
	
	@Column
	private String pname;
	
	@Column(length=300)
	private String description;
	
	@Column
	private String photo;
	
	@Column
	private float mrp;
	
	@Column
	private float price;
	
	@Column
	private int quantity;
	
	@Column
	private float discount;
	
	@Column
	private String category;
	
	public Product()
	{
		
	}


	public int getPid() {
		return pid;
	}


	public void setPid(int pid) {
		this.pid = pid;
	}


	public String getPname() {
		return pname;
	}


	public void setPname(String pname) {
		this.pname = pname;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getPhoto() {
		return photo;
	}


	public void setPhoto(String photo) {
		this.photo = photo;
	}


	public float getMrp() {
		return mrp;
	}


	public void setMrp(float mrp) {
		this.mrp = mrp;
	}


	public float getPrice() {
		return price;
	}


	public void setPrice(float price) {
		this.price = price;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public float getDiscount() {
		return discount;
	}


	public void setDiscount(float discount) {
		this.discount = discount;
	}




	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	

	


	


	

}
