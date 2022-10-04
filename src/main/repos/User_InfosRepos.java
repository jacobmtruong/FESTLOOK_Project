package com.example.festlook.repos;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.festlook.models.UserInfos;



@Repository
public interface User_InfosRepos extends CrudRepository<UserInfos, Long> {
	
	List<UserInfos> findAll();
	
	Optional<UserInfos> findByUserIdIs(Long id);
}
