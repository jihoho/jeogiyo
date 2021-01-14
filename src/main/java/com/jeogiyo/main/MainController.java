package com.jeogiyo.main;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jeogiyo.common.base.BaseController;

@Controller("mainController")
@RequestMapping("/main")
public class MainController extends BaseController{
	
	
	@RequestMapping(value="/main", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView mav=new ModelAndView();
		String viewName= (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		ServletContext context= request.getServletContext();
		System.out.println("main controller view name: "+ viewName);
		return mav;
	}

	

}
