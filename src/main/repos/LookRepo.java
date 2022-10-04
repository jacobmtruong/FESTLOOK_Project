package com.example.festlook.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.festlook.models.Look;
import com.example.festlook.models.User;

@Repository
public interface LookRepo extends CrudRepository<Look, Long> {

	
	List<Look> findAll();
	List<Look> findByPosterIdIs(Long id);
	
	List<Look> findByUserLikedContains (User user);
}
