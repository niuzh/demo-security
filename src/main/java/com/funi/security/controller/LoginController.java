package com.funi.security.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author zhihuan.niu on 7/20/17.
 */
@Controller
public class LoginController {

    @RequestMapping("/loginUrl")
    public String login(){
        return "login";
    }

    @RequestMapping("/")
    public String index(){
        return "index";
    }

    @RequestMapping("/denied")
    @ResponseBody
    public String denied(){
        return "denied";
    }
}
