package com.excample.IT16306.beans;

import java.util.Date;

import com.example.IT16306.Entities.Account;

import lombok.Data;

@Data
public class OrdersModel {		
	private Integer id;
	private String created_date;
	private String address;
	private Account user_name;
}
