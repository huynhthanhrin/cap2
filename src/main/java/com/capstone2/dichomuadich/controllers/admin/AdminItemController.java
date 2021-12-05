package com.capstone2.dichomuadich.controllers.admin;

import com.capstone2.dichomuadich.constant.CommonConstants;
import com.capstone2.dichomuadich.domain.*;
import com.capstone2.dichomuadich.services.impl.CategoryServiceImpl;
import com.capstone2.dichomuadich.services.impl.ProductServiceImpl;
import com.capstone2.dichomuadich.services.impl.StoreServiceImpl;
import com.capstone2.dichomuadich.utils.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

@Controller
@RequestMapping("admin/product")
public class AdminItemController {

    @Autowired
    MessageSource messageSource;

    @Autowired
    ProductServiceImpl productService;

    @Autowired
    CategoryServiceImpl categoryService;

    @Autowired
    StoreServiceImpl storeService;

    @GetMapping("/index")
    public String index( HttpServletRequest request,Model model)
    {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("userLogin");
        List<Items> listItems = productService.getListItems(user.getStore());
        List<Category> listCategorys = categoryService.getListCategoryByStore(user.getStore());
        model.addAttribute("listProducts", listItems);
        model.addAttribute("listCategorys", listCategorys);
        return "admin.product.index";
    }

    @PostMapping("add")
    public String addItem(@ModelAttribute("store") Items item, @RequestParam("file") MultipartFile file,
                           @RequestParam("categoryId") int categoryId, HttpServletRequest request, Model model, RedirectAttributes rd) throws IOException {
        String fileNames = "";
        if (file != null) {
            fileNames = FileUtil.upload(file, request);
        }
        item.setImage(fileNames);

        Category category = categoryService.getCategoryById(categoryId);
        item.setCategory(category);

        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("userLogin");

        Store store = storeService.findStoreByStoreId(user.getStore().getStoreId());

        item.setStore(store);

        Items existItems = productService.checkItemsExist(item.getItemName(), user.getStore());
        if (Objects.isNull(existItems))
        {
            Items itemsObj = productService.save(item);
            if (Objects.nonNull(itemsObj))
            {
                rd.addFlashAttribute(CommonConstants.MSG,
                        messageSource.getMessage("add_success", null, Locale.getDefault()));
                return "redirect:/admin/product/index";
            } else {
                rd.addFlashAttribute(CommonConstants.MSG,
                        messageSource.getMessage("add_error", null, Locale.getDefault()));
                return "redirect:/admin/product/index?error=yes";
            }
        } else {
            rd.addFlashAttribute(CommonConstants.MSG,
                    messageSource.getMessage("existed_nameItems", null, Locale.getDefault()));
            return "redirect:/admin/product/index?error=yes";

        }
    }

    @PostMapping("update/{itemsId}")
    public String updateStore(@ModelAttribute("store") Items item, @RequestParam("file") MultipartFile file,
                              @RequestParam("categoryId") int categoryId ,@PathVariable int itemsId,
                              HttpServletRequest request, Model model, RedirectAttributes rd) throws IOException {
        item.setItemsId(itemsId);

        Category category = categoryService.getCategoryById(categoryId);
        item.setCategory(category);

        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("userLogin");
        Store store = storeService.findStoreByStoreId(user.getStore().getStoreId());
        item.setStore(store);

        String fileNames = "";
        if (!file.isEmpty()) {
            fileNames = FileUtil.upload(file, request);
        } else {
            fileNames = productService.findItemById(itemsId).getImage();
        }
        item.setImage(fileNames);

        String nameItemCurrent = productService.findItemById(itemsId).getItemName();

        if (nameItemCurrent.equalsIgnoreCase(item.getItemName())) {
            Items itemsObj = productService.save(item);
            if (Objects.nonNull(itemsObj))
            {
                rd.addFlashAttribute(CommonConstants.MSG,
                        messageSource.getMessage("edit_success", null, Locale.getDefault()));
                return "redirect:/admin/product/index";
            } else {
                rd.addFlashAttribute(CommonConstants.MSG,
                        messageSource.getMessage("edit_error", null, Locale.getDefault()));
                return "redirect:/admin/product/index?error=yes";
            }
        } else {
            Items checkExist = productService.checkItemsExist(item.getItemName(),user.getStore());
            if (Objects.isNull(checkExist)) {
                Items itemsObj = productService.save(item);
                if (Objects.nonNull(itemsObj))
                {
                    rd.addFlashAttribute(CommonConstants.MSG,
                            messageSource.getMessage("edit_success", null, Locale.getDefault()));
                    return "redirect:/admin/product/index";
                } else {
                    rd.addFlashAttribute(CommonConstants.MSG,
                            messageSource.getMessage("edit_error", null, Locale.getDefault()));
                    return "redirect:/admin/product/index?error=yes";
                }
            } else {
                rd.addFlashAttribute(CommonConstants.MSG,
                        messageSource.getMessage("edit_error", null, Locale.getDefault()));
                return "redirect:/admin/product/index?error=yes";
            }

        }


    }

    @PostMapping("/del/{itemsId}")
    public String delete(HttpServletRequest request, @PathVariable int itemsId, RedirectAttributes rd)
    {
        productService.delete(itemsId);
        rd.addFlashAttribute(CommonConstants.MSG,
                messageSource.getMessage("del_success", null, Locale.getDefault()));
        return "redirect:/admin/product/index";
    }
}
