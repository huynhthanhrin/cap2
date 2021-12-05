package com.capstone2.dichomuadich.controllers.publics;

import com.capstone2.dichomuadich.constant.CommonConstants;
import com.capstone2.dichomuadich.domain.Order;
import com.capstone2.dichomuadich.domain.User;
import com.capstone2.dichomuadich.services.OrderItemService;
import com.capstone2.dichomuadich.services.OrderService;
import com.capstone2.dichomuadich.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

@Controller
@RequestMapping("order")
public class OrderController {

    @Autowired
    UserService userService;

    @Autowired
    OrderService orderService;

    @Autowired
    MessageSource messageSource;

    @Autowired
    OrderItemService orderItemService;

    @ModelAttribute
    public void sendService(Model model)
    {
        model.addAttribute("orderItemService", orderItemService);
    }

    @GetMapping("/index")
    public String loadOrder(HttpSession session, Model model)
    {
        User userInfo = (User) session.getAttribute("userInfo");
        List<Order> orderListByUser = orderService.findOrdersByUser(userInfo).stream()
                .sorted(Comparator.comparing(Order::getOrderId).reversed()).collect(Collectors.toList());
        model.addAttribute("orderList", orderListByUser);
        return "public.order";
    }

    @GetMapping("/cancel/{oid}")
    public String cancelOrder(@PathVariable int oid, RedirectAttributes rd)
    {
        orderService.updateOrderStatus(CommonConstants.CANCELED_STATUS, oid);
        rd.addFlashAttribute(CommonConstants.MSG,
                messageSource.getMessage("canceled_order_successfully", null, Locale.getDefault()));
        return "redirect:/order/index";
    }

    @GetMapping("/update-status/{status}/{oid}")
    public String updateStatus(@PathVariable int status, @PathVariable int oid, RedirectAttributes rd)
    {
        orderService.updateOrderStatus(status, oid);
        rd.addFlashAttribute(CommonConstants.MSG,
                messageSource.getMessage("update_status_order_successfully", null, Locale.getDefault()));
        return "redirect:/admin/order/index";
    }

}
