package com.capstone2.dichomuadich.controllers.admin;

import com.capstone2.dichomuadich.domain.*;
import com.capstone2.dichomuadich.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("admin")
@ControllerAdvice
public class AdminHomeController {

    @Autowired
    UserService userService;

    @Autowired
    RoleService roleService;

    @Autowired
    WardsService wardsService;

    @Autowired
    StoreService storeService;

    @Autowired
    OrderService orderService;

    @ModelAttribute
    public void addModel(Model model)
    {
        List<Role> roleList = roleService.findAll();
        List<Wards> wardsList = wardsService.findAll();
        List<Store> storeList = storeService.getAll();
        List<User> userList = userService.findAll();
        List<Order> orderList = orderService.findAll();
        List<Order> orderListProcess = orderList.stream().filter(order -> order.getStatus() == 0).collect(Collectors.toList());
        model.addAttribute("roles", roleList);
        model.addAttribute("storeList", storeList);
        model.addAttribute("wardsList", wardsList);
        model.addAttribute("userList", userList);
        model.addAttribute("orderList", orderList);
        model.addAttribute("newOrder", orderListProcess);

    }

    @GetMapping("/index")
    public String loadHome( Principal principal, HttpSession session)
    {

        String username = "";
        try {
            username = principal.getName();
            User user = userService.findByUsername(username);
            session.setAttribute("userLogin", user);
        } catch (Exception e) {
            // TODO: handle exception
            return "redirect:/admin/login";
        }
        return "admin.index";
    }
}
