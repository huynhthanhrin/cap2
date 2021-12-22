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
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
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
        List<Store> foodStore = (List<Store>) storeList.stream().filter(store -> store.getStoreType() == 1 && store.getStatus() == 1).collect(Collectors.toList());
        List<Store> medicineSore = (List<Store>) storeList.stream().filter(store -> store.getStoreType() == 2 && store.getStatus() == 1).collect(Collectors.toList());
        model.addAttribute("storeList", storeList);
        model.addAttribute("foodStores", foodStore);
        model.addAttribute("medicineStores", medicineSore);
    }

    @GetMapping({"/product/{sid}", "/product/{sid}/{cid}"})
    public String loadProductByStore(@PathVariable Integer sid, @PathVariable(name = "cid", required = false) Integer cid, Model model,
                                     @RequestParam("page") Optional<Integer> page)
    {
        Store store = storeService.findStoreByStoreId(sid);
        List<Category> categoryList = categoryService.getListCategoryByStore(store);
        Pageable pageable = PageRequest.of(page.orElse(0), 10);
        Page<Items>  itemsList = cid == null ? productService.getListItems(store,pageable) : productService.getItemsByStoreAndCategory(store, categoryService.getCategoryById(cid),pageable);
        List<Items> itemsListAll = productService.getListItemsByStore(store);

        int numberPage = 0;
        if(cid == null){
            numberPage = itemsListAll.size() / 10;
            if (itemsListAll.size() % 10 != 0){
                numberPage = numberPage +1;
            }
        } else {
            List<Items> itemsCategoryListAll = productService.getItemsByStoreAndCategory(store,categoryService.getCategoryById(cid));
            numberPage = itemsCategoryListAll.size() / 2;
            if (itemsCategoryListAll.size() % 2 != 0){
                numberPage = numberPage +1;
            }
        }
        List<Items> itemSize = itemsListAll.stream().limit(numberPage).collect(Collectors.toList());
        model.addAttribute("store", store);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("cat", cid != null ? categoryService.getCategoryById(cid) : null);
        model.addAttribute("itemsList", itemsList);
        model.addAttribute("size", itemsListAll);
        model.addAttribute("itemSize", itemSize);
        model.addAttribute("numberPage",page.orElse(0).intValue());
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
