package com.excample.IT16306.beans;

import java.util.Date;

import com.example.IT16306.Entities.Categories;

import lombok.Data;

@Data
public class ProductsModel { 
	private Integer id;
	private String name;
	private String image;
	private Double price;
	private String created_date;
	private Integer available;
	private Categories categories_id;
	
}
