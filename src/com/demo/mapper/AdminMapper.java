package com.demo.mapper;

import com.demo.entity.Admin;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminMapper {
    @Select("select * from administrator")
    List<Admin> findAllAdmin();
}
