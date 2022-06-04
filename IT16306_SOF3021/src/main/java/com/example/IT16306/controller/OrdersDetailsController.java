package com.example.IT16306.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.IT16306.Entities.Orders;
import com.example.IT16306.Entities.Orders_Details;
import com.example.IT16306.Entities.Products;
import com.example.IT16306.reponsitory.java.com.example.IT16306.responsitory.OrdersDetailsReponsitory;
import com.example.IT16306.reponsitory.java.com.example.IT16306.responsitory.OrdersReponsitory;
import com.example.IT16306.reponsitory.java.com.example.IT16306.responsitory.ProductsReponsitory;
import com.excample.IT16306.beans.OrdersDetailsModel;
import com.excample.IT16306.beans.OrdersModel;


@Controller
@RequestMapping("/orders-details")
public class OrdersDetailsController {
	@Autowired
	OrdersDetailsReponsitory odr;
	
	@Autowired
	OrdersReponsitory or;
	
	@Autowired
	ProductsReponsitory pr;
	
	@ModelAttribute("orderdetails")
	public List<Orders_Details> selectAll(){
		return odr.findAll();
	}
	
	@GetMapping("/create")
	public String create( OrdersDetailsModel model,ModelMap mm) {
		mm.addAttribute("order_details",model);
		return"/admin/orders_details/create";
	}
	
	@PostMapping("/create")
	public String store(@ModelAttribute("orders_details") OrdersDetailsModel model) throws Exception{
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");		
		Orders_Details od_dt = new Orders_Details(); 
		od_dt.setId(model.getId());
		od_dt.setOrder(model.getOrders());
		od_dt.setProduct(model.getProduct());
		od_dt.setPrice(model.getPrice());
		od_dt.setQuantity(model.getQuantity());
		odr.save(od_dt);
		
		return"/admin/orders_details/create";
	}
	
	
	@ModelAttribute("orders")
	public List<Orders> selectAllOrders(){
		return or.findAll();
	}
	
	
	@ModelAttribute("products")
	public List<Products> selectAllP(){
		return pr.findAll();
	}
	
}
