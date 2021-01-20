package com.jeogiyo.order.controller;

import com.jeogiyo.common.base.BaseController;
import com.jeogiyo.order.service.OrderService;
import com.jeogiyo.order.vo.OrderFoodVO;
import com.jeogiyo.order.vo.OrderFormVO;
import com.jeogiyo.order.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller("orderController")
@RequestMapping("/orders")
public class OrderController extends BaseController{

    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderVO orderVO;

    @PostMapping("/orderForm")
    public ModelAndView orderForm(@ModelAttribute("orderFormVO") OrderFormVO orderFormInfo,
                                    HttpServletRequest request) throws Exception{
        System.out.println("call orderDetail!!");

        System.out.println(orderFormInfo);
        String viewName=(String) request.getAttribute("viewName");
        ModelAndView mav=new ModelAndView(viewName);
        mav.addObject("orderFormInfo",orderFormInfo);
        return mav;
    }

    @PostMapping
    public ResponseEntity addOrder(@RequestBody OrderVO orderVO) throws  Exception{
        ResponseEntity resEntity=null;
        System.out.println("call orderController");
        System.out.println(orderVO);
        int order_id=orderService.addOrder(orderVO);
        resEntity=new ResponseEntity(order_id,HttpStatus.CREATED);
        return resEntity;
    }

    @GetMapping("/{orderId}")
    public ResponseEntity searchOrderById(@PathVariable("orderId") String orderId) throws Exception{
        ResponseEntity responseEntity=null;
        System.out.println("orderController order id:"+orderId);
        OrderVO orderVO=orderService.searchOrderById(orderId);
        System.out.println(orderVO);
        responseEntity=new ResponseEntity(orderVO,HttpStatus.OK);
        return responseEntity;
    }

//    rest하지 않은것 같음 추후 수정해야함.
    @GetMapping("/foods/orderid/{orderId}")
    public ResponseEntity searchFoodListByOrderId(@PathVariable("orderId") String orderId) throws Exception{
        ResponseEntity responseEntity=null;
        System.out.println("orderController order id:"+orderId);
        List<OrderFoodVO> orderFoodVOList=orderService.searchOrderFoodByOrderId(orderId);
        responseEntity=new ResponseEntity(orderFoodVOList,HttpStatus.OK);
        return responseEntity;
    }

    @GetMapping("/{memberId}/{memberType}")
    public ResponseEntity searchOrderByMember(@PathVariable("memberId") String memberId,
                                           @PathVariable("memberType") String memberType) throws Exception{
        ResponseEntity responseEntity=null;
        System.out.println("orderController member id : "+memberId+", member type: "+memberType);
        List<OrderVO> orderVOList=orderService.searchOrderListByMember(memberId,memberType);
        responseEntity=new ResponseEntity(orderVOList,HttpStatus.OK);
        return responseEntity;
    }

    @PostMapping("/foods")
    public ResponseEntity addOrderFoodList(@RequestBody Map<String,Object> orderFoodMap) throws  Exception{
        ResponseEntity resEntity=null;
        int order_id=(int)orderFoodMap.get("order_id");
        List<Map> foodList=(List<Map>)orderFoodMap.get("food_list");
        for(int i=0;i<foodList.size();i++){
            Map food=foodList.get(i);
            food.put("order_id",order_id);
            System.out.println(food);
            orderService.addOrderFood(food);
        }
        resEntity=new ResponseEntity(HttpStatus.CREATED);
        return resEntity;
    }


}
