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
    User findByUsername(@Param("name") String name);
    int addUser(@Param("name") String name,@Param("password") String password);
    List<User> findAllUser();

    int findIdByUserName(@Param("name") String name);
    void addCredit(@Param("id")int id);
    void addCredit(@Param("id")int id,@Param("score") int sore);
    void changeUserTypeToMaster(@Param("id") int id);
}
