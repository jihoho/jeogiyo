package com.jeogiyo.review.controller;

import com.jeogiyo.common.base.BaseController;
import com.jeogiyo.common.util.Pagination;
import com.jeogiyo.member.vo.MemberVO;
import com.jeogiyo.review.service.ReviewService;
import com.jeogiyo.review.vo.ReviewImageVO;
import com.jeogiyo.review.vo.ReviewVO;
import net.coobird.thumbnailator.Thumbnails;
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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.OutputStream;
import java.util.*;

@Controller
public class ReviewController {
    @Autowired
    ReviewService reviewService;

    @Autowired
    ReviewVO reviewVO;

    private static final String CURR_IMAGE_REPO_PATH="C:\\Users\\hojun\\jeogiyo_file_repo\\review_imgs";

    @GetMapping("/reviews/{reviewId}")
    public ResponseEntity searchReviewById(@PathVariable int reviewId) throws Exception{
        ResponseEntity responseEntity=null;
        reviewVO=reviewService.searchReviewById(reviewId);
        responseEntity=new ResponseEntity(reviewVO,HttpStatus.OK);
        return responseEntity;
    }

    @GetMapping("/reviews/{reviewId}/images")
    public ResponseEntity searchReviewImageByReviewId(@PathVariable int reviewId) throws Exception{
        ResponseEntity responseEntity=null;
        List<ReviewImageVO> reviewImageVOList=reviewService.searchReviewImageByReviewId(reviewId);
        responseEntity=new ResponseEntity(reviewImageVOList,HttpStatus.OK);
        return responseEntity;
    }

    @GetMapping("/reviews/{reviewId}/thumbnails/{fileName}")
    protected void reviewImageThunmbnails(@PathVariable String reviewId,
                                          @PathVariable String fileName,
                                          HttpServletResponse response) throws Exception{
        OutputStream out=response.getOutputStream();
        String filePath=CURR_IMAGE_REPO_PATH+"\\"+reviewId+"\\"+fileName;
        System.out.println("review image file path: "+filePath);

        File image=new File(filePath);

        if (image.exists()) {
            Thumbnails.of(image).size(300,300).outputFormat("png").toOutputStream(out);
        }
        byte[] buffer = new byte[1024 * 8];
        out.write(buffer);
        out.close();
    }

    @DeleteMapping("/reviews/{reviewId}")
    public ResponseEntity deleteReview(@PathVariable int reviewId) throws  Exception{
        ResponseEntity responseEntity=null;
        reviewService.deleteReviewImagesByReviewId(reviewId);
        reviewService.deleteReviewByReviewId(reviewId);
        deleteImageFolder(reviewId);
        responseEntity=new ResponseEntity(HttpStatus.OK);
        return responseEntity;
    }


    @PostMapping("/reviews")
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


//    이미지 파일 업로드
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


//    이미지 폴더 삭제 (하위 파일 포함)
    protected void deleteImageFolder(int reviewId) throws Exception {
        File folder= new File(CURR_IMAGE_REPO_PATH+"\\"+reviewId);
        try{
            while (folder.exists()){
                File[] imageList=folder.listFiles();
                for(int i=0;i<imageList.length;i++){
                    imageList[i].delete();
                    System.out.println(imageList[i].getName()+" 리뷰 이미지 삭제! ");
                }

                if(imageList.length==0 && folder.isDirectory()){
                    folder.delete(); // 이미지 폴더 삭제
                    System.out.println(CURR_IMAGE_REPO_PATH+"\\"+reviewId+" 리뷰 이미지 폴더 삭제");
                }

            }
        }catch (Exception e){
            e.getStackTrace();
        }
    }


}
