package com.capstone2.dichomuadich.controllers.publics;

import com.capstone2.dichomuadich.domain.Combo;
import com.capstone2.dichomuadich.domain.Role;
import com.capstone2.dichomuadich.domain.Store;
import com.capstone2.dichomuadich.domain.User;
import com.capstone2.dichomuadich.domain.Wards;
import com.capstone2.dichomuadich.services.*;
import com.capstone2.dichomuadich.services.ComboService;
import com.capstone2.dichomuadich.services.RoleService;
import com.capstone2.dichomuadich.services.StoreService;
import com.capstone2.dichomuadich.domain.*;
import com.capstone2.dichomuadich.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@ControllerAdvice
public class HomePublicController {

    @Autowired
    StoreService storeService;

    @Autowired
    UserService userService;

    @Autowired
    ComboService comboService;

    @Autowired
    WardsService wardsService;

    @Autowired
    ProductService productService;

    @ModelAttribute
    public void addModel(Model model)
    {
        List<Store> storeList = storeService.getAll();
        List<Store> foodStore = (List<Store>) storeList.stream().filter(store -> store.getStoreType() == 1).collect(Collectors.toList());
        List<Store> medicineSore = (List<Store>) storeList.stream().filter(store -> store.getStoreType() == 2).collect(Collectors.toList());
        List<Wards> wardsList = wardsService.findAll();
        Sort sort = Sort.by("view").descending();
        List<Combo> combos =  (List<Combo>)comboService.getAll(sort).stream().limit(10).collect(Collectors.toList());
        List<Items> itemsList =  (List<Items>) productService.getAll(sort).stream().limit(10).collect(Collectors.toList());
        model.addAttribute("itemsList", itemsList);
        model.addAttribute("storeList", storeList);
        model.addAttribute("foodStores", foodStore);
        model.addAttribute("medicineStores", medicineSore);
        model.addAttribute("combos", combos);
        model.addAttribute("wardsList", wardsList);

    }

    @GetMapping({"/" , "/index"})
    public String loadHomePage()
    {
        return "public.home";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session)
    {
        if (session.getAttribute("userInfo") != null) {
            User user = (User) session.getAttribute("userInfo");
            userService.updateToken(null, user.getUsername());
            session.removeAttribute("userInfo");
        }
        if (session.getAttribute("roles") != null) {
            session.removeAttribute("roles");
        }
        return "redirect:/index";
    }
}
