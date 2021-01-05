package com.jeogiyo.order.controller;

import com.jeogiyo.order.vo.OrderFoodVO;
import com.jeogiyo.order.vo.OrderFormVO;
import com.jeogiyo.order.vo.OrderVO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public interface OrderController {
    public ModelAndView orderForm(@ModelAttribute("orderFormVO") OrderFormVO orderFormInfo,
                                  HttpServletRequest request) throws Exception;
    public ResponseEntity addOrder(@RequestBody OrderVO orderVO) throws Exception;

    public ResponseEntity addOrderFoodList(@RequestBody Map<String,Object> orderFoodMap) throws  Exception;
}
