package com.demo.service;

import com.demo.entity.Post;
import com.demo.mapper.PostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.SplittableRandom;

@Service
public class PostService {
    @Autowired
    private PostMapper postMapper;      //将PostMapper接口注入到由spring管理的bean对象中

    public List<Post> showAllPost() {
        return postMapper.showAllPost();
    }
    public int addPost(Post post) {
        return postMapper.addPost(post);
    }
    public void deletePost(String id) {
        postMapper.deletePost(id);
    }
    public int editPost(Post post) {
        return postMapper.editPost(post);
    }
    public List<Post> getPostByUserId(String userId) {
        return postMapper.getPostByUserId(userId);
    }
    public List<Post> getPostByPostKeyword(String postKeyword) {
        return postMapper.getPostByPostKeyword(postKeyword);
    }
    public int setPostHighlight(String id) {
        return postMapper.setPostHighlight(id);
    }
    public int setPostUnHighlight(String id) {
        return postMapper.setPostUnHighlight(id);
    }
    public int setPostTop(String id) {
        return postMapper.setPostTop(id);
    }
    public int setPostUnTop(String id) {
        return postMapper.setPostUnTop(id);
    }
    public int setPostLocked(String id) {
        return postMapper.setPostLocked(id);
    }
    public int setPostUnLocked(String id) {
        return postMapper.setPostUnLocked(id);
    }
    public List<Post> showHighlightPost() {
        return postMapper.showHighlightPost();
    }
    public List<Post> showTopPost() {
        return postMapper.showTopPost();
    }
    public int setReward(String id,int reward){
        return postMapper.setReward(id,reward);
    }
}
