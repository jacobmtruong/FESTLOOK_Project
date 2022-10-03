package com.example.festlook.controllers;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.example.festlook.models.Item;
import com.example.festlook.models.Look;
import com.example.festlook.models.User;
import com.example.festlook.models.UserInfos;
import com.example.festlook.services.ItemService;
import com.example.festlook.services.LookService;
import com.example.festlook.services.UserInfosService;
import com.example.festlook.services.UserService;

@Controller
public class DashboardController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	LookService lookService;
	
	@Autowired
	ItemService itemService;
	
	@Autowired
	UserInfosService userInfoService;

	@GetMapping ("/")
	public String dashboard(Model model, HttpSession session) {
		
		Long userID = (Long) session.getAttribute("user_id");
		if (userID == null) {
			List<Look> allLooks = lookService.allLooks();
			Collections.reverse(allLooks);
			model.addAttribute("allLooks", allLooks);
			
			List<Item> allItems = itemService.allItems();
			model.addAttribute("allItems", allItems);
			return "dashboard.jsp";
		} else {
			List<Item> allItems = itemService.allItems();
			User sessionUser = userService.findOne(userID);
			List<Look> allLooks = lookService.allLooks();
			Collections.reverse(allLooks);
			model.addAttribute("allItems", allItems);
			model.addAttribute("allLooks", allLooks);
			model.addAttribute("sessionUser", sessionUser);
			return "dashboard.jsp";
		}
	}
	
	// ---- LIKE ----
	
	@PostMapping ("/look/like/{id}")
	public String likeLookAction(@PathVariable("id") Long lookID,
									HttpSession session) {
		Long sessionUser = (Long) session.getAttribute("user_id");
		if (sessionUser == null)
			return "redirect:/user/login";
		else {
			Look lookslike = lookService.findOneLook(lookID);
			User userslike = userService.findOne(sessionUser);
			lookslike.getUserLiked().add(userslike);
			lookService.updateLook(lookslike);
			return "redirect:/#liked1";
		}
	}
	
	@PostMapping ("/look/unlike/{id}")
	public String unlikeLookAction(@PathVariable("id") Long lookID,
			HttpSession session) {
		
		Long sessionUser = (Long) session.getAttribute("user_id");
		if (sessionUser == null)
			return "redirect:/user/login";
		else {
			Look lookslike = lookService.findOneLook(lookID);
			User userslike = userService.findOne(sessionUser);
			lookslike.getUserLiked().remove(userslike);
			lookService.updateLook(lookslike);
			return "redirect:/#liked1";
		}
	}
	
	// ----- USER PROFILE ----
	
	@GetMapping ("/profile/view/{id}")
	public String userProfile (@PathVariable ("id") Long userID, Model model) {
		
		User thisUser = userService.findOne(userID);
		List<Look> looksByUser = lookService.allLookByPoster(userID);
		List<Look> looksLikedByUser = lookService.looksLikedByUser(thisUser);
		List<Item> itemsByUser = itemService.allItemsFromThisUser(userID);
		
		model.addAttribute("itemsByUser", itemsByUser);
		model.addAttribute("thisUser", thisUser);
		model.addAttribute("looksByUser", looksByUser);
		model.addAttribute("looksLikedByUser", looksLikedByUser);
		
		return "userProfile.jsp";
		
	}
	
	// ----- EDIT USER PROFILE -----
	
	@GetMapping("/edit/profile/{id}")
	public String editProfilePage (Model model,
									@PathVariable("id") Long userinfosID, HttpSession session) {
		Long sessionUser = (Long) session.getAttribute("user_id");
		if(sessionUser == null)
			return "redirect:/";
		else {
			UserInfos thisUserInfos = userInfoService.findOneUserInfos(userinfosID);
			model.addAttribute("thisUser", thisUserInfos);
			return "editProfile.jsp";
		}
	}
	
	@PutMapping("/edit/profile/{id}")
	public String editProfile(@Valid @ModelAttribute("userinfos") UserInfos editUserInfos, 
								BindingResult result,Model model,
								@PathVariable("id") Long userInfosID,
								HttpSession session) {
		Long sessionUser = (Long) session.getAttribute("user_id");
		if(sessionUser == null)
			return "redirect:/";
		else {
			if (result.hasErrors()) {
				UserInfos thisUserInfos = userInfoService.findOneUserInfos(userInfosID);
				model.addAttribute("thisUser", thisUserInfos);
				return "editProfile.jsp";
			} else {
				User thisUser = userService.findOne(sessionUser);
				editUserInfos.setUser(thisUser);
				userInfoService.updateUserInfos(editUserInfos);
				return "redirect:/profile/view/" + sessionUser;
			}
		}
	}
	
}
