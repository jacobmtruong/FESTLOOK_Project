package com.example.festlook.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.festlook.models.UserInfos;
import com.example.festlook.repos.User_InfosRepos;

@Service
public class UserInfosService {
	@Autowired
	User_InfosRepos userinfosRepo;
	
	
	public UserInfos saveUserInfos(UserInfos userinfos) {
		return userinfosRepo.save(userinfos);
	}
	
	public UserInfos updateUserInfos(UserInfos userinfos) {
		return userinfosRepo.save(userinfos);
	}
	
	public UserInfos findOneUserInfos(Long userInfosID) {
		Optional<UserInfos> maybeUserInfos = userinfosRepo.findById(userInfosID);
		if (maybeUserInfos.isPresent())
			return maybeUserInfos.get();
		else
			return null;
	}
}
