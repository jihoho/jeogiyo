package com.jeogiyo.common.file;

import java.io.File;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;
@Controller
public class FileDownloadController {
	
	
//	@RequestMapping("/download")
//	protected void download(@RequestParam("fileName") String fileName,
//		                 	@RequestParam("goods_id") String goods_id,
//			                 HttpServletResponse response) throws Exception {
//		OutputStream out = response.getOutputStream();
//		String filePath=CURR_IMAGE_REPO_PATH+"\\"+goods_id+"\\"+fileName;
//		File image=new File(filePath);
//
//		response.setHeader("Cache-Control","no-cache");
//		response.addHeader("Content-disposition", "attachment; fileName="+fileName);
//		FileInputStream in=new FileInputStream(image); 
//		byte[] buffer=new byte[1024*8];
//		while(true){
//			int count=in.read(buffer); //버퍼에 읽어들인 문자개수
//			if(count==-1)  //버퍼의 마지막에 도달했는지 체크
//				break;
//			out.write(buffer,0,count);
//		}
//		in.close();
//		out.close();
//	}
	
	
	@RequestMapping("/shopThumbnails")
	protected void shopThumbnails(@RequestParam("fileName") String fileName,
                            	@RequestParam("shop_id") String shop_id,
                            	HttpServletRequest request,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=request.getRealPath("/")+"resources\\shop_img\\"+shop_id+"\\"+fileName;
		System.out.println("shop image file : "+filePath);
		File image=new File(filePath);
		
		if (image.exists()) { 
			Thumbnails.of(image).size(121,154).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}

	/*
	* 	shop_id, food_id를 parameter로 food image 썸네일 출력
	* 	food image file name은 food_[food_id].png
	* 	ex) food_401.png
_	* */
	@RequestMapping("/foodThumbnails")
	protected void foodThumbnails(@RequestParam("food_id") String food_id,
							  @RequestParam("shop_id") String shop_id,
							  HttpServletRequest request,
							  HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String fileName="food_"+food_id+".png";
		String filePath=request.getRealPath("/")+"resources\\shop_img\\"+shop_id+"\\food\\"+fileName;
		System.out.println("shop image file : "+filePath);
		File image=new File(filePath);

		if (image.exists()) {
			Thumbnails.of(image).size(121,154).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
}
