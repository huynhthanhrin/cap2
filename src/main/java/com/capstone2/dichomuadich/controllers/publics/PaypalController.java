package com.capstone2.dichomuadich.controllers.publics;

import com.capstone2.dichomuadich.constant.CommonConstants;
import com.capstone2.dichomuadich.domain.Order;
import com.capstone2.dichomuadich.domain.OrderItems;
import com.capstone2.dichomuadich.models.OrderOnline;
import com.capstone2.dichomuadich.services.OrderItemService;
import com.capstone2.dichomuadich.services.OrderService;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Locale;

@Controller
public class PaypalController {

    @Autowired
    PaypalService service;

    @Autowired
    OrderService orderService;

    @Autowired
    OrderItemService orderItemService;

    @Autowired
    MessageSource messageSource;

    public static final String SUCCESS_URL = "pay/success";
    public static final String CANCEL_URL = "pay/cancel";

    @GetMapping("/payment/{orderId}")
    public ModelAndView home(@PathVariable int orderId) {
        ModelAndView mv = new ModelAndView("public.payment");
        Order order = orderService.findOrderByOrderId(orderId);
        List<OrderItems> listOrderItem = orderItemService.findOrderItemsByOrder(order);
        mv.addObject("order",order);
        mv.addObject("orderItems",listOrderItem);
        return mv;
    }

    @PostMapping("/pay/{orderId}")
    public String payment(@ModelAttribute("order") OrderOnline order, HttpServletRequest request,@PathVariable int orderId) {
        try {
            Payment payment = service.createPayment(order.getPrice(), order.getCurrency(), order.getMethod(),
                    order.getIntent(), order.getDescription(), "http://localhost:8080/" + CANCEL_URL,
                    "http://localhost:8080/" + SUCCESS_URL );
            for(Links link:payment.getLinks()) {
                if(link.getRel().equals("approval_url")) {
                    HttpSession session = request.getSession();
                    session.setAttribute("OrderId", orderId);
                    return "redirect:"+link.getHref();
                }
            }

        } catch (PayPalRESTException e) {

            e.printStackTrace();
        }
        return "redirect:/";
    }

    @GetMapping(value = CANCEL_URL)
    public String cancelPay() {
        return "redirect:/";
    }

    @GetMapping(value = SUCCESS_URL)
    public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId, HttpServletRequest request, RedirectAttributes rd) {
        try {
            Payment payment = service.executePayment(paymentId, payerId);
            System.out.println(payment.toJSON());
            if (payment.getState().equals("approved")) {
                HttpSession session = request.getSession();
                int id = (int)session.getAttribute("OrderId");
                orderService.updateOrderStatusPayment(1, id);
                rd.addFlashAttribute(CommonConstants.MSG,
                        messageSource.getMessage("payment_success", null, Locale.getDefault()));
                return "redirect:/order/index";
            }
        } catch (PayPalRESTException e) {
            System.out.println(e.getMessage());
        }
        return "redirect:/";
    }

}

