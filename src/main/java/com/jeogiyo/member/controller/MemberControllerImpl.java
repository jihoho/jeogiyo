package com.jeogiyo.member.controller;

import com.jeogiyo.common.base.BaseController;
import com.jeogiyo.member.service.MemberService;
import com.jeogiyo.member.vo.MemberVO;
import com.jeogiyo.common.util.SHA256Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller("memberController")
@RequestMapping(value="/member")
public class MemberControllerImpl extends BaseController implements MemberController {

    @Autowired
    MemberService memberService;
    @Autowired
    MemberVO memberVO;



    @Override
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(@RequestParam Map<String,String> loginMap, HttpServletRequest request, HttpServletResponse response) throws  Exception{

        ModelAndView mav =new ModelAndView();
        String salt=memberService.getMemberSaltByIdAndType(loginMap.get("member_id"),loginMap.get("member_type"));
        System.out.println("Salt : "+salt);
        String encryPasswd= SHA256Util.getEncrypt(loginMap.get("member_pw"),salt);
        System.out.println("Encry password: "+encryPasswd);
        loginMap.put("member_pw",encryPasswd);
        memberVO=memberService.login(loginMap);
        if(memberVO!=null&&memberVO.getMember_id()!=null){
            HttpSession session=request.getSession();
            session.setAttribute("isLogOn",true);
            session.setAttribute("memberInfo",memberVO);

            String action=(String)session.getAttribute("action");
            if(action!=null && action.equals("/order/orderFoods")) {
                mav.setViewName("forward:"+action);
            }else {
                mav.setViewName("redirect:/main/main");
            }
        }else{
            String message="아이디나 비밀번호가 틀립니다. 다시 로그인해주세요.";
            mav.addObject("message",message);
            mav.addObject("result","loginFailed");
            mav.setViewName("forward:/member/loginForm");
        }
        return mav;
    }

    @Override
    @RequestMapping(value = "/loginForm", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response)throws Exception{
        String viewName= (String)request.getAttribute("viewName");

        ModelAndView mav=new ModelAndView(viewName);
        String result= (String)request.getAttribute("result");
        System.out.println("loginForm.do result:"+result);
        if(result!=null&& result.equals("loginFailed")){
            mav.addObject("result","loginFailed");
        }
        return mav;
    }

    @Override
    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
        ModelAndView mav=new ModelAndView();
        HttpSession session=request.getSession();
        session.setAttribute("isLogOn",false);
        session.removeAttribute("memberInfo");
        mav.setViewName("redirect:/main/main");
        return mav;
    }





}
