package com.example.festlook.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.example.festlook.models.LoginUser;
import com.example.festlook.models.Look;
import com.example.festlook.models.User;
import com.example.festlook.repos.UserRepo;

@Service
public class UserService {

	@Autowired
	UserRepo userService;

	// --------------------- REGISTER USER -------------------------

	public User register(User newUser, BindingResult result) {
		// TO-DO: Additional validations!

		// trying to FIND if EMAIL is already IN DB

		Optional<User> maybeUser = userService.findByEmail(newUser.getEmail());
		Optional<User> maybeUserName = userService.findByUsername(newUser.getUsername());
		// if email is taken
		if (maybeUser.isPresent()) {
			result.rejectValue("email", "errorRegister", "This email is taken, please try a different one.");
		}

		// if user entered confirm password DID NOT MATCH with PASSWORD

		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "errorRegister", "Passwords didn't match");
		}

		// trying to FIND if USERNAME is already IN DB

		if (maybeUserName.isPresent()) {
			result.rejectValue("username", "errorRegister", "This username is taken.");
		}

		// check the VALIDATIONS in MODEL

		if (result.hasErrors()) {
			return null;
		}

		// if there is NO ERROR yayyyyyyyyyyy
		else {
			System.out.println("success");
			// HASH password with B-Crypt
			String hashedPW = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
			newUser.setPassword(hashedPW);

			// SAVE new user email and password in the DB
			return userService.save(newUser);
		}
	}

	// --------------------- LOGIN USER -------------------------

	public User login(LoginUser newLoginObject, BindingResult result) {

		// Find the userName or email in the DB
		Optional<User> maybeUser = userService.findByEmail(newLoginObject.getEmail());

		if (!maybeUser.isPresent()) {
			result.rejectValue("email", "loginErrors", "Failed email to login");
//		if(!maybeUser.isPresent()) {
//			result.rejectValue("userName", "loginErrors", "Failed username to login");

		} else {
			User user = maybeUser.get();
			// Reject if b-crypt password match fail;

			if (!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
				result.rejectValue("password", "loginErrors", "Failed password to login");
			}

			if (result.hasErrors()) {
				return null;

			} else {
				// otherwise return user
				return user;
			}

		}
		return null;
	}

	public User findOne(Long id) {
		Optional<User> maybeUser = userService.findById(id);
		if (maybeUser.isPresent())
			return maybeUser.get();
		else {
			return null;
		}
	}
	
	public User saveUser(User user) {
		return userService.save(user);
	}
	
	
	public List<User> findLikedUser (Look look){
		return userService.findAllByLikes(look);
	}
	


}
