package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.ServerResponse;
import com.github.pagehelper.PageInfo;
import com.pojo.Blog;
import com.pojo.User;
import com.service.BlogService;
import com.service.UserService;

@Controller
@RequestMapping("blog")
public class BlogController {
	
	@Autowired
	private BlogService blogService;
	
	@Autowired
	private UserService userService;
	
	//已发布状态  1为发布 0为草稿
	public final static  int PUBLISHED_STATUS = 1;
	//草稿状态
	public final static  int DRAFT_STATUS = 0;
	
	
	@RequestMapping("list.do")
	public String blogList(){
		return "list";
	}
	
	
	/**
	 * 分页查询博客信息
	 * @param pageNum 	页码
	 * @param pageSize	每页数据量
	 * @param typeId	分类ID
	 * @return
	 */
	@RequestMapping("pageQuery.do")
	@ResponseBody
	public PageInfo pageQuery(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,Integer typeId){
		PageInfo pageInfo = blogService.pageQuery(pageNum,pageSize,typeId);
		return pageInfo;
	}
	
	
	//通过ID查询博客
	@RequestMapping("findBlogById.do")
	public String findBlogById(String id,HttpServletRequest request){
		Blog blog = blogService.findBlogById(id);
		request.setAttribute("blog", blog);
		//通过博客userId查询用户
		User user = userService.findUserById(blog.getUserid());
		request.setAttribute("userOfBlog", user);
		return "blogDetail";
	}
	

	
	/**
	 * 通过userId查询博客数据
	 * @return
	 */
	@RequestMapping("pageQueryByUser.do")
	@ResponseBody
	public PageInfo pageQueryByUserId(Integer userId,@RequestParam(value = "pageNum", defaultValue = "1")Integer pageNum
			,@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,@RequestParam(value = "blogStatus", defaultValue = "1") Integer blogStatus){
		PageInfo pageInfo = blogService.pageQueryByUser(userId,pageNum,pageSize,blogStatus);
		return pageInfo;
	}
	
	//发布博客
	@RequestMapping("addBlog.do")
	public String addBlog(Blog blog,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("userInfo");
		//校验博客数据是否为空
		if(checkBlog(blog)){
			request.setAttribute("error","博客内容或标题不能为空!");
			return "writeBlog";
		};
		if(user != null){
			//设置用户ID
			blog.setUserid(user.getUserid());
		}else{
			request.setAttribute("error","用户丢失请重新登录");
			return "writeBlog";
		}
		blog.setBlogStatus(PUBLISHED_STATUS);	//设置博客状态为发布
		int result = blogService.saveOrUpdate(blog);
		if(result == 0){
			request.setAttribute("error","创建失败");
			return "writeBlog";
		}
		return "redirect:/index.do";
	
	
	}
	
	//存为草稿
	@RequestMapping("saveDraft.do")
	@ResponseBody
	public ServerResponse saveDraft(Blog blog,HttpSession session){
		Map<String, String> map = new HashMap<>();
		User user = (User) session.getAttribute("userInfo");
		
		//校验博客数据
		if(checkBlog(blog)){
			return new ServerResponse<>("标题或内容不能为空",ServerResponse.ERROR);
		};
		if(user != null){
			//设置用户ID
			blog.setUserid(user.getUserid());
		}else{
			return new ServerResponse<>("用户不存在",ServerResponse.ERROR);
		}
		blog.setBlogStatus(DRAFT_STATUS);					//设置博客状态为草稿
		
		int result = blogService.insert(blog);	//保存
		
		if(result > 0){
			return new ServerResponse<>("保存成功",ServerResponse.SUCCESS);
		}
		return new ServerResponse<>("保存失败",ServerResponse.ERROR);
	}
	
	
	//空校验  true 即为空  false 即不为空
	private boolean checkBlog(Blog blog) {
		if(!StringUtils.isNotBlank(blog.getBlogTitle())){
			return true;
		}
		if(!StringUtils.isNotBlank(blog.getBlogContent())){
			return true;
		}
		return false;
	}


	//跳转至写博客页面
	@RequestMapping("writeBlogPage.do")
	public String createBlogPage(Blog blog,HttpServletRequest request){
		return "writeBlog";
	}
	
	@RequestMapping("editBlog.do")
	public String editBlog(Integer blogId,HttpServletRequest request){
		Blog blog = blogService.findBlogById(blogId.toString());
		request.setAttribute("blog",blog);
		return "writeBlog";
	}
	
}
