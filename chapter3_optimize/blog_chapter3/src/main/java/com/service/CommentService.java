package com.service;

import com.common.ServerResponse;
import com.github.pagehelper.PageInfo;
import com.pojo.Comment;

public interface CommentService {
	ServerResponse insert(Comment comment);
	
	ServerResponse delete(Integer commentId);

	PageInfo pageQuery(Integer pageNum, Integer pageSize, Integer blogId);

}
