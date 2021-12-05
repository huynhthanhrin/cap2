package com.capstone2.dichomuadich.controllers.admin;

import com.capstone2.dichomuadich.constant.CommonConstants;
import com.capstone2.dichomuadich.domain.Role;
import com.capstone2.dichomuadich.domain.Store;
import com.capstone2.dichomuadich.domain.User;
import com.capstone2.dichomuadich.domain.Wards;
import com.capstone2.dichomuadich.services.RoleService;
import com.capstone2.dichomuadich.services.StoreService;
import com.capstone2.dichomuadich.services.UserService;
import com.capstone2.dichomuadich.services.WardsService;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("admin/user")
public class AdminUserController {

    @Autowired
    RoleService roleService;

    @Autowired
    UserService userService;

    @Autowired
    StoreService storeService;

    @Autowired
    WardsService wardsService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    MessageSource messageSource;

    @GetMapping("/index/{rid}")
    public String loadUser(@PathVariable int rid, Model model)
    {
        Role role = roleService.findRoleByRoleId(rid);
        List<User> users = userService.findUsersByRole(role);
        model.addAttribute("users", users);
        model.addAttribute("role", role);
        return "admin.user.index";

    }

    @PostMapping("add/{rid}")
    public String addUser(@ModelAttribute("user") User user, @RequestParam(name = "storeId", required = false) Integer storeId,
                          @RequestParam(name = "wardId", required = false) Integer wardId,
                          @PathVariable int rid, RedirectAttributes rd)
    {
        User userExist = userService.findByUsername(user.getUsername());
        if (Objects.isNull(userExist))
        {
            if (Objects.nonNull(storeId))
            {
                Store store = storeService.findStoreByStoreId(storeId);
                user.setStore(store);
            }
            if (Objects.nonNull(wardId))
            {
                Wards wards = wardsService.findWardByWardsId(wardId);
                user.setWards(wards);
            }
            String passwordEncode = passwordEncoder.encode("covid19");
            if(!user.getPassword().isEmpty())
            {
                passwordEncode = passwordEncoder.encode(user.getPassword());
            }
            user.setPassword(passwordEncode);

            // 1 - user is active after create
            user.setStatus(1);
            Role role = roleService.findRoleByRoleId(rid);
            user.setRole(role);
            User userSave = userService.save(user);
            if (Objects.nonNull(userSave))
            {
                rd.addFlashAttribute(CommonConstants.MSG,
                        messageSource.getMessage("add_success", null, Locale.getDefault()));
                return "redirect:/admin/user/index/" + rid;
            } else {
                rd.addFlashAttribute(CommonConstants.MSG,
                        messageSource.getMessage("add_error", null, Locale.getDefault()));
                return "redirect:/admin/user/index/" + rid + "?error=yes";
            }
        } else {
            rd.addFlashAttribute(CommonConstants.MSG,
                    messageSource.getMessage("existed_username", null, Locale.getDefault()));
            return "redirect:/admin/user/index/" + rid + "?error=yes";
        }
    }

    @PostMapping("/del/{uid}")
    public String delUser(@PathVariable int uid, RedirectAttributes rd)
    {
        int roleId = userService.findUserByUserId(uid).getRole().getRoleId();
        userService.delete(uid);
        rd.addFlashAttribute(CommonConstants.MSG,
                messageSource.getMessage("del_success", null, Locale.getDefault()));
        return "redirect:/admin/user/index/" + roleId;
    }

    @PostMapping("/update/{uid}")
    public String updateUser(@ModelAttribute("user") User user, @PathVariable int uid, @RequestParam(name = "storeId", required = false) Integer storeId,
                             @RequestParam(name = "wardId", required = false) Integer wardId, RedirectAttributes rd,
                             HttpServletRequest request) throws ParseException {
        String dateStr = request.getParameter("birthday");
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date dob = null;

        User userDb = userService.findUserByUserId(uid);
        try {
            dob = df.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        user.setDateOfBirth(dob);
        int rid = userDb.getRole().getRoleId();
        User userExist = null;
        if (!user.getUsername().equals(userDb.getUsername()))
        {
            userExist = userService.findByUsername(user.getUsername());
        }
        if (Objects.isNull(userExist))
        {
            if (Objects.nonNull(storeId))
            {
                Store store = storeService.findStoreByStoreId(storeId);
                user.setStore(store);
            }
            if (Objects.nonNull(wardId))
            {
                Wards wards = wardsService.findWardByWardsId(wardId);
                user.setWards(wards);
            }

            if(user.getPassword() != null && !user.getPassword().isEmpty())
            {

                user.setPassword(passwordEncoder.encode(user.getPassword()));
            } else {
                user.setPassword(userDb.getPassword());
            }


            // 1 - user is active after create
            user.setStatus(1);
            user.setUserId(uid);
            Role role = roleService.findRoleByRoleId(rid);
            user.setRole(role);
            User userSave = userService.save(user);
            if (Objects.nonNull(userSave))
            {
                rd.addFlashAttribute(CommonConstants.MSG,
                        messageSource.getMessage("update_success", null, Locale.getDefault()));
                return "redirect:/admin/user/index/" + rid;
            } else {
                rd.addFlashAttribute(CommonConstants.MSG,
                        messageSource.getMessage("update_failed", null, Locale.getDefault()));
                return "redirect:/admin/user/index/" + rid + "?error=yes";
            }
        } else {
            rd.addFlashAttribute(CommonConstants.MSG,
                    messageSource.getMessage("existed_username", null, Locale.getDefault()));
            return "redirect:/admin/user/index/" + rid + "?error=yes";
        }
    }

}
