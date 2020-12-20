package com.demo.controller;

import com.demo.entity.Module;
import com.demo.service.ModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/module")
public class ModuleController {
    @Autowired
    private ModuleService moduleService;

    @ResponseBody
    @RequestMapping("/view")
    public List<Module> viewModule(){
        List<Module> list = moduleService.findAll();
        return list;
    }

    @RequestMapping("/add")
    public String add(Module module){
        moduleService.add(module);
        return "module_control";
    }

    @RequestMapping("/deleteById")
    public String deleteById(String id){
        moduleService.deleteById(id);
        return "module_control";
    }
}
