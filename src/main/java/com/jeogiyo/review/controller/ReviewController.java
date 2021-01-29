package com.jeogiyo.review.controller;

import com.jeogiyo.common.base.BaseController;
import com.jeogiyo.common.util.Pagination;
import com.jeogiyo.member.vo.MemberVO;
import com.jeogiyo.review.service.ReviewService;
import com.jeogiyo.review.vo.ReviewImageVO;
import com.jeogiyo.review.vo.ReviewVO;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

@Controller
public class ReviewController extends BaseController {
    @Autowired
    ReviewService reviewService;

    private static final String CURR_IMAGE_REPO_PATH="C:\\Users\\hojun\\jeogiyo_file_repo\\review_imgs";

    @PostMapping("/review")
    public ResponseEntity addNewReview(MultipartHttpServletRequest request,
                                       @RequestParam("input_imgs") List<MultipartFile> filesList,
                                       @ModelAttribute("reviewVO")ReviewVO reviewVO) throws Exception{
        ResponseEntity responseEntity=null;
        for(MultipartFile mf: filesList){
            System.out.println(mf.getOriginalFilename());
        }
        System.out.println(reviewVO);

        int reviewId=reviewService.addNewReview(reviewVO);
        List<ReviewImageVO> reviewImageVOList=upload(filesList,reviewId);
        System.out.println(reviewImageVOList);
        try {
            for (ReviewImageVO reviewImageVO : reviewImageVOList) {
                String fileName = reviewImageVO.getFileName();
                File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\temp\\" + fileName);
                File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + reviewImageVO.getReviewId());
                FileUtils.moveFileToDirectory(srcFile, destDir, true);
                int reviewImageId=reviewService.addNewReviewImage(reviewImageVO);
                responseEntity=new ResponseEntity(HttpStatus.CREATED);
            }
        }catch (Exception e){
            for (ReviewImageVO reviewImageVO : reviewImageVOList) {
                String fileName = reviewImageVO.getFileName();
                File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\temp\\" + fileName);
                srcFile.delete();
                responseEntity=new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
            }
            e.printStackTrace();
        }
        return responseEntity;
    }

    protected List<ReviewImageVO> upload(List<MultipartFile> filesList,int reviewId) throws Exception{
        List<ReviewImageVO> reviewImageVOList= new ArrayList<ReviewImageVO>();

        for(MultipartFile mFile: filesList){
            ReviewImageVO reviewImageVO=new ReviewImageVO();
            reviewImageVO.setReviewId(reviewId);
            String originalFilename = mFile.getOriginalFilename();
            reviewImageVO.setFileName(originalFilename);
            reviewImageVOList.add(reviewImageVO);

            // 목적지 디렉토리
            File file = new File(CURR_IMAGE_REPO_PATH +"\\"+reviewId+"\\"+originalFilename);
            if(mFile.getSize()!=0){
                if(! file.exists()){
                    file.getParentFile().mkdirs();  // 폴더를 생성

                }
                // 임시로 저장될 디렉토리
                File tmpFile=new File(CURR_IMAGE_REPO_PATH +"\\"+"temp"+ "\\"+originalFilename);
                if(! tmpFile.exists()){
                    tmpFile.getParentFile().mkdirs();

                }
                mFile.transferTo(tmpFile); // 임시 경로에 저장
            }
        }

       return reviewImageVOList;
    }



}
