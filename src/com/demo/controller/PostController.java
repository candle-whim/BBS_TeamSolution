package com.demo.controller;

import com.demo.entity.Post;
import com.demo.service.PostService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/post")
public class PostController {
    @Autowired
    private PostService postService;

    @ResponseBody
    @RequestMapping(value = "/viewAll")
    public List<Post> showAllPost() throws JsonProcessingException {        //查看所有帖子aaaaa
        List<Post> list = postService.showAllPost();
        return list;
    }

    @RequestMapping(value = "/addPost")
    public String addPost(HttpServletRequest request) {
        String userId = request.getParameter("userId");
        String partId = request.getParameter("partId");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String isLocked = request.getParameter("isLocked");
        return "#";
    }

    @RequestMapping(value = "/deletePost")
    public String deletePost(String id) {
        if (id != null){
            postService.deletePost(id);
        }
        return "post_control";
    }

    @RequestMapping(value = "/editPost")
    public String editPost(HttpServletRequest request) {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Date updateTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        String lastUpdateTime =formatter.format(updateTime);
        return "#";
    }

    @ResponseBody
    @RequestMapping(value = "/selectPostByUserId")
    public List<Post> getPostByUserId(String userId) throws JsonProcessingException{
        List<Post> list = postService.getPostByUserId(userId);
        return list;
    }

    @ResponseBody
    @RequestMapping(value = "/selectPostByKeyword")
    public List<Post> getPostByPostKeyword(String postKeyword) throws JsonProcessingException{
        List<Post> list = postService.getPostByPostKeyword(postKeyword);
        return list;
    }

    @RequestMapping(value = "/highlightPost")
    public String setPostHighlight(String id){
        int highlight = postService.setPostHighlight(id);
        return "post_control";
    }

    @RequestMapping(value = "/unHighlightPost")
    public String setPostUnHighlight(String id) {
        int unHighlight = postService.setPostUnHighlight(id);
        return "#";
    }

    @RequestMapping(value = "/topPost")
    public String setPostTop(String id) {
        int top = postService.setPostTop(id);
        return "#";
    }

    @RequestMapping(value = "/unTopPost")
    public String setPostUnTop(String id) {
        int unTop = postService.setPostUnTop(id);
        return "#";
    }

    /*@RequestMapping(value = "/lockPost")
    public String setPostLocked(String id) {
        int locked = postService.setPostLocked(id);
        return "#";
    }

    @RequestMapping(value = "/unLockPost")
    public String setPostUnLocked(String id) {
        int unLocked = postService.setPostUnLocked(id);
        return "#";
    }*/

    @ResponseBody
    @RequestMapping(value = "/showHighlightPost")
    public List<Post> showHighlightPost() throws JsonProcessingException{
        List<Post> list = postService.showHighlightPost();
        return list;
    }

    @ResponseBody
    @RequestMapping(value = "/showTopPost")
    public List<Post> showTopPost() throws JsonProcessingException{
        List<Post> list = postService.showTopPost();
        return list;
    }

    @RequestMapping(value = "/setPostReward")
    public String setReward(String id,int reward) {
        int setReward = postService.setReward(id,reward);
        return "#";
    }
}
