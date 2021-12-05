package com.capstone2.dichomuadich.controllers.publics;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShoppingCartController {

    @GetMapping("/cart")
    public String loadCart()
    {
        return "public.cart";
    }

    @GetMapping("/checkout")
    public String loadCheckout()
    {
        return "public.checkout";
    }
}
