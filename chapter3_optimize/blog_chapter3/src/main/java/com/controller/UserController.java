package com.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.ServerResponse;
import com.pojo.User;
import com.service.UserService;

import net.sf.jsqlparser.schema.Server;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("login.do")
	@ResponseBody
	public ServerResponse login(String username, String password, HttpSession session, HttpServletRequest request) {
		ServerResponse response = userService.loginByUserNameAndPwd(username, password);
		if (response.getStatus() == ServerResponse.SUCCESS) {
			session.setAttribute("userInfo", response.getData());
		}
		return response;
	}

	@RequestMapping("register.do")
	@ResponseBody
	public ServerResponse register(User user) {
		ServerResponse response = userService.register(user);
		return response;
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("userInfo");
		return "redirect:/index.do";
	}

	// 异步校验用户名是否存在
	@RequestMapping("checkUserName.do")
	@ResponseBody
	public Map checkUserName(String username) {
		boolean hasUser = userService.checkUserByName(username);
		Map<String, Boolean> map = new HashMap<>();
		map.put("valid", hasUser);
		return map;
	}

	// 异步校验手机号是否存在
	@RequestMapping("checkUserByPhone.do")
	@ResponseBody
	public Map checkPhone(String phone) {
		boolean hasPhone = userService.checkUserByPhone(phone);
		Map<String, Boolean> map = new HashMap<>();
		map.put("valid", hasPhone);
		return map;
	}
	
	//账户管理
	@RequestMapping("management.do")
	public String manageMentPage(HttpSession session){
		Object user = session.getAttribute("userInfo");
		if(user != null){
			return "userManagement";
		}
		return "redirect:/index.do";
	}
	
	//我的博客
	@RequestMapping("myBlog.do")
	public String getMyBlogs(HttpSession session){
		return "myBlog";
	} 
}
