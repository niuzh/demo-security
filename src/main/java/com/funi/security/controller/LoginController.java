package com.funi.security.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author zhihuan.niu on 7/20/17.
 */
@Controller
public class LoginController {

    @RequestMapping("/")
    @Secured("Index")//配置方法访问权限，在过滤器中处理
    public String index(Model model){
        model.addAttribute("view","index");
        User user=(User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        model.addAttribute("user",user);
        return "index";
    }

    @RequestMapping("/index1")
    @Secured("Index1")
    public String index1(Model model){
        model.addAttribute("view","index1");
        return "index";
    }

    @RequestMapping("/denied")
    @ResponseBody
    public String denied(){
        return "denied";
    }
}
