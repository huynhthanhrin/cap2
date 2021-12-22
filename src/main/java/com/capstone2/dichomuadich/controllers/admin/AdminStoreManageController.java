package com.capstone2.dichomuadich.controllers.admin;

import com.capstone2.dichomuadich.constant.CommonConstants;
import com.capstone2.dichomuadich.domain.Store;
import com.capstone2.dichomuadich.domain.User;
import com.capstone2.dichomuadich.domain.Wards;
import com.capstone2.dichomuadich.services.StoreService;
import com.capstone2.dichomuadich.services.UserService;
import com.capstone2.dichomuadich.services.WardsService;
import com.capstone2.dichomuadich.utils.FileUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.fileupload.FileUpload;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

@Controller
@RequestMapping("admin/store")
@Slf4j
public class AdminStoreManageController {

    @Autowired
    StoreService storeService;

    @Autowired
    WardsService wardsService;

    @Autowired
    MessageSource messageSource;

    @Autowired
    UserService userService;

    @GetMapping("/index")
    public String loadStoreManage(Model model, HttpServletRequest request)
    {
        List<Store> storeList = storeService.getAll();
        List<Wards> wardsList = wardsService.findAll();
        model.addAttribute("storeList", storeList);
        model.addAttribute("wardsList", wardsList);
        return "admin.store.index";
    }

    @PostMapping("add")
    public String addStore(@ModelAttribute("store") Store store, @RequestParam("file") MultipartFile file,
                           @RequestParam("wardId") int wardId, HttpServletRequest request,
                           @RequestParam("storeType") int storeType, Model model, RedirectAttributes rd) throws IOException {
        String fileNames = "";
        if (file != null) {
            fileNames = FileUtil.upload(file, request);
        }
        store.setLogo(fileNames);

        Wards wards = wardsService.findWardByWardsId(wardId);
        store.setWards(wards);
        store.setStoreType(storeType);
        store.setStatus(1);

        Store existStore = storeService.findByStoreName(store.getStoreName());
        if (Objects.isNull(existStore))
        {
            Store storeSave = storeService.save(store);
            if (Objects.nonNull(storeSave))
            {
                rd.addFlashAttribute(CommonConstants.MSG,
                        messageSource.getMessage("add_success", null, Locale.getDefault()));
                return "redirect:/admin/store/index";
            } else {
                rd.addFlashAttribute(CommonConstants.MSG,
                        messageSource.getMessage("add_error", null, Locale.getDefault()));
                return "redirect:/admin/store/index?error=yes";
            }
        } else {
            rd.addFlashAttribute(CommonConstants.MSG,
                    messageSource.getMessage("add_error", null, Locale.getDefault()));
            return "redirect:/admin/store/index?error=yes";
        }
    }

    @PostMapping("update/{storeId}")
    public String updateStore(@ModelAttribute("store") Store store, @RequestParam("fileUpdate") MultipartFile file,
                              @RequestParam("wardId") int wardId,@PathVariable int storeId,
                              HttpServletRequest request, Model model, RedirectAttributes rd) throws IOException {
        store.setStoreId(storeId);
        Wards wards = wardsService.findWardByWardsId(wardId);
        store.setWards(wards);

        String fileNames = "";
        System.out.println(file);
        if (!file.getOriginalFilename().isEmpty()) {
            FileUtil.delete(fileNames, request);
            fileNames = FileUtil.upload(file, request);
        } else {
            fileNames = storeService.findStoreByStoreId(storeId).getLogo();
        }
        store.setLogo(fileNames);
        store.setStatus(1);

        String nameStoreCurrent = storeService.findStoreByStoreId(storeId).getStoreName();
        if (nameStoreCurrent.equalsIgnoreCase(store.getStoreName())) {
            Store storeSave = storeService.save(store);
            if (Objects.nonNull(storeSave))
            {
                rd.addFlashAttribute(CommonConstants.MSG,
                        messageSource.getMessage("edit_success", null, Locale.getDefault()));
                return "redirect:/admin/store/index";
            } else {
                rd.addFlashAttribute(CommonConstants.MSG,
                        messageSource.getMessage("edit_error", null, Locale.getDefault()));
                return "redirect:/admin/store/index?error=yes";
            }
        } else {
            Store checkExistName = storeService.findByStoreName(store.getStoreName());
            if (Objects.isNull(checkExistName)){
                Store storeSave = storeService.save(store);
                if (Objects.nonNull(storeSave))
                {
                    rd.addFlashAttribute(CommonConstants.MSG,
                            messageSource.getMessage("edit_success", null, Locale.getDefault()));
                    return "redirect:/admin/store/index";
                } else {
                    rd.addFlashAttribute(CommonConstants.MSG,
                            messageSource.getMessage("edit_error", null, Locale.getDefault()));
                    return "redirect:/admin/store/index?error=yes";
                }
            } else {
                rd.addFlashAttribute(CommonConstants.MSG,
                        messageSource.getMessage("edit_error", null, Locale.getDefault()));
                return "redirect:/admin/store/index?error=yes";
            }
        }

    }

    @PostMapping("/del/{storeId}")
    public String delete(HttpServletRequest request, @PathVariable int storeId, RedirectAttributes rd) {
        List<User> userList = userService.findUsersByStore(storeService.findStoreByStoreId(storeId));
        storeService.deactiveStore(storeId);
        //deactive account user of store was deleted
        for (User user : userList)
        {
            userService.updateStatus(0, user.getUserId());
        }

        rd.addFlashAttribute(CommonConstants.MSG,
                messageSource.getMessage("del_success", null, Locale.getDefault()));
        return "redirect:/admin/store/index";
    }
}
