package project.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import project.models.cartGen;


public class RowMappingCart implements RowMapper<cartGen> {
	public cartGen mapRow(ResultSet rs,int rows) throws SQLException{
		try {
			cartGen cart = new cartGen();
			cart.setCid(rs.getInt("Cid"));
			cart.setUid(rs.getInt("Uid"));		
			cart.setTotal(rs.getFloat("Total"));	
			return cart;
		}
		catch(Exception e){
			System.out.println(e.getLocalizedMessage());
			return null;
		}
	}

}
