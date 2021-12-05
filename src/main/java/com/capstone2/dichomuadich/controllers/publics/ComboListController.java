package com.capstone2.dichomuadich.controllers.publics;

import com.capstone2.dichomuadich.domain.Category;
import com.capstone2.dichomuadich.domain.Combo;
import com.capstone2.dichomuadich.domain.Items;
import com.capstone2.dichomuadich.domain.Store;
import com.capstone2.dichomuadich.services.CategoryService;
import com.capstone2.dichomuadich.services.ComboService;
import com.capstone2.dichomuadich.services.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("store")
public class ComboListController {

    @Autowired
    StoreService storeService;

    @Autowired
    ComboService comboService;

    @Autowired
    CategoryService categoryService;

    @GetMapping({"/combo/{sid}", "/combo/{sid}/{comboId}"})
    public String loadProductByStore(@PathVariable Integer sid, Model model)
    {
        Store store = storeService.findStoreByStoreId(sid);
        List<Category> categoryList = categoryService.getListCategoryByStore(store);
        List<Combo> combos = comboService.getListComboByStore(store);
        model.addAttribute("store", store);
        model.addAttribute("categoryList", categoryList);
//        model.addAttribute("combo", comboId != null ? comboService.getComboById(comboId): null);
        model.addAttribute("combos", combos);
        return "public.store.combo";
    }

    @GetMapping("/combo/detail/{sid}/{comboId}")
    public String loadProductDetail(@PathVariable Integer sid, @PathVariable int comboId, Model model)
    {
        Store store = storeService.findStoreByStoreId(sid);
        Combo combo = comboService.getComboById(comboId);
        List<Combo> comboList = comboService.getListComboByStore(store);
        combo.setView(combo.getView() + 1);
        comboService.save(combo);
        List<Category> categoryList = categoryService.getListCategoryByStore(store);
        model.addAttribute("comboList", comboList);
        model.addAttribute("store", store);
        model.addAttribute("combo", combo);
        model.addAttribute("categoryList", categoryList);
        return "public.store.combo.detail";
    }

}
