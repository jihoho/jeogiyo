package com.jeogiyo.session.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public interface SessionController {
    public ResponseEntity setLocation(@RequestBody Map<String,String> locMap, HttpServletRequest request)throws Exception;
}
