package com.example.IT16306.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.example.IT16306.Entities.Categories;
import com.example.IT16306.Entities.Products;
import com.example.IT16306.reponsitory.java.com.example.IT16306.responsitory.CategoriesReponsitory;
import com.example.IT16306.reponsitory.java.com.example.IT16306.responsitory.ProductsReponsitory;
import com.excample.IT16306.beans.ProductsModel;



@Controller
@RequestMapping("/products/")
public class ProductsController {
	
	@Autowired
	ProductsReponsitory pr;
	
	@Autowired
	CategoriesReponsitory cr;
	
	@GetMapping("/create")
	public String create(@ModelAttribute("products") ProductsModel acc)
	{
		return "admin/products/create";
	}

	@PostMapping("/create")
	public String store(@ModelAttribute("products")ProductsModel model,HttpServletRequest req,HttpServletResponse res)throws Exception
	{
		SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");
		req.setCharacterEncoding("utf-8");
		res.getCharacterEncoding();		
		Products pd = new Products();	
		pd.setId(model.getId());
		pd.setName(model.getName());
		pd.setImage(model.getImage());
		pd.setPrice(model.getPrice());				
		pd.setCreated_date(s.parse(model.getCreated_date()));
		pd.setAvailable(model.getAvailable());
		pd.setCategory_id(model.getCategories_id());
		pr.save(pd);
		
		
		return "admin/products/create";
	}

	@RequestMapping("/delete")
	public String delete(HttpServletRequest req) {
		Integer id=Integer.parseInt(req.getParameter("id"));
		pr.delete(pr.getById(id));
		return "redirect:/products/index";
	}
	@RequestMapping("index")
	public String paging(ModelMap model,@RequestParam("p") Optional<Integer> p,HttpServletRequest req) {
		Pageable page=PageRequest.of(p.orElse(0),2);
		Page<Products> list=pr.findAll(page);
	   model.addAttribute("data",list);
		return "admin/products/index";
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute("products")ProductsModel model,HttpServletRequest req,HttpServletResponse res)throws Exception
	{
		
		req.setCharacterEncoding("utf-8");
		res.getCharacterEncoding();
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
		Products pd = pr.getById(model.getId());		
		pd.setId(model.getId());
		pd.setName(model.getName());
		pd.setImage(model.getImage());
		pd.setPrice(model.getPrice());				
		pd.setCreated_date(s.parse(model.getCreated_date()));
		pd.setAvailable(model.getAvailable());
		pd.setCategory_id(model.getCategories_id());
		
		
		pr.save(pd);
	
		return "redirect:/products/index";
	}
	@ModelAttribute("category")
     public List<Categories>getCategorie(){
	return cr.findAll();
	}
	

}
