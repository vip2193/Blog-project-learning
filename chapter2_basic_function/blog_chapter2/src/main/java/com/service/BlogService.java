package com.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.pojo.Blog;

public interface BlogService {
	PageInfo pageQuery(Integer pageNum, Integer pageSize, String typeId);

	Blog findBlogById(String id);

	int insert(Blog blog);

}
