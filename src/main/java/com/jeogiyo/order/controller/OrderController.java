package com.jeogiyo.order.controller;

import com.jeogiyo.order.vo.OrderFood;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface OrderController {
    public ModelAndView orderDetail(@ModelAttribute("orderFood") OrderFood orderFood,
                                    HttpServletRequest request);
}
