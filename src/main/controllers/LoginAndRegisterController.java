package com.example.festlook.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.festlook.models.LoginUser;
import com.example.festlook.models.User;
import com.example.festlook.models.UserInfos;
import com.example.festlook.services.CartService;
import com.example.festlook.services.UserInfosService;
import com.example.festlook.services.UserService;

@Controller
public class LoginAndRegisterController {

	@Autowired
	UserService service;
	@Autowired
	UserInfosService UserInfosService;
	
	@Autowired
	CartService cartService;
	
	
	// ---- CREATE NEW USer ----
	
	@GetMapping ("/user/join")
	public String joinPage(Model model) {
		model.addAttribute("newUser", new User());
	return "joinPage.jsp";
	}
	
	@PostMapping ("/join")
	public String joinUserAction(@Valid @ModelAttribute("newUser") User user, 
										BindingResult result, 
										HttpSession session,
										Model model) {
		service.register(user, result);
		
		if (result.hasErrors()) {
			return "joinPage.jsp";	
		} else {
			session.setAttribute("user_id", user.getId());
			return "redirect:/user/info";
		}
	}
	
	//   ---- LOG IN ----
	
	@GetMapping ("/user/login")
	public String logInPage(Model model) {
		model.addAttribute("loginUser", new LoginUser());
	return "loginUserPage.jsp";
	}
	
	@PostMapping ("/user/login")
	public String loginUserAction(@Valid @ModelAttribute("loginUser") LoginUser loginUser,
									BindingResult result,
									Model model,
									HttpSession session) {
		
		User user = service.login(loginUser, result);
		
		if(result.hasErrors()) {
			return "loginUserPage.jsp";
		} else {
			session.setAttribute("user_id", user.getId());
			return "redirect:/";
		}
	}
	
	
	// ---- ADDITIONAL USERINFOS ----
	
	@GetMapping("/user/info")
	public String userAddInfosPage (@ModelAttribute("userinfos") UserInfos userinfos, HttpSession session) {
		
		Long sessionUser = (Long) session.getAttribute("user_id");
		if (sessionUser == null)
			return "redirect:/user/join";
		else
			return "userAddInfosPage.jsp";
	}
	
	@PostMapping("/user/info")
	public String userAddInfos (@Valid @ModelAttribute("userinfos") UserInfos userinfos,
								BindingResult result, HttpSession session) {
		Long sessionUser = (Long) session.getAttribute("user_id");
		if(result.hasErrors())
			return "userAddInfosPage.jsp";
		else {
			
			userinfos.setUser(service.findOne(sessionUser));
			UserInfosService.saveUserInfos(userinfos);
			return "redirect:/profile/view/" + sessionUser;
		}
	}
	
	
	
	// ---- LOG OUT ----
	
	@GetMapping("/user/logout")
	public String logoutAction(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
