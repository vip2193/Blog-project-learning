package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Comment;
import com.service.CommentService;

//博客评论
@Controller
@RequestMapping("comment")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	
	//添加评论
	@RequestMapping("add.do")
	@ResponseBody
	public void addComment(Comment comment){
		int result = commentService.insert(comment);
		if(result > 0 ){
			//添加成功
		}
	}
	
	//通过博客ID获取评论
	public void getComments(Integer blogId){
		
		
	}
	
	

}
