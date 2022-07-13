package project.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import project.models.Admins;
import project.models.Category;
import project.models.Product;
import project.models.user;



@Repository
@Transactional
public class DaoAdmin {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private HibernateTemplate HibTemp;
	
	@Autowired
	private JdbcTemplate jdbctemp;
		//Admin
		public Admins getadmin(String email) {
			return (Admins) sessionFactory.getCurrentSession().get(
					Admins.class, email);
		}

		//Category
		public void addCategory(Category category)
		{
		        this.HibTemp.save(category);
		}
		
		@SuppressWarnings("unchecked")
		public List<Category> listCategory()
		{
			return sessionFactory.getCurrentSession().createQuery("from Category").list();
		}
		
		@SuppressWarnings("unchecked")
		public List<Product> selectProductCategoryWise(String cat)
		{
			String hql = "FROM Product WHERE category = :category";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			query.setParameter("category",cat);
			List results = query.list();
			
			return results;
		}
		
		
		public void updateCategory(String name,int catid)
		{
			String query = "update Category set name=? where  CatId=?";
	        int t = this.jdbctemp.update(query,name,catid);
			
			System.out.println(t);
		}
		
		public void deleteCategory(int catid)
		{
			Category c = (Category)sessionFactory.getCurrentSession().load(Category.class,catid);
			if(c!=null)
			{
				sessionFactory.getCurrentSession().delete(c);				
			}
			
		}
		
		public Category getCategory(int catid) {
			return (Category) sessionFactory.getCurrentSession().get(
					Category.class, catid);
		}
		
		
		//products
		public void addProduct(Product product)
		{
			sessionFactory.getCurrentSession().saveOrUpdate(product);
		}

		@SuppressWarnings("unchecked")
		public List<Product> listProduct()
		{
			return sessionFactory.getCurrentSession().createQuery("from Product").list();
		}

		public void updateProduct(Product product)
		{
			sessionFactory.getCurrentSession().update(product);
			
		}
		public void updateProducts(String newcat,String oldcat)
		{
			String query = "update Product set category=? where  category=?";
	        int t = this.jdbctemp.update(query,newcat,oldcat);
			
			System.out.println(t);
		}
		
		public void deleteProduct(int pid)
		{
			Product p = (Product)sessionFactory.getCurrentSession().load(Product.class,pid);
			if(p!=null)
			{
				sessionFactory.getCurrentSession().delete(p);				
			}
			
		}
		
		
		public Product getProduct(int pid) {
			return (Product) sessionFactory.getCurrentSession().get(
					Product.class, pid);
		}

		@SuppressWarnings("unchecked")
		public List<user> listusers() {
			return sessionFactory.getCurrentSession().createQuery("from user").list();
			// TODO Auto-generated method stub
			
		}
}

