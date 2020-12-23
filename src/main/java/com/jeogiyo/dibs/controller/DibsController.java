package com.jeogiyo.dibs.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

public interface DibsController {
    public ResponseEntity isDibsOn(@RequestParam String shop_id, @RequestParam String member_id,@RequestParam  String member_type) throws Exception;
}
