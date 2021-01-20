package com.jeogiyo.mypage.controller;

import com.jeogiyo.common.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller("myPageController")
@RequestMapping("/mypage")
public class MyPageControllerImpl extends BaseController implements MyPageController{

    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public ModelAndView myInfo(HttpServletRequest request) throws Exception{
        ModelAndView mav=new ModelAndView();
        String viewName=(String)request.getAttribute("viewName");
        mav.setViewName(viewName);
        return mav;

    }
}
