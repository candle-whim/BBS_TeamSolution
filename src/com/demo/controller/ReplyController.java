package com.demo.controller;

import com.demo.entity.Reply;
import com.demo.service.ReplyService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/reply")
public class ReplyController {
    @Autowired
    private ReplyService replyService;

    @ResponseBody
    @RequestMapping("/viewAll")
    public List<Reply> showAllReply() throws JsonProcessingException {
        List<Reply> list = replyService.showAllReply();
        return list;
    }

    @ResponseBody
    @RequestMapping("/viewByReplyUserId")
    public List<Reply> viewReplyByReplyUserId(String replyUserId) throws JsonProcessingException {
        List<Reply> list = replyService.showReplyByReplyUserId(replyUserId);
        return list;
    }

    @ResponseBody
    @RequestMapping("/viewByPostId")
    public List<Reply> viewReplyByPostId(String postId) throws JsonProcessingException {
        List<Reply> list = replyService.showReplyByPostId(postId);
        return list;
    }

    @RequestMapping("/addReply")
    public String addReply(HttpServletRequest request){
        String replyUserId = request.getParameter("replyUserId");
        String postId = request.getParameter("postId");
        String date = request.getParameter("date");
        return "test";
    }

}
