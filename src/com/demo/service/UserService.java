package com.demo.service;

import com.demo.entity.User;
import com.demo.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    public List<User> showAll(){
        return userMapper.showAll();
    }

    public int deleteUserById(String id){
        return userMapper.deleteUserById(id);
    }
}
