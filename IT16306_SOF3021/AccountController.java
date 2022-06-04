package com.example.IT16306.controller;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.IT16306.Entities.Account;
import com.example.IT16306.reponsitory.java.com.example.IT16306.responsitory.AccountReponsitory;
import com.excample.IT16306.beans.AccountModel;


@Controller
@RequestMapping("/admin/accounts")
public class AccountController {
	@Autowired
	AccountReponsitory accountRepo;
	
	@GetMapping("/create")
	public String create(@ModelAttribute("account") AccountModel acc)
	{
		return "admin/account/create";
	}

	@PostMapping("/create")
	public String store(@ModelAttribute("account")AccountModel model,HttpServletRequest req,HttpServletResponse res)throws Exception
	{
		req.setCharacterEncoding("utf-8");
		res.getCharacterEncoding();
		Account acc = new Account();	
		acc.setId(model.getId());
		acc.setFullname(model.getFullname());
		acc.setUsername(model.getUsername());
		acc.setPassword(model.getPassword());
		acc.setEmail(model.getEmail());
		acc.setPhoto(model.getPhoto());
		acc.setAdmin(model.getAdmin());
		acc.setActivated(0);		
		this.accountRepo.save(acc);
	
		return "admin/account/create";
	}

//	@GetMapping("delete/{id}")
//	public String delete(@PathVariable("id") Account account)
//	{
//		System.out.println(account.getEmail());
//		// Account a = this.accountRepo.getById(id);
//		this.accountRepo.delete(account);
//
//		return "redirect:/admin/account/create";
//	}
	
//	@GetMapping("index")
//	public String index(
//		Model model,
//		@RequestParam(name="size", defaultValue="10") Integer size,
//		@RequestParam(name="page", defaultValue="0") Integer page
//	) 
//	{
//		
//		Pageable pageable = PageRequest.of(page, size);
//		Page<Account> p = this.accountRepo.findAll(pageable);
//		model.addAttribute("data", p);
//		return "admin/account/index";
//	}
	
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest req) {
		Integer id=Integer.parseInt(req.getParameter("id"));
		accountRepo.delete(accountRepo.getById(id));
		return "redirect:/admin/accounts/index";
	}
	@RequestMapping("index")
	public String paging(ModelMap model,@RequestParam("p") Optional<Integer> p,HttpServletRequest req) {
		Pageable page=PageRequest.of(p.orElse(0),2);
		Page<Account> list=accountRepo.findAll(page);
	   model.addAttribute("data",list);
		return "admin/account/index";
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute("account")AccountModel model,HttpServletRequest req,HttpServletResponse res)throws Exception
	{
		
		req.setCharacterEncoding("utf-8");
		res.getCharacterEncoding();

		Account acc = accountRepo.getById(model.getId());		
		acc.setFullname(model.getFullname());
		acc.setUsername(model.getUsername());
		acc.setPassword(acc.getPassword());
		acc.setEmail(model.getEmail());
		acc.setPhoto(model.getPhoto());
		acc.setAdmin(0);
		acc.setActivated(0);	
		System.out.println(model.getAdmin());
		System.out.println(model.getId());
		this.accountRepo.save(acc);
	
		return "redirect:/admin/accounts/index";
	}
	
	

}
