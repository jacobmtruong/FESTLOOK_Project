package com.example.festlook.controllers;

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

import com.example.festlook.models.Comment;
import com.example.festlook.models.Item;
import com.example.festlook.models.Look;
import com.example.festlook.models.User;
import com.example.festlook.services.CommentService;
import com.example.festlook.services.ItemService;
import com.example.festlook.services.LookService;
import com.example.festlook.services.UserService;

@Controller
public class LookController {

	@Autowired
	LookService lookService;

	@Autowired
	UserService userService;

	@Autowired
	CommentService commentService;

	@Autowired
	ItemService itemService;

	// ----- CREATE -----

	@GetMapping("/look/new")
	public String newLookPage(@ModelAttribute("look") Look look, HttpSession session) {

		// Route guard
		Long sessionUser = (Long) session.getAttribute("user_id");
		if (sessionUser == null)
			return "redirect:/user/join";
		else
			// render on JSP
			return "newLook.jsp";
	}

	@PostMapping("/look/new")
	public String createBabyName(@Valid @ModelAttribute("look") Look look, BindingResult result, HttpSession session) {

		Long sessionUser = (Long) session.getAttribute("user_id");
		if (result.hasErrors())
			return "newLook.jsp";
		else {
			look.setPoster(userService.findOne(sessionUser));
			lookService.createLook(look);
			return "redirect:/";
		}
	}

	// ------ DELETE A LOOK -----

//	@GetMapping("/look/delete/{id}")
//	public String deleteLookPost(@PathVariable("id") Long lookID, HttpSession session) {
//		
//		Long sessionUser = (Long) session.getAttribute("user_id");
//
//		if (sessionUser == null)
//			return "redirect:/user/login";
//		else {
//			Look thisLook = lookService.findOneLook(lookID);
//			List<Comment> commentsFromLook = commentService.commentsOfLook(lookID);
//			lookService.deteleLook(lookID);
//			return "redirect:/";
//		}
//	}

	// ---- VIEW AND COMMENT ----

	@GetMapping("/look/view/{id}")
	public String viewLookPage(@ModelAttribute("comment") Comment comment, @PathVariable("id") Long lookID,
			Model model) {

		List<Comment> thisLookComments = commentService.commentsOfLook(lookID);
		model.addAttribute("thisLookComments", thisLookComments);

		Look thisLook = lookService.findOneLook(lookID);
		model.addAttribute("look", thisLook);

		User thisPoster = thisLook.getPoster();
		Long thisPosterID = (Long) thisPoster.getId();

		List<Look> looksByPoster = lookService.allLookByPoster(thisPosterID);
		looksByPoster.remove(thisLook);
		model.addAttribute("looksByPoster", looksByPoster);

		List<Item> itemsByLook = itemService.allItemsFromThisLook(lookID);

		model.addAttribute("itemsByLook", itemsByLook);

		return "viewLookPage.jsp";
	}

	@PostMapping("/comment/post/{id}")
	public String postComment(@Valid @ModelAttribute("comemnt") Comment comment, BindingResult result,
			@PathVariable("id") Long lookID, HttpSession session, Model model) {

		Long sessionUser = (Long) session.getAttribute("user_id");

		if (sessionUser == null) {
			return "redirect:/user/login";
		} else {
			Look thisLook = lookService.findOneLook(lookID);
			List<Comment> thisLookComments = commentService.commentsOfLook(lookID);
			if (result.hasErrors()) {
				model.addAttribute("look", thisLook);
				model.addAttribute("thisLookComments", thisLookComments);
				return "viewLookPage.jsp";
			} else {
				Comment newComment = new Comment(comment.getComment());
				newComment.setLook(thisLook);
				newComment.setCommentUser(userService.findOne(sessionUser));
				System.out.println(sessionUser);
				commentService.addComment(newComment);
				return "redirect:/look/view/" + lookID;
			}
		}
	}

	@GetMapping("/comment/delete/{id}")
	public String deleteComment(@PathVariable("id") Long commentID, HttpSession session) {

		Long sessionUser = (Long) session.getAttribute("user_id");

		if (sessionUser == null)
			return "redirect:/user/login";
		else {

			commentService.deleteComment(commentID);
			return "redirect:/";
		}

	}
	
	

}
