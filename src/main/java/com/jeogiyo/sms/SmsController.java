package com.jeogiyo.sms;

import net.nurigo.java_sdk.Coolsms;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@Controller("smsController")
@RequestMapping("/sms")
public class SmsController {



    @ResponseBody
    @RequestMapping(value="/sendSms.do", method = {RequestMethod.POST, RequestMethod.GET})
    public HashMap<String,String> sendSms(@RequestParam("phone") String phoneNumber, HttpServletRequest request) {
        System.out.println("sendSms!!");
        String api_key = "NCSJ9ELR3NHSC6X5";
        String api_secret = "BYQCP0JTC2TF5WOUGFCH1HJV6RMXBMLB";
        Message coolsms = new Message(api_key, api_secret); // 메시지보내기 객체 생성
        // 4자리 인증 코드 생성
        int rand_num = (int) (Math.random() * 8999) + 1000;

        System.out.println("수신자 번호: "+ phoneNumber);
        System.out.println("인증 번호: "+rand_num);
        HashMap<String, String> set = new HashMap<String, String>();
//        set.put("to", phoneNumber); // 수신번호
        set.put("to", "01056254589"); // 수신번호
        set.put("from", "0105654589"); // 발신번호
        set.put("text", "안녕하세요 저기요입니다. 인증번호는 [" +rand_num + "] 입니다."); // 문자내용
        set.put("type", "sms"); // 문자 타입

        HashMap<String,String> result=new HashMap<String,String>();
        result.put("key",String.valueOf(rand_num));

        try {
            JSONObject result_sms = coolsms.send(set); // 보내기&전송결과받기
            System.out.println(result_sms.toString());
            result.put("result","success");
        }catch (CoolsmsException e){
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
            result.put("result","fail");
        }
        System.out.println("json object:  "+ result.toString());
        return result;
    }


}
