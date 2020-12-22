package com.jeogiyo.order.controller;

import com.jeogiyo.order.vo.OrderFood;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller("orderController")
@RequestMapping("/order")
public class OrderControllerImpl implements OrderController{

    @Override
    @RequestMapping(value = "/orderDetail.do", method = RequestMethod.POST)
    public ModelAndView orderDetail(@ModelAttribute("orderFood")OrderFood orderFood,
                                    HttpServletRequest request){
        System.out.println("call orderDetail!!");
        List<OrderFood> list=orderFood.getOrderFoodList();
        for(int i=0;i<list.size();i++){
            OrderFood food=list.get(i);
            System.out.println(i+". food id: "+food.getFood_id() +", food_qty: "+food.getFood_qty());
        }
        String viewName=(String) request.getAttribute("viewName");
        ModelAndView mav=new ModelAndView(viewName);
        return mav;
    }
}
