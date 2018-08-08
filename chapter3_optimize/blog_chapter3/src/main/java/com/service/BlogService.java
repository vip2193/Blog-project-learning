package com.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.pojo.Blog;

public interface BlogService {
	PageInfo pageQuery(Integer pageNum, Integer pageSize, Integer typeId);

	Blog findBlogById(String id);

	int insert(Blog blog);
	
	public int saveOrUpdate(Blog blog);

	int updateBlog(Blog blog);

	PageInfo pageQueryByUser(Integer userId, Integer pageNum, Integer pageSize, Integer blogStatus);
}
