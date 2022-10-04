package com.example.festlook.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.festlook.models.Look;
import com.example.festlook.models.User;
import com.example.festlook.repos.LookRepo;

@Service
public class LookService {
	
	@Autowired
	LookRepo lookRepo;
	
	public List<Look> allLooks (){
		return lookRepo.findAll();
	}
	
	public Look createLook (Look look) {
		return lookRepo.save(look);
	}
	
	public Look updateLook (Look look) {
		return lookRepo.save(look);
	}
	
	public Look findOneLook(Long lookID) {
		Optional<Look> maybeLook = lookRepo.findById(lookID);
		if (maybeLook.isPresent())
			return maybeLook.get();
		else
			return null;
	}
	
	public void deteleLook(Long id) {
		lookRepo.deleteById(id);
	}
	
	public List<Look> allLookByPoster (Long id){
		return lookRepo.findByPosterIdIs(id);
	}
	
	
	public List<Look> looksLikedByUser (User user){
		return lookRepo.findByUserLikedContains(user);
	}
}


