package com.example.IT16306.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.IT16306.Entities.Account;
import com.example.IT16306.Entities.Orders;
import com.example.IT16306.reponsitory.java.com.example.IT16306.responsitory.AccountReponsitory;
import com.example.IT16306.reponsitory.java.com.example.IT16306.responsitory.OrdersReponsitory;
import com.excample.IT16306.beans.OrdersModel;

@Controller
@RequestMapping("/orders/")
public class OrdersController {
	
	@Autowired
	OrdersReponsitory or;
	
	@Autowired
	AccountReponsitory ar;
	
	@GetMapping("/create")
	public String create(@ModelAttribute("orders") OrdersModel model) {
		
		return"/admin/orders/create";
	}
	
	@PostMapping("/create")
	public String store(@ModelAttribute("orders") OrdersModel model) throws Exception{
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");		
		Orders od = new Orders(); 
		od.setId(model.getId());
		od.setCreated_date(s.parse(model.getCreated_date()));
		od.setAddress(model.getAddress());
		od.setUser_id(model.getUser_name());
		or.save(od);
		
		return"/admin/orders/create";
	}
	
	@ModelAttribute("accounts")
	public List<Account> getAccount(){
		return ar.findAll();
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest req) {
		Integer id=Integer.parseInt(req.getParameter("id"));
		or.delete(or.getById(id));
		return "redirect:/orders/index";
	}
	@RequestMapping("index")
	public String paging(ModelMap model,@RequestParam("p") Optional<Integer> p,HttpServletRequest req) {
		Pageable page=PageRequest.of(p.orElse(0),2);
		Page<Orders> list=or.findAll(page);
	   model.addAttribute("data",list);
		return "admin/orders/index";
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute("orders") OrdersModel model) throws Exception{
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
		Orders od = or.getById(model.getId()); 
		od.setId(model.getId());
		od.setCreated_date(s.parse(model.getCreated_date()));
		od.setAddress(model.getAddress());
//		od.setUser_id(model.getUser_name());
		or.save(od);
		
		return"redirect:/orders/index";
	}
}
