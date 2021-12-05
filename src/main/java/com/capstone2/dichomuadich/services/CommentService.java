package com.capstone2.dichomuadich.services;

import com.capstone2.dichomuadich.domain.Comment;
import com.capstone2.dichomuadich.domain.Items;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CommentService {

    Comment save(Comment comment);

    List<Comment> getComments(Items items);
}
