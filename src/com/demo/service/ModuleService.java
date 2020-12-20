package com.demo.service;

import com.demo.entity.Module;
import com.demo.mapper.ModuleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ModuleService {
    @Autowired
    private ModuleMapper moduleMapper;

    public List<Module> findAll(){
        return moduleMapper.showAll();
    }

    public int add(Module module){
        return moduleMapper.add(module);
    }

    public int deleteById(String id){
        return moduleMapper.deleteById(id);
    }
}
