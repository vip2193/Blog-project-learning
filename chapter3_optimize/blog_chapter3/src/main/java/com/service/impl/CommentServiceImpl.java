package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.common.ServerResponse;
import com.dao.CommentMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pojo.Comment;
import com.service.CommentService;

@Transactional
@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentMapper commentMapper;
	
	public ServerResponse insert(Comment comment) {
		int affectLine = commentMapper.insert(comment);
		if(affectLine > 0){
			return new ServerResponse<>("添加评论成功", ServerResponse.SUCCESS);
		}
		//添加和博客关联
		return new ServerResponse<>("添加失败", ServerResponse.ERROR);
	}

	public ServerResponse delete(Integer commentId) {
		int affectLine = commentMapper.deleteByPrimaryKey(commentId);
		if(affectLine > 0){
			return new ServerResponse<>("删除成功", ServerResponse.SUCCESS);
		}
		return new ServerResponse<>("删除失败", ServerResponse.ERROR);
	}

	public PageInfo pageQuery(Integer pageNum, Integer pageSize, Integer blogId) {
		PageHelper.startPage(pageNum,pageSize);
		List<Comment> commentList = commentMapper.selectList(blogId);
		PageInfo info = new PageInfo<>(commentList);
		return info;
	}
}
