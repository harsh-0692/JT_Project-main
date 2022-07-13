package project.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Category {


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int CatId;
	
	private String name;
	
	public int getCatId() {
		return CatId;
	}

	public Category(String name) {
		super();
		this.name = name;
	}

	public void setCatId(int cartId) {
		CatId = cartId;
	}

	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
