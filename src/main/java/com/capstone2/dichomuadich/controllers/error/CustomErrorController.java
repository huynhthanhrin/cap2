package com.capstone2.dichomuadich.controllers.error;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * TODO: Class description
 */
@Controller
public class CustomErrorController implements ErrorController {
    private static final String PATH = "/error";

    /**
     * TODO: Method description
     *
     * @return
     */
    @RequestMapping(value = PATH)
    public String error() {
        return "error.404";
    }
}

