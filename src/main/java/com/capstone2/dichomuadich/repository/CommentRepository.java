package com.capstone2.dichomuadich.repository;

import com.capstone2.dichomuadich.domain.Comment;
import com.capstone2.dichomuadich.domain.Items;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment,Integer> {

    List<Comment> findCommentByItems(Items items);
}
