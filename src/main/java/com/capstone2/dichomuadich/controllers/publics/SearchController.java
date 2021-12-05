package com.capstone2.dichomuadich.controllers.publics;

import com.capstone2.dichomuadich.models.Search;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class SearchController {

    @GetMapping("/search")
    public String searchItems(@RequestBody Search search)
    {
        return "redirect:/store/product/2";
    }
}
