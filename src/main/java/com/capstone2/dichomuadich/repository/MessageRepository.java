package com.capstone2.dichomuadich.repository;

import javax.transaction.Transactional;

import com.capstone2.dichomuadich.domain.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


/**
 * TODO: Interface description
 *
 */
@Repository
public interface MessageRepository extends JpaRepository<Message, Integer>
{
    /**
     * TODO: Method description
     *
     *
     *
     * @param chatId
     * @param senderId
     * @param content
     *
     * @return
     */
    @Query(
        value = "INSERT INTO message(chat_id, sender_id, content) VALUES (?,?,?)",
        nativeQuery = true
    )
    @Modifying(
        clearAutomatically = true,
        flushAutomatically = true
    )
    @Transactional
    int saveCustom(int chatId, int senderId, String content);

    /**
     * TODO: Method description
     *
     * @param chatId
     *
     */
    @Modifying()
    @Query(
        value = "UPDATE message SET `read` = 1 WHERE chat_id=?",
        nativeQuery = true
    )
    @Transactional
    void readAllMessageByChat_Id(int chatId);

    /**
     * TODO: Method description
     *
     * @param senderId
     * @param read
     *
     * @return
     */
    Integer countAllBySender_UserIdAndRead(int senderId, int read);


}


