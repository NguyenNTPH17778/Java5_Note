package com.example.IT16306.Entities;
import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;



@Data
@Entity
@Table(name="products")
public class Products implements Serializable { 	
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="image")
	private String image;
	
	@Column(name="price")
	private Double price;
	
	@Column(name="created_date")
	@Temporal(TemporalType.DATE)
	private Date created_date;
	
	@Column(name="available")
	private Integer available;
	
	@ManyToOne
	@JoinColumn(name="category_id")
	private Categories category_id;
}
