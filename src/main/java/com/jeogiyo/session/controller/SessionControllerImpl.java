package com.jeogiyo.session.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@RestController
@RequestMapping("/session")
public class SessionControllerImpl implements SessionController{

    @Override
    @PostMapping("/location")
    public ResponseEntity setLocation(@RequestBody Map<String,String> locMap, HttpServletRequest request)throws Exception{
        System.out.println("call session controller!!");
        ResponseEntity resEntity=null;
        HttpSession session= request.getSession();
        session.setAttribute("roadAddr",locMap.get("roadAddr"));
        session.setAttribute("jibunAddr",locMap.get("jibunAddr"));
        session.setAttribute("bcode",locMap.get("bcode"));
        resEntity=new ResponseEntity(HttpStatus.OK);
        return resEntity;
    }
}
