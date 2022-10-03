package com.example.festlook.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;

import com.example.festlook.models.Cart;

import com.example.festlook.models.User;
import com.example.festlook.services.CartService;
import com.example.festlook.services.ItemService;
import com.example.festlook.services.UserService;

@Controller
public class CartController {
	@Autowired
	CartService cartService;

	@Autowired
	UserService userService;
	
	@Autowired
	ItemService itemService;

	@GetMapping("/cart")
	public String cartPage(Model model, HttpSession session) {

		Long sessionUser = (Long) session.getAttribute("user_id");

		User thisUser = userService.findOne(sessionUser);

		if (sessionUser == null) {
			return "redirect:/";
		} else {
			List<Cart> itemsInCart = cartService.listItemsInCart(thisUser);
			model.addAttribute("itemsInCart", itemsInCart);
			return "cartPage.jsp";
		}
	}
	

	@GetMapping("/add/cart/{id}")
	public String addItemToCart(@PathVariable("id") Long itemID, HttpSession session) {
		Long sessionUser = (Long) session.getAttribute("user_id");
		if(sessionUser == null) {
			return "redirect:/user/login";
		} 
		
		User thisUser = userService.findOne(sessionUser);
//		Item thisItem = itemService.findItem(itemID);
//		System.out.println(thisItem);
		System.out.println("made it here");
		
		System.out.println(thisUser.getCart());
//		thisUser.getCart().getItemInCart().add(thisItem);
		return "redirect:/cart";
		}
		
	
}
