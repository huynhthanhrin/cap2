package com.capstone2.dichomuadich.controllers.publics;

import com.capstone2.dichomuadich.domain.Comment;
import com.capstone2.dichomuadich.domain.Items;
import com.capstone2.dichomuadich.domain.User;
import com.capstone2.dichomuadich.services.CommentService;
import com.capstone2.dichomuadich.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Objects;

@Controller
public class CommentController {

    @Autowired
    CommentService commentService;

    @Autowired
    ProductService productService;

    @PostMapping("/user/comment")
    public @ResponseBody Comment postComment(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("userInfo");

        Comment comment1 = new Comment();

        if (Objects.isNull(user)) {
            return comment1;
        } else {
            String comment = request.getParameter("comment");
            String itemsId = request.getParameter("itemsId");
            Items items = productService.findItemById(Integer.parseInt(itemsId));
            Comment commentObj = new Comment();
            commentObj.setComment(comment);
            commentObj.setUser(user);
            commentObj.setItems(items);
            return commentService.save(commentObj);
        }
    }
}
