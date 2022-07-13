package project.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import project.models.Category;



public class RowMappingCategory implements RowMapper<Category> {
	public Category mapRow(ResultSet rs,int rows) throws SQLException{
		try {
			Category cat = new Category();
			cat.setCatId(rs.getShort("CatId"));
			cat.setName(rs.getString("name"));
			
			return cat;
			
		}
		catch(Exception e){
			System.out.println(e.getLocalizedMessage());
			return null;
		}
	}

}
