package com.dao;

import org.apache.ibatis.annotations.Param;
import com.pojo.User;


public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	User selectByUserInfo(@Param("username") String username, @Param("password") String password);

	int checkUsername(String str);

	int checkEmail(String str);

	int checkPhone(String str);
}