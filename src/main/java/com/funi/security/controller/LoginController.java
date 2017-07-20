package com.funi.security.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author zhihuan.niu on 7/20/17.
 */
@Controller
public class LoginController {

    @RequestMapping("/")
    public String index(){
        return "index";
    }
}
