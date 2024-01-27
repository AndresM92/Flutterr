package com.example.demo.models;

import javax.persistence.*;

@Entity
@Table(name="users")
public class UserModel {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;
	
	@Column(unique=true,nullable=false)
	private String cc;
	
	private String name;
	private String last_name;
	private int age;
	private String number_phone;
	private String email;
	
	
	public UserModel() {
		super();
	}
	
	public UserModel(String cc, int id, String name, String last_name, int age, String number_phone, String email) {
		super();
		this.id = id;
		this.cc = cc;
		this.name = name;
		this.last_name = last_name;
		this.age = age;
		this.number_phone = number_phone;
		this.email = email;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	
	public String getCc() {
		return cc;
	}

	public void setCc(String cc) {
		this.cc = cc;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getLast_name() {
		return last_name;
	}
	
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getNumber_phone() {
		return number_phone;
	}
	
	public void setNumber_phone(String number_phone) {
		this.number_phone = number_phone;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}

}
