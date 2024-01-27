package com.example.demo.repositories;

import com.example.demo.models.UserModel;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;


@Repository
public interface UserRepository extends JpaRepository< UserModel, Integer>  {
	
	public abstract ArrayList<UserModel> findByCc(String n);
	public abstract boolean existsByName(String n);
	public abstract boolean existsByCc(String n);
	
	public abstract UserModel findById(int n);
	public abstract UserModel deleteById(int id);
	
}
