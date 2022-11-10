package com.cs7eric.ibooks.service.impl;

import com.cs7eric.ibooks.dao.UserDAO;
import com.cs7eric.ibooks.dao.impl.UserDAOImpl;
import com.cs7eric.ibooks.pojo.User;
import com.cs7eric.ibooks.service.UserService;

public class UserServiceImpl implements UserService {

    private UserDAO userDAO = new UserDAOImpl();
    @Override
    public void register(User user) {
        userDAO.saveUser(user);
    }

    @Override
    public User login(User user) {
        return userDAO.queryUserByUsernameAndPassword(user.getUsername(), user.getPassword());
    }

    @Override
    public boolean existsUsername(String username) {
        if(userDAO.queryUserByUsername(username) == null){
            return false;
        }
        return true;
    }
}
