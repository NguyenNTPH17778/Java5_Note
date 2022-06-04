package com.example.IT16306.controller;

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
import com.example.IT16306.reponsitory.java.com.example.IT16306.responsitory.CategoriesReponsitory;
import com.excample.IT16306.beans.CategoriesModel;

@Controller
@RequestMapping("/categories/")
public class CategoriesController {
	
	@Autowired
	CategoriesReponsitory cr;
	
	@GetMapping("/create")
	public String create(@ModelAttribute("category") CategoriesModel model) {
		
		return"/admin/categories/create";
	}
	
	@PostMapping("/create")
	public String store(@ModelAttribute("category") CategoriesModel model) {
		Categories ct = new Categories(); 
		ct.setId(model.getId());
		ct.setName(model.getName());
		cr.save(ct);
		
		return"/admin/categories/create";
	}
	
	@RequestMapping("index")
	public String paging(ModelMap model,@RequestParam("p") Optional<Integer> p,HttpServletRequest req) {
		Pageable page=PageRequest.of(p.orElse(0),4);
		Page<Categories> list= cr.findAll(page);
	   model.addAttribute("data",list);
		return "admin/categories/index";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest req) {
		Integer id=Integer.parseInt(req.getParameter("id"));
		cr.delete(cr.getById(id));
		return "redirect:/categories/index";
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute("categories")CategoriesModel model,HttpServletRequest req,HttpServletResponse res)throws Exception
	{
		
		req.setCharacterEncoding("utf-8");
		res.getCharacterEncoding();

		Categories ct = cr.getById(model.getId());		
		ct.setName(model.getName());

		this.cr.save(ct);
	
		return "redirect:/categories/index";
	}
}
