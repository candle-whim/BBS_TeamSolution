package com.demo.mapper;

import com.demo.entity.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    @Select("select id,password,name from user")
    List<User> showAll();
    @Delete("delete from user where id=#{id}")
    int deleteUserById(@Param("id") String id);
}
