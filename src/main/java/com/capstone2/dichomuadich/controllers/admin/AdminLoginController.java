package com.capstone2.dichomuadich.controllers.admin;

import com.capstone2.dichomuadich.domain.User;
import com.capstone2.dichomuadich.services.UserService;
import com.capstone2.dichomuadich.utils.AuthenticateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("admin")
public class AdminLoginController {

    private static final String SPRING_SECURITY_CONTEXT = "SPRING_SECURITY_CONTEXT";

    @Autowired
    UserService userService;

    /**
     * TODO: Field description
     */
    @Autowired
    PasswordEncoder passwordEncoder;

    @GetMapping("/login")
    public String loadLoginPage() {
        System.out.println(passwordEncoder.encode("123456789"));
//        if (AuthenticateUtil.isAuthenticated(request))
//        {
//            return "redirect:/admin/index";
//        }
        return "admin.login";
    }

//    /**
//     * TODO: Method description
//     *
//     * @param request
//     * @return
//     */
//    @PostMapping("login")
//    public String login(HttpServletRequest request, RedirectAttributes redirectAttributes) {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        User user = userService.findByUsername(username);
//
//        if (user == null || !AuthenticateUtil.hasAdminAccess(user) || !passwordEncoder.matches(password, user.getPassword())) {
//            redirectAttributes.addAttribute("err", "Wrong username or password");
//            return "redirect:/admin/login";
//        }
//
//        HttpSession session = request.getSession();
//        session.removeAttribute(SPRING_SECURITY_CONTEXT);
//        session.setAttribute("user", user);
//        return "redirect:/admin/index";
//    }

    /**
     *
     * @param request
     * @return
     */
    @GetMapping("logout")
    public String logout(HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        return "redirect:/admin/login";
    }
}
