package com.capstone2.dichomuadich.controllers.publics;

import com.capstone2.dichomuadich.domain.Category;
import com.capstone2.dichomuadich.domain.Comment;
import com.capstone2.dichomuadich.domain.Items;
import com.capstone2.dichomuadich.domain.Store;
import com.capstone2.dichomuadich.services.CategoryService;
import com.capstone2.dichomuadich.services.CommentService;
import com.capstone2.dichomuadich.services.ProductService;
import com.capstone2.dichomuadich.services.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("store")
public class ProductListController {

    @Autowired
    CategoryService categoryService;

    @Autowired
    StoreService storeService;

    @Autowired
    ProductService productService;

    @Autowired
    CommentService commentService;

    @ModelAttribute
    public void addModel(Model model)
    {
        List<Store> storeList = storeService.getAll();
        List<Store> foodStore = (List<Store>) storeList.stream().filter(store -> store.getStoreType() == 1).collect(Collectors.toList());
        List<Store> medicineSore = (List<Store>) storeList.stream().filter(store -> store.getStoreType() == 2).collect(Collectors.toList());
        model.addAttribute("storeList", storeList);
        model.addAttribute("foodStores", foodStore);
        model.addAttribute("medicineStores", medicineSore);
    }

    @GetMapping({"/product/{sid}", "/product/{sid}/{cid}"})
    public String loadProductByStore(@PathVariable Integer sid, @PathVariable(name = "cid", required = false) Integer cid, Model model)
    {
        Store store = storeService.findStoreByStoreId(sid);
        List<Category> categoryList = categoryService.getListCategoryByStore(store);
        List<Items> itemsList = new ArrayList<>();
        itemsList = cid == null ? productService.getListItems(store) : productService.getItemsByStoreAndCategory(store, categoryService.getCategoryById(cid));

        model.addAttribute("store", store);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("cat", cid != null ? categoryService.getCategoryById(cid) : null);
        model.addAttribute("itemsList", itemsList);
        return "public.store.product";
    }

    @GetMapping("/product/detail/{sid}/{pid}")
    public String loadProductDetail(@PathVariable Integer sid, @PathVariable int pid, Model model)
    {
        Store store = storeService.findStoreByStoreId(sid);
        Items item = productService.findItemById(pid);
        item.setView(item.getView() + 1);
        productService.save(item);
        List<Comment> comments = commentService.getComments(item);
        List<Category> categoryList = categoryService.getListCategoryByStore(store);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("store", store);
        model.addAttribute("item", item);
        model.addAttribute("comments", comments);

        return "public.store.product.detail";
    }
}
