package com.demo.service;

import com.demo.entity.Reply;
import com.demo.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ReplyService {
    @Autowired
    private ReplyMapper replyMapper;

    public List<Reply> showAllReply(){
        return replyMapper.showAllReply();
    }

    public List<Reply> showReplyByReplyUserId(String id){
        return replyMapper.showReplyByReplyUserId(id);
    }

    public List<Reply> showReplyByPostId(String postId){
        return replyMapper.showReplyByPostId(postId);
    }

    public int addReply(Reply reply){
        return replyMapper.addReply(reply);
    }

    public int deleteReply(String id){
        return replyMapper.deleteReply(id);
    }
}
