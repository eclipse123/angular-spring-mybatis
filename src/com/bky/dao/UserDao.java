package com.bky.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bky.model.User;

public interface UserDao {
    int deleteByPrimaryKey(String id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    List<User> getAll();

	int getPageCount();

	List<User> getUserByPage(@Param("start")int start, @Param("pageSize")int pageSize);
}