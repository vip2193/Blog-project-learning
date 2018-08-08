package com.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.common.ServerResponse;
import com.dao.UserMapper;
import com.pojo.User;
import com.service.UserService;
import com.util.MD5Util;

@Transactional
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	private static final String EMAIL_TYPE = "email";
	private static final String PHONE_TYPE = "phone";
	private static final String USER_TYPE = "user";

	// 通过用户名查询
	public ServerResponse loginByUserNameAndPwd(String username, String password) {
		if(!StringUtils.isNotBlank(username) && !StringUtils.isNotBlank(password)){
			return new ServerResponse("登录失败，用户名密码不能为空！", ServerResponse.ERROR);
		}
		password = MD5Util.getMD5(password);
		User user = userMapper.selectByUserInfo(username, password);
		if (user != null) {
			// 登录成功
			return new ServerResponse("登录成功", ServerResponse.SUCCESS, user);
		}
		return new ServerResponse("登录失败，用户名或密码错误！", ServerResponse.ERROR);
	}
	
	public ServerResponse register(User user) {
		//判断是否为空
		if(!StringUtils.isNotBlank(user.getUsername()) && !StringUtils.isNotBlank(user.getPassword())){
			return new ServerResponse("注册失败，用户名和密码不能为空！", ServerResponse.ERROR);
		}
		if(!StringUtils.isNotBlank(user.getPhone())){
			return new ServerResponse("注册失败，手机号不能为空！", ServerResponse.ERROR);
		}
		//校验用户名是否存在
		ServerResponse response = checkValid(user.getUsername(),USER_TYPE);
		if (response.getStatus() == ServerResponse.ERROR) {
			return response;
		}
		//校验手机号是否存在
		response = checkValid(user.getPhone(), PHONE_TYPE);
		
		if (response.getStatus() == ServerResponse.ERROR) {
			return response;
		}
		//MD5加密
		user.setPassword(MD5Util.getMD5(user.getPassword()));
		//设置默认头像
		user.setAvatar("/img/user_icon.jpg");
		//注册
		int result = userMapper.insert(user);
		if (result == 0) {
			return new ServerResponse("注册失败", ServerResponse.ERROR);
		}
		return new ServerResponse("注册成功", ServerResponse.SUCCESS);
	}

	// 校验
	private ServerResponse checkValid(String str, String type) {
		if (StringUtils.isNotBlank(type)) {
			// 开始校验
			if (USER_TYPE.equals(type)) {
				int resultCount = userMapper.checkUsername(str);
				if (resultCount > 0) {
					return new ServerResponse("用户名已存在", ServerResponse.ERROR);
				}
			}
			if (EMAIL_TYPE.equals(type)) {
				int resultCount = userMapper.checkEmail(str);
				if (resultCount > 0) {
					return new ServerResponse("email已存在", ServerResponse.ERROR);
				}
			}
			if (PHONE_TYPE.equals(type)) {
				int resultCount = userMapper.checkPhone(str);
				if (resultCount > 0) {
					return new ServerResponse("手机号已存在", ServerResponse.ERROR);
				}
			}

		} else {
			return new ServerResponse("参数错误", ServerResponse.ERROR);
		}
		return new ServerResponse("校验成功", ServerResponse.SUCCESS);

	}

	public boolean checkUserByName(String username) {
		ServerResponse checkValid = checkValid(username,USER_TYPE);
		
		if(checkValid.getStatus() == ServerResponse.ERROR){
			return false;
		}
		return true;
	}

	public boolean checkUserByPhone(String phone) {
		ServerResponse checkValid = checkValid(phone,PHONE_TYPE);
		if(checkValid.getStatus() == ServerResponse.ERROR){
			return false;
		}
		return true;
	}

	@Override
	public User findUserById(Integer userid) {
		return userMapper.selectByPrimaryKey(userid);
	}

}
