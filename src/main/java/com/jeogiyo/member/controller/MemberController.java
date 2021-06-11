package com.jeogiyo.member.controller;

import com.jeogiyo.member.dto.MemberInfoDto;
import com.jeogiyo.member.exception.MemberNotFoundException;
import com.jeogiyo.member.service.MemberService;
import com.jeogiyo.member.vo.MemberVO;
import com.jeogiyo.common.util.SHA256Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller("memberController")
public class MemberController {

    @Autowired
    MemberService memberService;
    @Autowired
    MemberVO memberVO;


    @PostMapping("/members/login")
    public String login(@RequestParam Map<String, String> loginMap, HttpServletRequest request,
            Model model) throws Exception {
        try {
            MemberInfoDto memberInfoDto = memberService.login(loginMap);
            HttpSession session = request.getSession();
            session.setAttribute("isLogOn", true);
            session.setAttribute("memberInfo", memberInfoDto);
            String action = (String) session.getAttribute("action");
            if (action != null && action.equals("/order/orderFoods")) {
                return "forward:" + action;
            } else {
                return "redirect:/";
            }
        } catch (MemberNotFoundException e) {
            String message = "아이디나 비밀번호가 틀립니다. 다시 로그인해주세요.";
            model.addAttribute("message", message);
            model.addAttribute("result", "loginFailed");
            return "forward:/members/login-form";
        }
    }

    @RequestMapping(value = "/members/login-form", method = {RequestMethod.GET, RequestMethod.POST})
    public String loginForm() {
        return "/members/loginForm";
    }

    @GetMapping(value="/logout")
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
        ModelAndView mav=new ModelAndView();
        HttpSession session=request.getSession();
        session.setAttribute("isLogOn",false);
        session.removeAttribute("memberInfo");
        mav.setViewName("redirect:/main/main");
        return mav;
    }


    @GetMapping(value = "/checkid/{id}/{type}")
    @ResponseBody
    public ResponseEntity overlapped(@PathVariable String id , @PathVariable String type) throws Exception{
        ResponseEntity resEntity=null;
        HashMap<String,String> idMap=new HashMap<String,String>();
        idMap.put("id",id);
        idMap.put("type",type);
        System.out.println("call rest!");
        String result = memberService.overlapped(idMap);
        resEntity=new ResponseEntity(result, HttpStatus.OK);
        return resEntity;
    }

    @PostMapping(value = "/")
    @ResponseBody
    public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO _memberVO,
                                    HttpServletRequest request, HttpServletResponse response)throws Exception{
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String message = null;
        ResponseEntity resEntity = null;
        HttpHeaders responseHeaders = new HttpHeaders();


        //  비밀번호 암호화
        String salt= SHA256Util.generateSalt();
        _memberVO.setSalt(salt);
        String encryPasswd= SHA256Util.getEncrypt(_memberVO.getMember_pw(),salt);
        _memberVO.setMember_pw(encryPasswd);
        System.out.println("암호화된 비번: "+encryPasswd);

        responseHeaders.add("Content-Type", "text/html; charset=utf-8");
        //        일반 계정의 타입 설정
        _memberVO.setMember_type("NORMAL");
        try {
            memberService.addMember(_memberVO);
            message  = "<script>";
            message +=" alert('회원 가입을 마쳤습니다.로그인창으로 이동합니다.');";
            message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
            message += " </script>";

        }catch(Exception e) {
            message  = "<script>";
            message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
            message += " location.href='"+request.getContextPath()+"/member/memberForm.do';";
            message += " </script>";
            e.printStackTrace();
        }
        resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
        return resEntity;
    }


    @PostMapping(value = "/{id}/{type}")
    @ResponseBody
    public ResponseEntity modifyMember(@PathVariable String id,@PathVariable String type,
                                       @RequestBody MemberVO memberVO)throws Exception{
        ResponseEntity responseEntity=null;
        System.out.println(id+","+type);

        //        pass가 변경된 경우 salt와 encryPass생성하여 update
        if(memberVO.getMember_pw()!=null&&memberVO.getMember_pw()!=""){
            String salt=SHA256Util.generateSalt();
            String encryPasswd=SHA256Util.getEncrypt(memberVO.getMember_pw(),salt);
            memberVO.setMember_pw(encryPasswd);
            memberVO.setSalt(salt);
            memberService.modifyMember(memberVO);
            System.out.println("pass 변경");
        }else{  // pass가 변경되지 않은 경우 pass 제외하여 update
            memberService.modifyMemberExcludePw(memberVO);
            System.out.println("pass 변경 없음");
        }
        System.out.println(memberVO);
        responseEntity =new ResponseEntity(HttpStatus.OK);
        return responseEntity;
    }



}
