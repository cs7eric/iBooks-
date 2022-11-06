package com.cs7ericibooks.ibooks.dao;

import com.cs7ericibooks.ibooks.pojo.User;

public interface UserDAO {

    /**
     * 根据用户名 查询用户信息
     * @param username 用户名
     * @return 如果 返回 null ,则说明用户名或密码错误
     */
    public User queryUserByUsername(String username);

    /**
     * 根据用户名和密码查询用户信息
     * @param username
     * @param password
     * @return 如果 返回 null ,则说明没有这个用户，反之亦然
     */
    public User queryUserByUsernameAndPassword(String username,String password);


    /**
     * 保存用户信息
     * @param user
     * @return
     */
    public int saveUser(User user);
}

