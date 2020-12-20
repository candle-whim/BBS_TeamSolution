package com.demo.mapper;

import com.demo.entity.Module;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ModuleMapper {
    @Select("select * from module")
    List<Module> showAll();

    @Insert("insert into module(id,partName) values(#{id},#{partName})")
    int add(Module module);

    @Delete("delete from module where id=#{id}")
    int deleteById(@Param("id") String id);
}
