package com.demo.controller;

import com.demo.entity.Admin;
import com.demo.entity.Post;
import com.demo.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")
    public String login(Admin admin, HttpServletRequest request){
        List<Admin> list = adminService.findAllAdmin();
        if(admin.getId()==null)    return "admin_login";
        for(Admin admin1 : list){
            if(admin1.getId().equals(admin.getId())){
                if(admin1.getPassword().equals(admin.getPassword())) {
                    HttpSession session = request.getSession();
                    session.setAttribute("admin",admin1.getId());
                    return "admin_control";
                }
                else  return "login_error";
            }
        }
        return "notAdmin";
    }

    @RequestMapping("/exit")
    public String exit(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("admin");
        return "redirect:login";
    }

    @RequestMapping("/showAllUser")
    public String showAllUser(){
        return "forward:/user/showAll";
    }


    @RequestMapping("/toUserLogin")
    public String toUserLogin(){
        return "redirect:/user/login";
    }

    @RequestMapping("/toUserControl")
    public String toUserControl(){
        return "user_control";
    }

    @RequestMapping("/toPostControl")
    public String toPostControl(){
        return "post_control";
    }

    @RequestMapping("/toModuleControl")
    public String toModuleControl(){
        return "module_control";
    }

    @RequestMapping("/viewReplyByPostId")
    public String viewReplyByPosyId(String postId,HttpServletRequest request){
        request.setAttribute("postId",postId);
         return "forward:/reply/viewByPostId";
    }

    @RequestMapping("/showAllPost")
    public String showAllPost(){
        return "forward:/post/viewAll";
    }

    @RequestMapping("/showAllModule")
    public String showAllModule(){
        return "forward:/module/view";
    }

    @RequestMapping("/addModule")
    public String addModule(Module module,HttpServletRequest request){
        request.setAttribute("module",module);
        return "forward:/module/add";
    }

    @RequestMapping("/deleteModuleById")
    public String deleteModuleById(String id,HttpServletRequest request){
        request.setAttribute("id",id);
        return "forward:/module/deleteById";
    }

    @RequestMapping("/deletePostById")
    public String deletePost(String id,HttpServletRequest request) {
        request.setAttribute("id",id);
        return "forward:/post/deletePost";
    }
}
