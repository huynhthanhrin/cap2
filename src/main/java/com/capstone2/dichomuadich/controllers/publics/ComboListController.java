package com.capstone2.dichomuadich.controllers.publics;

import com.capstone2.dichomuadich.domain.Category;
import com.capstone2.dichomuadich.domain.Combo;
import com.capstone2.dichomuadich.domain.Items;
import com.capstone2.dichomuadich.domain.Store;
import com.capstone2.dichomuadich.services.CategoryService;
import com.capstone2.dichomuadich.services.ComboService;
import com.capstone2.dichomuadich.services.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

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
    public String loadProductByStore(@PathVariable Integer sid, Model model, @RequestParam("page") Optional<Integer> page)
    {
        Store store = storeService.findStoreByStoreId(sid);
        List<Category> categoryList = categoryService.getListCategoryByStore(store);
        Pageable pageable = PageRequest.of(page.orElse(0), 10);
        List<Combo> comboList = comboService.getListComboByStore(store);
        Page<Combo> combos = comboService.getListComboByStore(store,pageable);
        int numberPage = 0;
        numberPage = comboList.size() / 10;
        if (comboList.size() % 10 != 0){
            numberPage = numberPage +1;
        }
        List<Combo> comboSize = comboList.stream().limit(numberPage).collect(Collectors.toList());
        model.addAttribute("store", store);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("combos", combos);
        model.addAttribute("comboSize", comboSize);
        model.addAttribute("numberPage",page.orElse(0).intValue());
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
