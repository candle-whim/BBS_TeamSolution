package com.demo.mapper;

import com.demo.entity.Reply;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ReplyMapper {
    @Select("select * from reply")
    List<Reply> showAllReply();

    @Select("select * from reply where replyUserId=#{replyUserId}")
    List<Reply> showReplyByReplyUserId(@Param("replyUserId") String replyUserId);

    @Select("select * from reply where postId = #{postId}")
    List<Reply> showReplyByPostId(@Param("postId") String postId);

    @Insert("insert into reply(id,postId,replyUserId,content,createTime,clickCount) values(#{id},#{replyUserId},#{postId},#{content},#{createTime},#{clickCount}")
    int addReply(Reply reply);

    @Delete("delete from reply where id=#{id}")
    int deleteReply(String id);
}
