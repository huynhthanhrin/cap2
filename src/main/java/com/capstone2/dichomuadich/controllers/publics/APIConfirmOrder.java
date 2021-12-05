package com.capstone2.dichomuadich.controllers.publics;

import com.capstone2.dichomuadich.domain.Order;
import com.capstone2.dichomuadich.domain.OrderItems;
import com.capstone2.dichomuadich.domain.User;
import com.capstone2.dichomuadich.models.CartRequest;
import com.capstone2.dichomuadich.models.ConfirmOrderRequest;
import com.capstone2.dichomuadich.models.ResponseAPI;
import com.capstone2.dichomuadich.services.*;
import lombok.extern.log4j.Log4j2;
import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.sql.Array;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Objects;

@Log4j2
@RestController
@RequestMapping("api")
public class APIConfirmOrder {

    @Autowired
    ProductService productService;

    @Autowired
    ComboService comboService;

    @Autowired
    OrderItemService orderItemService;

    @Autowired
    OrderService orderService;

    @Autowired
    StoreService storeService;

    @PostMapping("/order")
    public ResponseAPI confirmOrder(@RequestBody ConfirmOrderRequest confirmOrderRequest, HttpSession session)
    {
        Order order = new Order();
        User userOrder = (User) session.getAttribute("userInfo");
        order.setRecipientName(confirmOrderRequest.getRecipientName());
        order.setRecipientPhone(confirmOrderRequest.getRecipientPhone());
        if ("true".equalsIgnoreCase(confirmOrderRequest.getSameAddressDelivery()))
        {
            order.setRecipientAddress(userOrder.getAddress());
        } else {
            order.setRecipientAddress(confirmOrderRequest.getRecipientAddress());
        }
        Timestamp orderTime = Timestamp.valueOf( LocalDateTime.now());
        order.setOrderTime(orderTime);
        order.setUser(userOrder);
        Double totalPrice = 0.0;
        totalPrice = Arrays.asList(confirmOrderRequest.getCartRequest()).
                stream()
                .mapToDouble(item -> item.getCount() * item.getPrice()).sum();
        order.setTotalPrice(totalPrice);

        order.setStore(storeService.findStoreByStoreId(confirmOrderRequest.getCartRequest()[0].getStoreId()));
        Order orderSave = orderService.save(order);
        Boolean success = false;
        if (Objects.nonNull(orderSave))
        {
            success = true;
            for (int i=0; i < confirmOrderRequest.getCartRequest().length; i++)
            {
                try {
                    CartRequest cartRequest = confirmOrderRequest.getCartRequest()[i];
                    OrderItems orderItems = new OrderItems();
                    orderItems.setOrder(orderSave);

                    if (cartRequest.getIsCombo() == null)
                    {
                        orderItems.setItems(productService.findItemById(Integer.parseInt(cartRequest.getProductcode())));
                        orderItems.setItemQuantity(cartRequest.getCount());
                        totalPrice += totalPrice + (Double.parseDouble(cartRequest.getPrice().toString())*cartRequest.getCount());
                    } else {
                        orderItems.setCombo(comboService.getComboById(Integer.parseInt(cartRequest.getProductcode())));
                        orderItems.setComboQuantity(cartRequest.getCount());
                        totalPrice += totalPrice + (Double.parseDouble(cartRequest.getPrice().toString())*cartRequest.getCount());
                    }
                    OrderItems orderItemsSave = orderItemService.save(orderItems);
                } catch (Exception e) {
                    success = false;
                    log.error("error when save OrderItems:" + e);
                }
            }
        }
        HashMap resultLogin = new HashMap();
        resultLogin.put("orderSave", orderSave);
        ResponseAPI responseAPI = success ?  new ResponseAPI(HttpStatus.SC_OK, "OK", orderSave) : new ResponseAPI(HttpStatus.SC_BAD_REQUEST, "ERROR", orderSave);
        return responseAPI;
    }
}
