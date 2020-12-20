package com.demo.service;

import com.demo.entity.Admin;
import com.demo.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {
    @Autowired
    private AdminMapper adminMapper;

    public List<Admin> findAllAdmin(){
        return adminMapper.findAllAdmin();
    }
}
