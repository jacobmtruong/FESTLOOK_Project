package com.example.festlook.controllers;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.festlook.models.Item;
import com.example.festlook.services.ItemService;

@Controller
public class MarketPlaceController {
	@Autowired
	ItemService itemService;
	
	@GetMapping("/marketplace")
	public String marketplacePage(Model model) {
		List<Item> allItems = itemService.allItems();
		Collections.reverse(allItems);
		model.addAttribute("allItems", allItems);
		return "marketplacePage.jsp";
	}
	
}
