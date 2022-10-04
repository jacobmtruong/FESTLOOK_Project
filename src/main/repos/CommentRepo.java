package com.example.festlook.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.festlook.models.Comment;

@Repository
public interface CommentRepo extends CrudRepository<Comment, Long> {
	List<Comment> findAll();
	List<Comment> findByLookIdIs(Long id);
}
