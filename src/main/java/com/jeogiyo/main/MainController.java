package com.jeogiyo.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller("mainController")
public class MainController{

	@GetMapping("/")
	public String main() throws Exception{
		return "/main/main";
	}

}
