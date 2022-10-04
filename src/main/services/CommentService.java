package com.example.festlook.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.festlook.models.Comment;
import com.example.festlook.repos.CommentRepo;

@Service
public class CommentService {

	@Autowired
	CommentRepo commentRepo;
	
	public List<Comment> allComment (){
		return commentRepo.findAll();
	}
	
	public List<Comment> commentsOfLook (Long lookID){
		return commentRepo.findByLookIdIs(lookID);
	}
	
	public Comment addComment (Comment comment) {
		return commentRepo.save(comment);
	}
	
	public void deleteComment (Long id) {
		commentRepo.deleteById(id);;
	}
}
