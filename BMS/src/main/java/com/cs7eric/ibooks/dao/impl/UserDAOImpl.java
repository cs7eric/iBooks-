package com.cs7eric.ibooks.dao.impl;

import com.cs7eric.ibooks.dao.BaseDAO;
import com.cs7eric.ibooks.dao.UserDAO;
import com.cs7eric.ibooks.pojo.User;

public class UserDAOImpl extends BaseDAO implements UserDAO {

    @Override
    public User queryUserByUsername(String username) {
        String sql = "SELECT `id`,`username`,`password`,`email` FROM t_user WHERE username = ?";
        return queryForOne(User.class,sql,username);
    }

    @Override
    public User queryUserByUsernameAndPassword(String username, String password) {
        String sql = "SELECT `id`,`username`,`password`,`email` FROM t_user WHERE username = ? and password = ?";
        return queryForOne(User.class,sql,username,password);
    }

    @Override
    public int saveUser(User user) {
        String sql = "INSERT INTO t_user(`username`,`password`,`email`)values(?,?,?)";
        return update(sql,user.getUsername(),user.getPassword(),user.getEmail());
    }
}
