package com.jeogiyo.member.controller;

import com.jeogiyo.member.dto.MemberSaveDto;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
            HttpSession session = request.getSession();
            memberService.login(loginMap, session);
            return getViewBySession(session);
        } catch (MemberNotFoundException e) {
            String message = "아이디나 비밀번호가 틀립니다. 다시 로그인해주세요.";
            model.addAttribute("message", message);
            model.addAttribute("result", "loginFailed");
            return "forward:/members/login-form";
        }
    }

    private String getViewBySession(HttpSession session) {
        String action = (String) session.getAttribute("action");
        if (action != null && action.equals("/order/orderFoods")) {
            return "forward:" + action;
        } else {
            return "redirect:/";
        }
    }

    @RequestMapping(value = "/members/login-form", method = {RequestMethod.GET, RequestMethod.POST})
    public String getLoginForm() {
        return "/members/loginForm";
    }

    @GetMapping("/members/logout")
    public String logout(HttpServletRequest request) {
        memberService.logout(request.getSession());
        return "redirect:/";
    }

    @GetMapping("/members/sign-up")
    public String getSignUpForm() {
        return "/members/memberForm";
    }

    @GetMapping("/members/checkid/{id}/{type}")
    @ResponseBody
    public ResponseEntity overlapped(@PathVariable String id, @PathVariable String type)
            throws Exception {
        String result = memberService.overlapped(id, type);
        return new ResponseEntity(result, HttpStatus.OK);
    }

    @PostMapping(value = "/members")
    @ResponseBody
    public ResponseEntity saveMember(@ModelAttribute MemberSaveDto memberSaveDto,
            HttpServletRequest request) {

        // * todo Validation 추가 구현

        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Type", "text/html; charset=utf-8");

        String message = null;
        try {
            memberService.saveMember(memberSaveDto);
            message = "<script>";
            message += " alert('회원 가입을 마쳤습니다.로그인창으로 이동합니다.');";
            message += " location.href='" + request.getContextPath() + "/members/login-form';";
            message += " </script>";

        } catch (Exception e) {
            message = "<script>";
            message += " alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
            message += " location.href='" + request.getContextPath() + "/member/sign-up';";
            message += " </script>";
            e.printStackTrace();
        }
        return new ResponseEntity(message, responseHeaders, HttpStatus.OK);

    }


    @PostMapping(value = "/{id}/{type}")
    @ResponseBody
    public ResponseEntity modifyMember(@PathVariable String id, @PathVariable String type,
            @RequestBody MemberVO memberVO) throws Exception {
        ResponseEntity responseEntity = null;
        System.out.println(id + "," + type);

        //        pass가 변경된 경우 salt와 encryPass생성하여 update
        if (memberVO.getPw() != null && memberVO.getPw() != "") {
            String salt = SHA256Util.generateSalt();
            String encryPasswd = SHA256Util.getEncrypt(memberVO.getPw(), salt);
            memberVO.setPw(encryPasswd);
            memberVO.setSalt(salt);
            memberService.modifyMember(memberVO);
            System.out.println("pass 변경");
        } else {  // pass가 변경되지 않은 경우 pass 제외하여 update
            memberService.modifyMemberExcludePw(memberVO);
            System.out.println("pass 변경 없음");
        }
        System.out.println(memberVO);
        responseEntity = new ResponseEntity(HttpStatus.OK);
        return responseEntity;
    }


}
