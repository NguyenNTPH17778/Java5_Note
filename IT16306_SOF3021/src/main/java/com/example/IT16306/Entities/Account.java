package com.example.IT16306.Entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "accounts")
public class Account implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	@Column(name="username")
	private String username;
	
	@Column(name="password")
	private String password; 
	
	@Column(name="fullname")
	private String fullname; 
	
	@Column(name="email")
	private String email; 
	
	@Column(name="photo")
	private String photo;
	
	@Column(name="activated")
	private Integer activated;
	
	@Column(name="admin")
	private Integer admin;
	
}
