package com.demo.mapper;

import com.demo.entity.Post;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostMapper {
    @Select("select * from post")
    List<Post> showAllPost();                           //查看所有帖子

    @Insert("insert into post(id,userId,partId,title,content,time,lastUpdateTime,lastReplyTime,clickCount,replyCount,isTop,isHighlighted,isLocked) " +
            "values(#{id},#{userId},#{partId},#{title},#{content},#{time},#{lastUpdateTime},#{lastReplyTime},#{clickCount},#{replyCount},#{isTop},#{isHighlighted},#{isLocked})")
    int addPost(Post post);                   //发帖

    @Delete("delete from post where id=#{id}")
    void deletePost(String id);                            //删帖

    @Update("update post set partId=#{partId},title=#{title},content=#{content},lastUpdateTime=#{lastUpdateTime} where id=#{id}")
    int editPost(Post post);                   //改贴

    @Select("select * from post where userId=#{userId}")
    List<Post> getPostByUserId(String userId);          //查询帖子

    @Select("select * from post where title=%#{keyword}% or content=%#{keyword}%")
    List<Post> getPostByPostKeyword(String postKeyword);

    @Update("update post set isHighlighted=1 where id=#{id}")
    int setPostHighlight(String id);                      //帖子加精

    @Update("update post set isHighlighted=0 where id=#{id}")
    int setPostUnHighlight(String id);

    @Update("update post set isTop=1 where id=#{id}")
    int setPostTop(String id);                            //帖子置顶

    @Update("update post set isTop=0 where id=#{id}")
    int setPostUnTop(String id);

    @Update("update post set isLocked=1 where id=#{id}")
    int setPostLocked(String id);                         //帖子锁定

    @Update("update post set isLocked=1 where id=#{id}")
    int setPostUnLocked(String id);

    @Select("select * from post where isHighlighted=1")
    List<Post> showHighlightPost();                         //显示所有加精帖子

    @Select("select * from post where isTop=0")
    List<Post> showTopPost();                           //显示置顶帖子

    @Update("update post set reward=#{reward} where id=#{id}")
    int setReward(String id,int reward);                          //设置悬赏
}
