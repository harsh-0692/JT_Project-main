package project.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.dao.DaoAdmin;
import project.dao.UserDao;
import project.models.Admins;
import project.models.Cart;
import project.models.Product;
import project.models.cartGen;
import project.models.user;

@Controller
public class UserController {
	@Autowired
	private UserDao userdao;
	
	@Autowired
	private DaoAdmin dao; 
	
	@RequestMapping("/")
	public String home() {
		return "index";
	}
	@RequestMapping("/signup")
	public String signform()
	{
		System.out.println("this is signup page");
		return "newuser";
	}
	
	@RequestMapping("/login")
	public String loginform()
	{
		System.out.println("this is login page");
		return "login";
	}
	
	
	@RequestMapping(path = "/register",method = RequestMethod.POST)
	public ModelAndView SaveUser(@RequestParam("name") String name,
			 @RequestParam("email") String email,
			 @RequestParam("mobile") String mobile,
			
			 @RequestParam("address") String address,
			 @RequestParam("shipping_address") String shipping_address,
			 @RequestParam("password") String pass,ModelAndView model)
	{
		user u1 = userdao.checkemail(email);
		
		if(u1 == null)
		{
			DateTimeFormatter Dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
			String date= Dtf.format(LocalDateTime.now());
			
			user u = new user(name,mobile,email,pass,address,shipping_address,date);
			userdao.saveuser(u);
			user User= userdao.getUser(email,pass);
		    int Uid = User.getId();
		    cartGen cart = new cartGen(Uid);
			userdao.setcart(cart);
			model.setViewName("login");
			return model;
		}
		else {
			
			model.addObject("error", "user with this email already exists!!!");
			model.setViewName("newuser");
			return model;
		}
		
		
	}
	
	@RequestMapping(path = "loguser",method = RequestMethod.POST)
	public ModelAndView getUser(HttpServletRequest request,@RequestParam("email") String email, @RequestParam("password") String pass, Model model) 
	{	  
		   
	       user User= userdao.getUser(email,pass);
	       
	       if(User == null)
		   {
				model.addAttribute("error", "User not Found!!!");
				return new ModelAndView("redirect:/login");
		   }
	       else {
		   
			    System.out.println(User.getName());
				model.addAttribute("user", User);
				request.getSession().setAttribute("User", User);
				return new ModelAndView("redirect:/home");
		   
	       }
	        
	  }
	@RequestMapping("/home")
	public ModelAndView homepage(ModelAndView model,HttpServletRequest request) throws IOException
	{
		System.out.println("this is home page");
		List<Product> products = dao.listProduct();
		 user User= (user)request.getSession().getAttribute("User");	
		 cartGen C= userdao.getcart(User.getId());
		 System.out.println(User.getName());
		model.addObject("products",products);
		model.addObject("user",User);
		int id = C.getCid();
		model.addObject("cid",id);
		return model;
	}
	@RequestMapping("/Logout")
	public ModelAndView logout(HttpServletRequest request)
	{
		String User = (String)request.getSession().getAttribute("");
		if( User != null)
		{
			request.getSession().removeAttribute("User");
			request.getSession().invalidate();
			return new ModelAndView("redirect:/index");
		}
		return new ModelAndView("redirect:/index");
	}
	
	@RequestMapping("/index")
	public ModelAndView index(ModelAndView model)
	{
		model.setViewName("index");
		return model;
	}
	
