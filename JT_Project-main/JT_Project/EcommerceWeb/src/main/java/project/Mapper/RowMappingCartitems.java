package project.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import project.models.Cart;
import project.models.cartGen;

public class RowMappingCartitems implements RowMapper<Cart> {
	public Cart mapRow(ResultSet rs,int rows) throws SQLException{
		try {
			Cart item = new Cart();
			item.setSrNo(rs.getInt("SrNo"));
			item.setCid(rs.getInt("Cid"));	
			item.setUid(rs.getInt("Uid"));
			item.setPid(rs.getInt("Pid"));	
			item.setPname(rs.getString("Pname"));
			item.setPrice(rs.getFloat("price"));	
			item.setQuantity(rs.getInt("quantity"));
			item.setTotal(rs.getFloat("price")*rs.getFloat("quantity"));
			return item;
		}
		catch(Exception e){
			System.out.println(e.getLocalizedMessage());
			return null;
		}
	}

}