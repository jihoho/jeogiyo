package com.jeogiyo.review.controller;

import com.jeogiyo.common.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ReviewController extends BaseController {

    @PostMapping("/review")
    public ModelAndView createReview(MultipartHttpServletRequest request,
                                     @RequestParam("file1") List<MultipartFile> filesList){
        for(MultipartFile mf: filesList){
            System.out.println(mf.getOriginalFilename());
        }
        return null;
    }
}
