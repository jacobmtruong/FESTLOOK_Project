package com.example.festlook.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.festlook.models.Cart;
import com.example.festlook.models.User;
import com.example.festlook.repos.CartRepo;

@Service
public class CartService {
	@Autowired
	CartRepo cartRepo;
	
	
	public List<Cart> listItemsInCart (User user){
		return cartRepo.findByUser(user);
	}
	
	public Cart updateCart (Cart cart) {
		return cartRepo.save(cart);
	}
}
