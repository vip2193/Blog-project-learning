package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.Blog;

public interface BlogMapper {
    int deleteByPrimaryKey(Integer blogId);

    int insert(Blog record);

    int insertSelective(Blog record);

    Blog selectByPrimaryKey(Integer blogId);

    int updateByPrimaryKeySelective(Blog record);

    int updateByPrimaryKeyWithBLOBs(Blog record);

    int updateByPrimaryKey(Blog record);

	List<Blog> selectList(@Param("typeId") Integer typeId);

	List<Blog> selectListByUserId(@Param("userId") Integer userId, @Param("blogStatus") Integer blogStatus);
}