package com.example.demo.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.models.UserModel;
import com.example.demo.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	UserRepository userRepository;
	
	public ArrayList <UserModel> list_users(){
		return (ArrayList<UserModel>)userRepository.findAll();
	}
	
	public UserModel save_users(UserModel u) {
		return userRepository.save(u);
	}
	
	
	public ArrayList<UserModel> getCc(String id){
		return (ArrayList<UserModel>)userRepository.findByCc(id);
	}
	
	
	public UserModel List_id(int id){
		return userRepository.findById(id);
	}
	
	
	public UserModel deleteUser(int id) {
		return userRepository.deleteById(id);	
	}
	

	public boolean name(String name) {
		return userRepository.existsByName(name);
	}
	
	public boolean exist_cc(String cc) {
		return userRepository.existsByCc(cc);
	}
	
}
