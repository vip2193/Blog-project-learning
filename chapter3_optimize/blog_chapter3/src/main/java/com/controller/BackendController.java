package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("backend")
@Controller
public class BackendController {
	
	@RequestMapping("management.do")
	public String managementPage(){
		return "management";
	}
	
}
