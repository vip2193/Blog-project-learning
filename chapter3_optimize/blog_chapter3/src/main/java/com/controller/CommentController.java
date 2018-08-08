package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.ServerResponse;
import com.github.pagehelper.PageInfo;
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
	public ServerResponse addComment(Comment comment){
		return commentService.insert(comment);
	}
	
	//通过博客ID获取评论
	@RequestMapping("pageQuery.do")
	@ResponseBody
	public PageInfo getComments(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,Integer blogId){
		return commentService.pageQuery(pageNum,pageSize,blogId);
	}
}
