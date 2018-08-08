package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.BlogService;

@Controller
public class IndexController {
	
	@RequestMapping(value = {"index.do"})
	public String index(){
		return "index";
	}
}
