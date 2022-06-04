package com.excample.IT16306.beans;

import com.example.IT16306.Entities.Orders;
import com.example.IT16306.Entities.Products;

import lombok.Data;

@Data
public class OrdersDetailsModel {
	private Integer id;
	private Double price;
	private Integer quantity;
	
	private Orders orders;
	private Products product;	


}
