package project.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class cartGen {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Cid;
	
	private int Uid;

	private float Total;
	
	public cartGen() {
		super();
		// TODO Auto-generated constructor stub
	}

	public float getTotal() {
		return Total;
	}

	public void setTotal(float total) {
		Total = total;
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

	public cartGen(int cid, int uid) {
		super();
		Cid = cid;
		Uid = uid;
	}

	public cartGen(int uid) {
		
		Uid = uid;
		
	}

}
