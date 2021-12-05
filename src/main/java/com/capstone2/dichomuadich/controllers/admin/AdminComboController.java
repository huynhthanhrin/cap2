package com.capstone2.dichomuadich.controllers.admin;

import com.capstone2.dichomuadich.constant.CommonConstants;
import com.capstone2.dichomuadich.domain.*;
import com.capstone2.dichomuadich.services.ComboService;
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
@RequestMapping("admin/combo")
public class AdminComboController {

    @Autowired
    ComboService comboService;

    @Autowired
    MessageSource messageSource;

    @GetMapping("/index")
    public String loadComboManage(Model model, HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("userLogin");
        List<Combo> listCombo = comboService.getListComboByStore(user.getStore());
        model.addAttribute("listCombo", listCombo);
        return "admin.combo.index";
    }

    @PostMapping("add")
    public String addStore(@ModelAttribute("combo") Combo combo,@RequestParam("file") MultipartFile file, HttpServletRequest request, RedirectAttributes rd) throws IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("userLogin");
        String fileNames = "";
        if (file != null) {
            fileNames = FileUtil.upload(file, request);
        }
        Store store = user.getStore();
        combo.setStore(store);
        combo.setImage(fileNames);
        Combo obj = comboService.getComboByStoreAndName(combo.getComboName(),store);
        if (Objects.isNull(obj))
        {
            Combo objSave = comboService.save(combo);
            if (Objects.nonNull(objSave))
            {
                rd.addFlashAttribute(CommonConstants.MSG,
                        messageSource.getMessage("add_success", null, Locale.getDefault()));
                return "redirect:/admin/combo/index";
            } else {
                rd.addFlashAttribute(CommonConstants.MSG,
                        messageSource.getMessage("add_error", null, Locale.getDefault()));
                return "redirect:/admin/combo/index?error=yes";
            }
        } else {
            rd.addFlashAttribute(CommonConstants.MSG,
                    messageSource.getMessage("add_error", null, Locale.getDefault()));
            return "redirect:/admin/combo/index?error=yes";
        }
    }

    @PostMapping("update/{comboId}")
    public String updateStore(@ModelAttribute("combo") Combo combo,@PathVariable int comboId, HttpServletRequest request, RedirectAttributes rd,@RequestParam("file") MultipartFile file) throws IOException {
        combo.setComboId(comboId);
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("userLogin");
        combo.setStore(user.getStore());
        String fileNames = "";
        if (!file.isEmpty()) {
            fileNames = FileUtil.upload(file, request);
        } else {
            fileNames = comboService.getComboById(comboId).getImage();
        }
        combo.setImage(fileNames);
        String nameItemCurrent = comboService.getComboById(comboId).getComboName();

        if (nameItemCurrent.equalsIgnoreCase(combo.getComboName())) {
            Combo objSave = comboService.save(combo);
            if (Objects.nonNull(objSave))
            {
                rd.addFlashAttribute(CommonConstants.MSG,
                        messageSource.getMessage("edit_success", null, Locale.getDefault()));
                return "redirect:/admin/combo/index";
            } else {
                rd.addFlashAttribute(CommonConstants.MSG,
                        messageSource.getMessage("edit_error", null, Locale.getDefault()));
                return "redirect:/admin/combo/index?error=yes";
            }
        } else {
            Combo checkExist = comboService.getComboByStoreAndName(combo.getComboName(), user.getStore());
            if (Objects.isNull(checkExist)) {
                Combo objCombo = comboService.save(combo);
                if (Objects.nonNull(objCombo))
                {
                    rd.addFlashAttribute(CommonConstants.MSG,
                            messageSource.getMessage("edit_success", null, Locale.getDefault()));
                    return "redirect:/admin/combo/index";
                } else {
                    rd.addFlashAttribute(CommonConstants.MSG,
                            messageSource.getMessage("edit_error", null, Locale.getDefault()));
                    return "redirect:/admin/combo/index?error=yes";
                }
            } else {
                rd.addFlashAttribute(CommonConstants.MSG,
                        messageSource.getMessage("edit_error", null, Locale.getDefault()));
                return "redirect:/admin/combo/index?error=yes";
            }

        }
    }
    @PostMapping("/del/{comboId}")
    public String delete(HttpServletRequest request, @PathVariable int comboId, RedirectAttributes rd)
    {
        comboService.delete(comboId);
        rd.addFlashAttribute(CommonConstants.MSG,
                messageSource.getMessage("del_success", null, Locale.getDefault()));
        return "redirect:/admin/combo/index";
    }
}
