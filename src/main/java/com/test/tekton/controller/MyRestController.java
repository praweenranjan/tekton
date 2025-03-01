package com.test.tekton.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MyRestController {

    @GetMapping
    public String hello() {
        return "Hello World!";
    }




}
