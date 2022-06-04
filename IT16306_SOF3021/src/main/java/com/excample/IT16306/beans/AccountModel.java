package com.excample.IT16306.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccountModel {
	private Integer id;
	private String username;
	private String password;
	private String fullname;
	private String email;
	private String photo;
	private Integer admin;
	
	public Integer getAdmin() {
		return this.admin; 
	}
	public void setAdmin(Integer admin) {
		this.admin=admin;
	}
}
