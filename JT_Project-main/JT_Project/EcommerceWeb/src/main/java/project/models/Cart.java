package project.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Cart {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int SrNo;
	
	public int getSrNo() {
		return SrNo;
	}

	public void setSrNo(int srNo) {
		SrNo = srNo;
	}
	private int Cid;
	
	private int Uid;
	private int Pid;
	
	private String Pname;
	private float price; 
	private int quantity;
	private float total;
	
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Cart(int cid, int uid, int pid, String pname, float price, int quantity) {
		super();
		Cid = cid;
		Uid = uid;
		Pid = pid;
		Pname = pname;
		this.price = price;
		this.quantity = quantity;
	
	}

	public int getCid() {
		return Cid;
	}
	public void setCid(int cid) {
		Cid = cid;
	}
	public int getUid() {
		return Uid;
	}
	public void setUid(int uid) {
		Uid = uid;
	}
	public int getPid() {
		return Pid;
	}
	public void setPid(int pid) {
		Pid = pid;
	}
	public String getPname() {
		return Pname;
	}
	public void setPname(String pname) {
		Pname = pname;
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
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	

}
