package project.dao;


import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.orm.hibernate5.HibernateTemplate;

import project.Mapper.RowMappingCart;
import project.Mapper.RowMappingCartitems;
import project.Mapper.RowMappingUser;
import project.models.Cart;
import project.models.cartGen;
import project.models.user;


@Repository
public class UserDao {
	
	
	@Autowired
	private HibernateTemplate HibTemp;
	
	@Autowired
	private JdbcTemplate jdbctemp;
	
	public HibernateTemplate getHt() {
		return HibTemp;
	}
	
	public void setHt(HibernateTemplate HibTemp) {
		this.HibTemp = HibTemp;
	}
	
	@Transactional
	public void saveuser(user User) {
		this.HibTemp.save(User);
	}
	
	@Transactional
	public int updateUser(user u) {
		return 0;
	}
	
	public user checkemail(String email) {
		
		try {
			String query = "select * from user where email=?";
			RowMapper<user> row  = new RowMappingUser();
			user u = jdbctemp.queryForObject(query, row, email);
			return u;
			}
			catch(Exception e) {
				System.out.println(e.getLocalizedMessage());
				return null;
			}
	}
	
	public user getUser(String email, String password)
	{
		try {

			String query = "select * from user where email= ? and password = ?";
			RowMapper<user> row  = new RowMappingUser();
			user u = jdbctemp.queryForObject(query, row, email, password);
			return u;
			}
			catch(Exception e) {
				System.out.println(e.getLocalizedMessage());
				return null;
			}
	}
	public user getUserByid(int uid)
	{
		try {

			String query = "select * from user where id=?";
			RowMapper<user> row  = new RowMappingUser();
			user u = jdbctemp.queryForObject(query, row, uid);
			return u;
			}
			catch(Exception e) {
				System.out.println(e.getLocalizedMessage());
				return null;
			}
	}
	
	@Transactional
	public void setcart(cartGen c) {
		this.HibTemp.save(c);
	}
	
    public cartGen getcart(int uid) {
		
		try {
			String query = "select * from cartGen where Uid=?";
			RowMapper<cartGen> row  = new RowMappingCart();
			cartGen cart = jdbctemp.queryForObject(query, row, uid);
			return cart;
			}
			catch(Exception e) {
				System.out.println(e.getLocalizedMessage());
				return null;
			}
	}
    public void setCartItem(Cart item) {
    	float Total =item.getPrice()*item.getQuantity();
    	String query = "insert into Cart(Cid,Uid,Pid,Pname,price,quantity,total) values(?,?,?,?,?,?,?)";
        int r = this.jdbctemp.update(query,item.getCid(),item.getUid(),item.getPid(),item.getPname(),item.getPrice(),item.getQuantity(),Total);
		System.out.println(r);
    }
    
    public List<Cart> listCartItems(int cid){
    	String query = "select * from Cart where Cid=?";
    	RowMapper<Cart> row  = new RowMappingCartitems();
		List<Cart> cartItems = jdbctemp.query(query, row, cid);
    	
		return cartItems;
    }
    
public void updatetotal(int cid,float total) {
    	
    	String query = "update cartGen set Total=? where Cid =?";
        int t = this.jdbctemp.update(query,total,cid);
		
		System.out.println(t);
    }
    public void updateStock(int Pid,int finalStock) {
    	
    	String query = "update Product set quantity=? where pid =?";
        int t = this.jdbctemp.update(query,finalStock,Pid);
		
		System.out.println(t);
    }
    public void deleteCartItem(int Srno) {
    	String query = "delete from Cart where SrNo=? ";
        int r = this.jdbctemp.update(query,Srno);
        System.out.println(r);
    }
    public Cart getCartItem(int no) {
    	String query = "select * from Cart where SrNo=? ";
		RowMapper<Cart> row  = new RowMappingCartitems();
		Cart cart = jdbctemp.queryForObject(query, row, no);
    	return cart;
    }
    public void deleteCartItems(int cid) {
    	String query = "delete from Cart where Cid=? ";
        int r = this.jdbctemp.update(query,cid);
        System.out.println(r);
    }
    
 public cartGen getcartgen(int cid) {
		
		try {
			String query = "select * from cartGen where Cid=?";
			RowMapper<cartGen> row  = new RowMappingCart();
			cartGen cart = jdbctemp.queryForObject(query, row, cid);
			return cart;
			}
			catch(Exception e) {
				System.out.println(e.getLocalizedMessage());
				return null;
			}
	}
	

}
