package com.capstone2.dichomuadich.controllers;

import com.capstone2.dichomuadich.constant.CommonConstants;
import com.capstone2.dichomuadich.domain.Category;
import com.capstone2.dichomuadich.domain.Store;
import com.capstone2.dichomuadich.domain.User;
import com.capstone2.dichomuadich.services.CategoryService;
import com.capstone2.dichomuadich.services.impl.CategoryServiceImpl;
import com.capstone2.dichomuadich.services.impl.StoreServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

@Controller
@RequestMapping("admin")
public class AdminCategoryController {

    @Autowired
    CategoryService categoryService;

    @Autowired
    StoreServiceImpl storeService;

    @Autowired
    MessageSource messageSource;

    @GetMapping("/category")
    public ModelAndView index(String msg,HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("userLogin");
        ModelAndView mv = new ModelAndView("admin.category");
        List<Category> listCategory = categoryService.getListCategoryByStore(user.getStore());
        mv.addObject("listCategory", listCategory);
        mv.addObject(CommonConstants.MSG,msg);
        return mv;
    }

    @PostMapping("/category/add")
    public ModelAndView add(HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("userLogin");
        ModelAndView mv = new ModelAndView("redirect:/admin/category");
        Category category = new Category();
        String nameCat = request.getParameter("nameCategory");
        String description = request.getParameter("description");
        Store store = storeService.findStoreByStoreId(user.getStore().getStoreId());
        category.setCatName(nameCat);
        category.setStore(store);
        category.setDescription(description);
        Category objCheck = categoryService.checkExistCategory(nameCat, store);
        if (Objects.isNull(objCheck)) {
            Category obj = categoryService.save(category);
            if (!Objects.isNull(obj)) {
                mv.addObject(CommonConstants.MSG,messageSource.getMessage("message_success", null, Locale.getDefault()));
            } else {
                mv.addObject(CommonConstants.MSG,messageSource.getMessage("message_err", null, Locale.getDefault()));
            }
        } else {
            mv.addObject(CommonConstants.MSG,messageSource.getMessage("message_err", null, Locale.getDefault()));
        }
        return mv;
    }

    @PostMapping("/category/delete")
    public ModelAndView delete(HttpServletRequest request)
    {
        ModelAndView mv = new ModelAndView("redirect:/admin/category");
        Integer id = Integer.parseInt(request.getParameter("id"));
        categoryService.delete(id);
        mv.addObject(CommonConstants.MSG,messageSource.getMessage("message_success", null, Locale.getDefault()));
        return mv;
    }

    @PostMapping("/category/update/{categoryId}")
    public ModelAndView delete(HttpServletRequest request, @PathVariable int categoryId)
    {
        ModelAndView mv = new ModelAndView("redirect:/admin/category");
        String nameCategory = request.getParameter("nameCategory");
        String description = request.getParameter("description");

        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("userLogin");
        Store store = storeService.findStoreByStoreId(user.getStore().getStoreId());

        Category category = new Category();
        category.setCatName(nameCategory);
        category.setCatId(categoryId);
        category.setDescription(description);
        category.setStore(store);

        String nameCategoryCurrent = categoryService.getCategoryById(categoryId).getCatName();
        if (nameCategoryCurrent.equalsIgnoreCase(nameCategory)) {
            categoryService.save(category);
            mv.addObject(CommonConstants.MSG,messageSource.getMessage("message_success", null, Locale.getDefault()));
        } else {
            Category checkExistName = categoryService.checkExistCategory(nameCategory, store);
            if (Objects.isNull(checkExistName)){
                categoryService.save(category);
                mv.addObject(CommonConstants.MSG,messageSource.getMessage("message_success", null, Locale.getDefault()));
            } else {
                mv.addObject(CommonConstants.MSG,messageSource.getMessage("message_err", null, Locale.getDefault()));
            }
        }

        return mv;
    }
}
