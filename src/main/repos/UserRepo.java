package com.example.festlook.repos;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.festlook.models.Look;
import com.example.festlook.models.User;

@Repository
public interface UserRepo extends CrudRepository<User, Long> {
	
	List<User> findAll();
	
	Optional<User> findByEmail(String email);
	
	Optional<User> findByUsername (String userName);
	
	List<User> findAllByLikes (Look look);
	
	List<User> findByLikesNotContains (Look look);
	
	
	
}
