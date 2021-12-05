package com.capstone2.dichomuadich.controllers.admin;

import com.capstone2.dichomuadich.constant.CommonConstants;
import com.capstone2.dichomuadich.domain.Order;
import com.capstone2.dichomuadich.domain.OrderItems;
import com.capstone2.dichomuadich.domain.User;
import com.capstone2.dichomuadich.services.OrderItemService;
import com.capstone2.dichomuadich.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("admin/order")
public class AdminOrderController {

    @Autowired
    OrderService orderService;

    @Autowired
    OrderItemService orderItemService;

    @ModelAttribute
    public void sendService(Model model)
    {
        model.addAttribute("orderItemService", orderItemService);
    }

    @GetMapping("/index")
    public String index( HttpServletRequest request, Model model){

        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("userLogin");

        List<Order> orderList = orderService.findAll();
        List<Order> orderList1 = new ArrayList<>();

        if (user.getRole().getRoleCode().equals(CommonConstants.WARD_MANAGE_ROLE))
        {
            orderList1 = (List<Order>) orderList.stream().filter(order -> order.getUser().getWards().getWardsId() == user.getWards().getWardsId()).collect(Collectors.toList());
        }
        if (user.getRole().getRoleCode().equals(CommonConstants.STORE_MANAGE_ROLE))
        {
            orderList1 = (List<Order>) orderList.stream().filter(order -> order.getStore().getStoreId() == user.getStore().getStoreId() && order.getStatus() != 0).collect(Collectors.toList());
        }

        model.addAttribute("orderList",orderList1);
        return "admin.order.index";
    }
}
