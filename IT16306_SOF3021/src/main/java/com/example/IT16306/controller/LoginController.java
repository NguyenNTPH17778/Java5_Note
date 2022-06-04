package com.example.IT16306.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.excample.IT16306.beans.Login;

@Controller
public class LoginController {

	@GetMapping("login")
	public String GetLoginForm() {
		return"login";
	}

//	@PostMapping("login")
//	public String login(Model model, 
//			@RequestParam(name = "email", required = false)String email, 
//			@RequestParam(name = "password", required = false)String password
//			) {
//		System.out.println(email);
//		System.out.println(password);
//		
//		return"login";
//	}
//	
	@PostMapping("login")
	public String login(Login login) {
		System.out.println(login.getEmail());
		System.out.println(login.getPassword());
		
		return"login";
	}
	
	
}
