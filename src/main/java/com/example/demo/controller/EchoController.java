package com.example.demo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EchoController {
    @RequestMapping("/echo")
    public String echo(String str){
        return str;
    }
}
