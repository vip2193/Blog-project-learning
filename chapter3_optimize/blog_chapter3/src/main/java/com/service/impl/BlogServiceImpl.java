package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.BlogMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pojo.Blog;
import com.service.BlogService;

@Transactional
@Service
public class BlogServiceImpl implements BlogService {

	@Autowired
	private BlogMapper blogMapper;
	
	//分页查询
	public PageInfo pageQuery(Integer pageNum, Integer pageSize, Integer typeId) {
		PageHelper.startPage(pageNum,pageSize);
		List<Blog> blogList = blogMapper.selectList(typeId);
		PageInfo pageInfo = new PageInfo(blogList);
		return pageInfo;
	}

	public Blog findBlogById(String id) {
		Blog blog = blogMapper.selectByPrimaryKey(Integer.valueOf(id));
		return blog;
	}

	public int insert(Blog blog) {
		int result = blogMapper.insert(blog);
		return result;
	}
	
	//如果数据库存在即更新否则保存
	public int saveOrUpdate(Blog blog){
		Integer blogId = blog.getBlogId();
		if(blogId == null || blogId == 0){
			//保存
			return insert(blog);
		}
		return updateBlog(blog);
	}

	//更新数据
	public int updateBlog(Blog blog) {
		return blogMapper.updateByPrimaryKeyWithBLOBs(blog);
	}
	
	@Override
	public PageInfo pageQueryByUser(Integer userId, Integer pageNum, Integer pageSize,Integer blogStatus) {
		PageHelper.startPage(pageNum,pageSize);
		List<Blog> blogList = blogMapper.selectListByUserId(userId,blogStatus);
		PageInfo pageInfo = new PageInfo(blogList);
		return pageInfo;
	}
}