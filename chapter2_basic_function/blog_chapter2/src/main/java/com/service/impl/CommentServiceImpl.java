package com.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.CommentMapper;
import com.pojo.Comment;
import com.service.CommentService;

@Transactional
@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentMapper commentMapper;
	
	public int insert(Comment comment) {
		return commentMapper.insert(comment);
	}
}
