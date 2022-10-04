package com.example.festlook.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.festlook.models.Cart;
import com.example.festlook.models.User;

@Repository
public interface CartRepo extends JpaRepository<Cart, Long> {
	
	public List<Cart> findByUser(User user);
}
