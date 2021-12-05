package com.capstone2.dichomuadich.utils;

import com.capstone2.dichomuadich.details.CustomUserDetails;
import com.capstone2.dichomuadich.domain.User;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class AuthenticateUtil {
    private static final String SPRING_SECURITY_CONTEXT = "SPRING_SECURITY_CONTEXT";
    private static final String ADMIN = "ADMIN";
    private static final String STORE_MANAGER = "STORE MANAGER";
    private static final String WARD_MANAGER = "WARD MANAGER";
    private static final String USER = "USER";

    /**
     * TODO: Method description
     *
     * @param request
     * @return
     */
    public static boolean isAuthenticated(HttpServletRequest request) {
        HttpSession session = request.getSession();
        SecurityContext sc = (SecurityContextImpl) session.getAttribute(SPRING_SECURITY_CONTEXT);
        if (sc != null) {
            return sc.getAuthentication().isAuthenticated();
        }
        return false;
    }

    /**
     * TODO: Method description
     *
     * @param user
     * @return
     */
    public static boolean hasAdminAccess(User user) {
        try {
            return ADMIN.equals(user.getRole().getRoleName()) || STORE_MANAGER.equals(user.getRole().getRoleName()) || WARD_MANAGER.equals(user.getRole().getRoleName());
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * TODO: Method description
     *
     * @param user
     * @return
     */
    public static boolean isAdmin(User user) {
        try {
            return ADMIN.equals(user.getRole().getRoleName());
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * TODO: Method description
     *
     * @param user
     * @return
     */
    public static boolean isStoreManager(User user) {
        try {
            return STORE_MANAGER.equals(user.getRole().getRoleName());
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * TODO: Method description
     *
     * @param user
     * @return
     */
    public static boolean isWardManager(User user) {
        try {
            return WARD_MANAGER.equals(user.getRole().getRoleName());
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * TODO: Method description
     *
     * @param user
     * @return
     */
    public static boolean isUser(User user) {
        try {
            return USER.equals(user.getRole().getRoleName());
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * TODO: Method description
     *
     * @param request
     * @return
     */
    public static User getUserAuthenticated(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            CustomUserDetails customUserDetails = (CustomUserDetails) ((SecurityContextImpl) session.getAttribute(SPRING_SECURITY_CONTEXT)).getAuthentication().getPrincipal();
            return customUserDetails.getUser();
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * TODO: Method description
     *
     * @param request
     * @return
     */
    public static User getUserFromSession(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            return (User) session.getAttribute("user");
        } catch (Exception e) {
            return null;
        }
    }

}
