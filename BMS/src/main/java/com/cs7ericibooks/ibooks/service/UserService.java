package com.cs7ericibooks.ibooks.service;

import com.cs7ericibooks.ibooks.pojo.User;

public interface UserService {

    /**
     * 注册用户
     * @param user
     */
    public void register(User user);

    /**
     * 登录
     * @param user
     * @return 如果返回 null,则说明登录失败 ，返回有值说明返回成功
     */
    public User login(User user);

    /**
     * 检查用户名是否可用
     * @param username
     * @return 返回 true 代表用户名已经存在，返回 false 表示用户名可用
     */
    public boolean existsUsername(String username);
}
