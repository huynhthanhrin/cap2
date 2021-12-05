package com.capstone2.dichomuadich.controllers.publics;

import com.capstone2.dichomuadich.constant.CommonConstants;
import com.capstone2.dichomuadich.domain.Role;
import com.capstone2.dichomuadich.domain.User;
import com.capstone2.dichomuadich.models.JwtRequest;
import com.capstone2.dichomuadich.models.JwtResponse;
import com.capstone2.dichomuadich.models.RegisterRequest;
import com.capstone2.dichomuadich.models.ResponseAPI;
import com.capstone2.dichomuadich.services.UserService;
import com.capstone2.dichomuadich.services.WardsService;
import com.capstone2.dichomuadich.utils.JwtTokenUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.log4j.Log4j2;
import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

@Log4j2
@RestController
@RequestMapping("api")
@Api(value = "api.user", description = "User API")
public class ApiAuthController {

    @Autowired
    private UserService userService;

    @Autowired
    MessageSource messageSource;

    @Autowired
    JwtTokenUtil jwtTokenUtil;

    @Autowired
    WardsService wardsService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    @Qualifier("customUserDetailsService")
    private UserDetailsService userDetailsService;

    @PostMapping("/login")
    @ApiOperation(value = "Login", response = Object.class)
    public ResponseAPI login(@RequestBody JwtRequest authenticationRequest,
                             HttpServletRequest request,
                             HttpServletResponse response,
                             @RequestHeader(value = "Authorization", required = false, defaultValue = "") String authorization) throws Exception {
        log.info("Call API login");
        User user = userService.findUserByUsernameAndPassword(authenticationRequest.getUsername(), authenticationRequest.getPassword());

        if (user == null) {
            throw new Exception(messageSource.getMessage("api.admin.login.wrong", new String[]{}, null), null);
        }
        if (CommonConstants.DEACTIVE.equals(user.getStatus())) {
            throw new Exception(messageSource.getMessage("api.admin.login.disabled", new String[]{}, null), null);
        }
        Role role = user.getRole();
        final UserDetails userDetails = userDetailsService.loadUserByUsername(authenticationRequest.getUsername());
        final String token = jwtTokenUtil.generateToken(userDetails);

        JwtResponse jwtResponse = new JwtResponse(token);
        String accessToken = jwtResponse.getToken();
        //Update token when login success
        userService.updateToken(accessToken, authenticationRequest.getUsername());
        HashMap resultLogin = new HashMap();
        resultLogin.put("access_token", accessToken);
        user.setPassword("");
        resultLogin.put("user", user);
        resultLogin.put("role", role);
        request.getSession().setAttribute("userInfo", user);
        request.getSession().setAttribute("roles", role);

        ResponseAPI responseAPI = new ResponseAPI(HttpStatus.SC_OK, "OK", resultLogin);
        return responseAPI;

    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ResponseAPI logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        if (session.getAttribute("userInfo") != null) {
            User user = (User) session.getAttribute("userInfo");
            userService.updateToken(null, user.getUsername());
            session.removeAttribute("userInfo");
        }
        if (session.getAttribute("roles") != null) {
            session.removeAttribute("roles");
        }
        ResponseAPI responseAPI = new ResponseAPI(HttpStatus.SC_OK, "OK", null);
        return responseAPI;
    }

    @PostMapping("/register")
    public ResponseAPI register(@RequestBody RegisterRequest registerRequest)
    {
        User user = new User();
        user.setFirstName(registerRequest.getFirstName());
        user.setLastName(registerRequest.getLastName());
        user.setUsername(registerRequest.getUsername());
        user.setPassword(passwordEncoder.encode(registerRequest.getPassword()));
        user.setIdentityCardNumber(registerRequest.getIdentityCardNumber());
        user.setPhoneNumber(registerRequest.getPhoneNumber());
        user.setGender(registerRequest.getGender());
        user.setAddress(registerRequest.getAddress());
        user.setWards(wardsService.findWardByWardsId(registerRequest.getWardId()));
        user.setStatus(1);

        User checkExist = userService.findByUsername(user.getUsername());
        HashMap resultLogin = new HashMap();
        ResponseAPI responseAPI;
        if (Objects.isNull(checkExist))
        {
            User userRegister = userService.save(user);
            resultLogin.put("userRegister", userRegister);
            responseAPI = new ResponseAPI(HttpStatus.SC_OK, "OK", resultLogin);
        } else {
            responseAPI = new ResponseAPI(HttpStatus.SC_CONFLICT, "NOT", resultLogin);
        }


        return responseAPI;
    }
}
