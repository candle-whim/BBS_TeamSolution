package com.demo.controller;

import com.demo.entity.Admin;
import com.demo.entity.User;
import com.demo.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @ResponseBody
    @RequestMapping("/showAll")
    public List<User> showAll() throws JsonProcessingException {
        List<User> list = userService.showAll();
        return list;
    }

    @RequestMapping("/login")
    public String login(User user1, HttpServletRequest request){
        List<User> list = userService.showAll();
        if(user1.getId()==null)    return "user_login";
        return "admin_login";
    }

    @RequestMapping("/toAdminLogin")
    public String toAdminLogin(){
        return "redirect:/admin/login";
    }

    @RequestMapping("/toUserRegister")
    public String toUserRegister(){
        return "register";
    }

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "redirect:login";
    }
}
