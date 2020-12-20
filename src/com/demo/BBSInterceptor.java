package com.demo;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BBSInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
        HttpSession session = request.getSession();
        if(session.getAttribute("admin")!=null || session.getAttribute("user")!=null){
            return true;
        }
        if(request.getRequestURI().contains("images")){
            return true;
        }
        if(request.getRequestURI().contains("js")){
            return true;
        }
        if(request.getRequestURI().contains("css")){
            return true;
        }

        if(request.getRequestURI().contains("login")){
            return true;
        }
        if(request.getRequestURI().contains("register")){
            return true;
        }
        //request.getRequestDispatcher("admin_login");
        return false;
    }
}
