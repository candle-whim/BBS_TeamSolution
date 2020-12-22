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

    public User findByUserName(String name){
        return userMapper.findByUsername(name);
    }

    public List<User> findAllUser(){return userMapper.findByUsername();}
    public int findIdByUserName(String userName){return userMapper.findByUsername(name);}

    public void addCredit(int id, int score){
         userMapper.addCredit(id,score);
    }

    public void changeUserTypeToMaster(string id){
        userMapper.changeUserTypeToMaster(id);
    }
}