	@RequestMapping("product")
	public ModelAndView displayProduct(HttpServletRequest request,ModelAndView model)
	{
		try {
		int pid = Integer.parseInt(request.getParameter("pid"));
		int cartid = Integer.parseInt(request.getParameter("cid"));
		user User= (user)request.getSession().getAttribute("User");
		List<Product> products = dao.listProduct();
		Product product = dao.getProduct(pid);
		System.out.println("this is product");
		model.addObject("cid",cartid);
		model.addObject("product",product);
		model.addObject("products",products);
		model.addObject("user",User);
		return model;
		}
		catch(Exception e)
		{
			System.out.println(e.getLocalizedMessage());
			return new ModelAndView("login");
		}
	}
	@RequestMapping("cart")
	public ModelAndView showCart(HttpServletRequest request,ModelAndView model)
	{
		try {
	
		int cartid = Integer.parseInt(request.getParameter("cid"));
		user User= (user)request.getSession().getAttribute("User");	
	
		cartGen cg = userdao.getcart(User.getId());
		List<Cart> Cartitems = userdao.listCartItems(cartid);
		
		
		model.addObject("itemslist",Cartitems);
		model.addObject("usercart",cg);
		model.addObject("user",User);
		model.setViewName("cart");
		System.out.println("this is cart");
		return model;
		}
		catch(Exception e)
		{
			System.out.println(e.getLocalizedMessage());
			return new ModelAndView("login");
		}
	}
	@RequestMapping("addTocart")
	public ModelAndView AddToCart(HttpServletRequest request,ModelAndView model)
	{
		try {
		int Pid = Integer.parseInt(request.getParameter("pid"));
		user User= (user)request.getSession().getAttribute("User");	
		int Uid =User.getId();
		float total=0;
		cartGen C= userdao.getcart(Uid);
		int Cid = C.getCid(); 
		Product product = dao.getProduct(Pid);
		String Pname  = product.getPname();
		float Price = product.getPrice();
		int stock = product.getQuantity();
		int Quantity = Integer.parseInt(request.getParameter("qty"));
		Cart item = new  Cart(Cid,Uid,Pid,Pname,Price,Quantity);
		userdao.setCartItem(item);
		int finalStock = stock - Quantity;
		if(finalStock < 0)
		{
			return new ModelAndView("redirect:/product?pid=Pid");
		}
		userdao.updateStock(Pid,finalStock);
		List<Cart> Cartitems = userdao.listCartItems(Cid);
		for(Cart c:Cartitems) {
			total += c.getTotal();
		}
		System.out.println(total);
		userdao.updatetotal(Cid, total);
		cartGen cg= userdao.getcart(Uid);
		model.addObject("cid",Cid);
		model.addObject("itemslist",Cartitems);
		model.addObject("user",User);
		model.addObject("usercart",cg);
		model.setViewName("cart");
		System.out.println("this is add To cart");
		return model; 
		}
		catch(Exception e)
		{
			System.out.println(e.getLocalizedMessage());
			return new ModelAndView("login");
		}
	}
	@RequestMapping("/deleteItem")
	public ModelAndView deleteCartItem(HttpServletRequest request,ModelAndView model)
	{
		try {
		int cartid = Integer.parseInt(request.getParameter("cid"));
		int proid = Integer.parseInt(request.getParameter("pid"));
		int srno = Integer.parseInt(request.getParameter("SrNo"));
		cartGen C= userdao.getcartgen(cartid);
		int userid =C.getUid();
		user User = userdao.getUserByid(userid);
		float total=0;
		
		Cart cartitem = userdao.getCartItem(srno);
		int quantity = cartitem.getQuantity();
		userdao.deleteCartItem(srno);
		Product product = dao.getProduct(proid);
		int fstock = product.getQuantity() + quantity;
		userdao.updateStock(proid,fstock);
		List<Cart> Cartitems = userdao.listCartItems(cartid);
		for(Cart c:Cartitems) {
			total += c.getTotal();
		}
		System.out.println(total);
		userdao.updatetotal(cartid, total);
		cartGen cg= userdao.getcart(userid);
		model.addObject("usercart",cg);
		model.addObject("itemslist",Cartitems);
		model.addObject("user",User);
		model.setViewName("cart");
		System.out.println("this is delete cart item");
		return model;
		}
		catch(Exception e)
		{
			System.out.println(e.getLocalizedMessage());
			return new ModelAndView("login");
		}
		
	}
	@RequestMapping("bill")
	public ModelAndView bill(HttpServletRequest request,ModelAndView model)
	{
		try {
		int cartid = Integer.parseInt(request.getParameter("cid"));
		user User= (user)request.getSession().getAttribute("User");	
		float total=0;
		cartGen cg = userdao.getcart(User.getId());
		List<Cart> Cartitems = userdao.listCartItems(cartid);
		userdao.updatetotal(cartid, total);
		model.addObject("itemslist",Cartitems);
		model.addObject("cart",cg);
		model.addObject("user",User);
		model.setViewName("Bill");
		userdao.deleteCartItems(cartid);
		System.out.println("this is billing");
		return model;
		}
		catch(Exception e)
		{
			System.out.println(e.getLocalizedMessage());
			return new ModelAndView("login");
		}
	}

}
