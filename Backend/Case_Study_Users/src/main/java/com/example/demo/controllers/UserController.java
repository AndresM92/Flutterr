package com.example.demo.controllers;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.example.demo.models.UserModel;
import com.example.demo.services.UserService;

@CrossOrigin(origins="http://localhost:4200", maxAge=3600)
@RestController
@RequestMapping("user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@GetMapping
	public ArrayList<UserModel> list_users(){
		return userService.list_users();	
	}
	
	@PostMapping("/save")
	public UserModel save_users(@RequestBody UserModel u) {
		return this.userService.save_users(u);
	}
	
	
	@GetMapping("/search/{d}")
	public ArrayList<UserModel> search_user(@PathVariable("d") String id){
		return this.userService.getCc(id);	
	}
	
	
	@GetMapping("/list/{d}")
	public UserModel list_id(@PathVariable("d") int id){
		return userService.List_id(id);	
	}
	
	
	@PutMapping("/edit/{d}")
	public UserModel Edit_id(@RequestBody UserModel u, @PathVariable("d") int id){
		u.setId(id);
		return userService.save_users(u);
	}
	
	
	@DeleteMapping(value="/delete/{d}")
	public UserModel deleteUser(@PathVariable("d") int id) {
		return this.userService.deleteUser(id);
	}
	
	/////////////////////////////////////////////////////////////////
	@GetMapping("/search_name/{d}")
	public boolean name(@PathVariable("d") String name){
		return this.userService.name(name);	
	}
	
	@GetMapping("/search_cc/{d}")
	public boolean exist_cc(@PathVariable("d") String cc){
		return this.userService.exist_cc(cc);	
	}
	
	
}
