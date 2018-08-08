package com.service;

import com.common.ServerResponse;
import com.pojo.User;

public interface UserService {

	ServerResponse loginByUserNameAndPwd(String username, String password);

	ServerResponse register(User user);

	boolean checkUserByName(String username);

	boolean checkUserByPhone(String phone);

	User findUserById(Integer userid);

	
	
	
}
