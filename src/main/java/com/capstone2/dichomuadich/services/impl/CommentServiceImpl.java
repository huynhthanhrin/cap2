package com.capstone2.dichomuadich.services.impl;

import com.capstone2.dichomuadich.domain.Comment;
import com.capstone2.dichomuadich.domain.Items;
import com.capstone2.dichomuadich.repository.ComboRepository;
import com.capstone2.dichomuadich.repository.CommentRepository;
import com.capstone2.dichomuadich.services.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    CommentRepository commentRepository;

    @Override
    public Comment save(Comment comment) {
        return commentRepository.save(comment);
    }

    @Override
    public List<Comment> getComments(Items items) {
        return commentRepository.findCommentByItems(items);
    }
}
