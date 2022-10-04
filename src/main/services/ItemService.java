package com.example.festlook.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.festlook.models.Item;
import com.example.festlook.repos.ItemRepo;

@Service
public class ItemService {
	
	@Autowired
	ItemRepo itemRepo;
	
	public List<Item> allItems (){
		return itemRepo.findAll();
	}
	
	public Item saveItem (Item item) {
		return itemRepo.save(item);
	}
	
	public Item updateItem (Item item) {
		return itemRepo.save(item);
	}
	
	public List<Item> allItemsFromThisLook (Long id) {
		return itemRepo.findByLookIdIs(id);
	}
	
	public List<Item> allItemsFromThisUser (Long id) {
		return itemRepo.findByUserIdIs(id);
	}
	
	public Item findItem(Long itemID) {
		Optional<Item> maybeItem = itemRepo.findById(itemID);
		if (maybeItem.isPresent())
			return maybeItem.get();
		else
			return null;
	}
	
}
