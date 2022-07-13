package project.controller;
import java.io.File;


import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.models.Admins;
import project.models.Category;
import project.models.Product;
import project.models.user;


@Controller
@RequestMapping("/admin")
public class Admin {
		@Autowired
		private project.dao.DaoAdmin dao;
	
		//login
		@RequestMapping("")
		public ModelAndView login(ModelAndView model)
		{
			Admins admin = new Admins();
			model.addObject("admin", admin);
			model.setViewName("adminLogin");
			return model;
		}
		
		@RequestMapping(value = "/login",method = RequestMethod.POST)
		public ModelAndView verify(HttpServletRequest request,@ModelAttribute Admins admin)
		{
			String email = admin.getEmail();
			String password = admin.getPassword();
			Admins info = dao.getadmin(email);
			if(password.equals(info.getPassword()))
			{
				request.getSession().setAttribute("email", email);
				return new ModelAndView("redirect:/admin/dashboard");
			}
			return new ModelAndView("redirect:/admin/");
		}
		
		//logout
		@RequestMapping("/logout")
		public ModelAndView logout(HttpServletRequest request)
		{
			String mail = (String)request.getSession().getAttribute("email");
			if(mail!=null)
			{
				request.getSession().removeAttribute("email");
				request.getSession().invalidate();
				return new ModelAndView("redirect:/index");
			}
			return new ModelAndView("redirect:/index");
		}
		
		
		//dashboard
		@RequestMapping("/dashboard")
		public String showDashboard()
		{
			return "dashboard";
		}
		
		@RequestMapping("/Users")
		public ModelAndView listUsers(ModelAndView model) throws IOException
		{
			List<user> Users = dao.listusers();
			model.addObject("userslist",Users);
			model.setViewName("users");
			return model;
		}
		
		//category
		@RequestMapping("/category")
		public ModelAndView listCategory(ModelAndView model) throws IOException
		{
			List<Category> categories = dao.listCategory();
			model.addObject("categorylist",categories);
			model.setViewName("category");
			return model;
		}
		
		@RequestMapping(value = "/addcategory", method = RequestMethod.GET)
		public ModelAndView newContact(ModelAndView model) {
//			Category category = new Category();
//			model.addObject("category", category);
			model.setViewName("categoryForm");
			return model;
		}
		
		@RequestMapping(value="/savecategory",method= RequestMethod.POST)
		public ModelAndView addCategory(@RequestParam("name") String name,HttpServletRequest request)
		{
			Category c = new Category(name);
			
			dao.addCategory(c);
			
			return new ModelAndView("redirect:category");
		}
		
	
		
		@RequestMapping(value = "/deletecategory", method = RequestMethod.GET)
		public ModelAndView deleteCategory(HttpServletRequest request) {
		
			int catId = Integer.parseInt(request.getParameter("catid"));
			Category category = dao.getCategory(catId);
			List<Product> pds = dao.selectProductCategoryWise(category.getName());
			
			for(Product p : pds)
			{
				dao.deleteProduct(p.getPid());
			}
			
			dao.deleteCategory(catId);
			return new ModelAndView("redirect:category");
		}

		@RequestMapping(value = "/editcategory", method = RequestMethod.GET)
		public ModelAndView editCategory(HttpServletRequest request,ModelAndView model) {
			int catId = Integer.parseInt(request.getParameter("catid"));
			Category category = dao.getCategory(catId);
			
			model.addObject("category", category);
            model.setViewName("editCategory");
			return model;
		}
		@RequestMapping(value = "catedit", method = RequestMethod.POST)
		public ModelAndView editCat(HttpServletRequest request,ModelAndView model,@RequestParam("name") String name,@RequestParam("catid") int catId) {
			
			Category category = dao.getCategory(catId);
			String oldname= category.getName();
		    dao.updateCategory(name,catId);
		    dao.updateProducts(name, oldname);
		    List<Category> categories = dao.listCategory();
			model.addObject("categorylist",categories);
			model.setViewName("category");
			return model;
		    
		}
		
		
		//product
		@RequestMapping("/product")
		public ModelAndView listProduct(ModelAndView model) throws IOException
		{
			List<Product> products = dao.listProduct();
			model.addObject("productlist",products);
			model.setViewName("products");
			return model;
		}
		
		@RequestMapping(value = "/addproduct", method = RequestMethod.GET)
		public String newProduct(HttpServletRequest request) {
			
			List<Category> categories = dao.listCategory();
			request.getSession().setAttribute("categories", categories);
//			model.addAttribute("products", product);
			return "productForm";
		}
		
		
		@RequestMapping(value="/saveproduct",method= RequestMethod.POST)
		public String addProduct(HttpServletRequest request)throws Exception
		{
			
			
			String name=request.getParameter("pname");
			String description = request.getParameter("description");
			float mrp = Float.parseFloat(request.getParameter("mrp"));
			float price = Float.parseFloat(request.getParameter("price"));
			String img = request.getParameter("image");
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			float discount = Float.parseFloat(request.getParameter("discount"));
			String category = request.getParameter("category");
			System.out.println(name+" "+description+" "+img+" "+mrp+" "+price+" "+quantity+" "+discount+" "+category);
			
			Product pd = new Product();
			pd.setPname(name);
			pd.setDescription(description);
			pd.setPhoto(img);
			pd.setMrp(mrp);
			pd.setPrice(price);
			pd.setQuantity(quantity);
			pd.setDiscount(discount);
			pd.setCategory(category);
			dao.addProduct(pd);
			
			return "redirect:product";
		}
		
		
		
		
		@RequestMapping(value = "/deleteproduct", method = RequestMethod.GET)
		public ModelAndView deleteProduct(HttpServletRequest request) {
			int pid = Integer.parseInt(request.getParameter("pid"));
			dao.deleteProduct(pid);
		
			return new ModelAndView("redirect:product");
		}

		@RequestMapping(value = "/editproduct", method = RequestMethod.GET)
		public ModelAndView editproduct(HttpServletRequest request) {
			int pid = Integer.parseInt(request.getParameter("pid"));
			Product product = dao.getProduct(pid);
			List<Category> categories = dao.listCategory();
			request.getSession().setAttribute("categories", categories);
			ModelAndView model = new ModelAndView("editProduct");////
			model.addObject("product", product);

			return model;
		}
		
		@RequestMapping(value="/updateproduct",method= RequestMethod.POST)
		public String updateProduct(HttpServletRequest request)throws Exception
		{
			
			int pid=Integer.parseInt(request.getParameter("pid"));
			String name=request.getParameter("pname");
			String description = request.getParameter("description");
			float mrp = Float.parseFloat(request.getParameter("mrp"));
			float price = Float.parseFloat(request.getParameter("price"));
			String img = request.getParameter("image");
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			float discount = Float.parseFloat(request.getParameter("discount"));
			String category = request.getParameter("category");
			System.out.println(name+" "+description+" "+img+" "+mrp+" "+price+" "+quantity+" "+discount+" "+category);
			
			Product pd = dao.getProduct(pid);;
			pd.setPname(name);
			pd.setDescription(description);
			pd.setPhoto(img);
			pd.setMrp(mrp);
			pd.setPrice(price);
			pd.setQuantity(quantity);
			pd.setDiscount(discount);
			pd.setCategory(category);
			dao.updateProduct(pd);
			
			return "redirect:product";
		}
		
}
