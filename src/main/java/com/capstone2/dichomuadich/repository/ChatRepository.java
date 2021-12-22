package com.capstone2.dichomuadich.repository;

import com.capstone2.dichomuadich.domain.Chat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface ChatRepository extends JpaRepository<Chat, Integer>
{
    Chat findBySender_UserIdAndReceiver_UserId(int senderId, int receiverId);

    Chat findByReceiver_UserIdAndSender_UserId(int receiverId, int senderId);

    List<Chat> findAllBySender_UserIdOrderByUpdateAtDesc(int senderId);

    Chat findById(int id);

    List<Chat> findAllBySender_UserIdOrReceiver_UserIdOrderByUpdateAtDesc(int senderId, int receiverId);

    @Modifying
    @Query(
        value = "INSERT INTO chat(sender_id, receiver_id) VALUES (:senderId, :receiverId)",
        nativeQuery = true
    )
    @Transactional
    int saveCustom(@Param("senderId") Integer senderId, @Param("receiverId") Integer receiverId);
}

