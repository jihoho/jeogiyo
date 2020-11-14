package com.jeogiyo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DemoController {
	
	@ResponseBody
	@RequestMapping("/")
	public String home() {
		System.out.println("hello boot!!");
		return "hello boot!!";
	}
	
	@RequestMapping("/hello.do")
	public String hello(Model model) {
		System.out.println("hello");
		return "hello";
	}
}
