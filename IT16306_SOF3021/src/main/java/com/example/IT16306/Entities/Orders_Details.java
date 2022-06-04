package com.example.IT16306.Entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name="order_details")
public class Orders_Details implements Serializable{ 	

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;

	@ManyToOne
	@JoinColumn(name="order_id")
	private Orders order;

	@ManyToOne
	@JoinColumn(name="product_id")
	private Products product;

	@Column(name="price")
	private Double price;

	@Column(name="quantity")
	private Integer quantity;
}
