package com.example.festlook.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.festlook.models.Item;


@Repository
public interface ItemRepo extends CrudRepository<Item, Long> {
	
	List<Item> findAll();
	
	List<Item> findByUserIdIs(Long id);
	
	List<Item> findByLookIdIs(Long id);
	
	
}
