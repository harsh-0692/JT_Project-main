package project.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import project.models.user;

public class RowMappingUser implements RowMapper<user> {
	public user mapRow(ResultSet rs,int rows) throws SQLException{
		try {
			user u = new user();
			u.setName(rs.getString("name"));
			u.setEmail(rs.getString("email"));
			u.setId(rs.getInt("id"));
			u.setMobile(rs.getString("mobile"));
			u.setPassword(rs.getString("password"));
			u.setAddress(rs.getString("address"));
			u.setShipping_address(rs.getString("shipping_address"));
			u.setLastlogin(rs.getString("lastlogin"));
			return u;
		}
		catch(Exception e){
			System.out.println(e.getLocalizedMessage());
			return null;
		}
	}

}
