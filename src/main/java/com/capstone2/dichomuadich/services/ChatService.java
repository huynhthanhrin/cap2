package com.capstone2.dichomuadich.services;

import com.capstone2.dichomuadich.domain.Chat;

import java.util.List;

public interface ChatService
{
    /**
     * TODO: Method description
     *
     * @param senderId
     * @param receiverId
     *
     * @return
     */
    Chat findBySender_IdAndReceiver_Id(int senderId, int receiverId);

    /**
     * TODO: Method description
     *
     * @param receiverId
     * @param senderId
     *
     * @return
     */
    Chat findByReceiver_IdAndSender_Id(int receiverId, int senderId);

    /**
     * TODO: Method description
     *
     * @param senderId
     * @param receiverId
     *
     * @return
     */
    Chat findByReceiverAndSender(int senderId, int receiverId);

    /**
     * TODO: Method description
     *
     *
     * @param senderId
     *
     * @return
     */
    List<Chat> findAllBySender_IdOrderByUpdateAtDesc(int senderId);

    /**
     * TODO: Method description
     *
     * @param id
     *
     * @return
     */
    Chat findById(int id);

    /**
     * TODO: Method description
     *
     *
     * @param senderId
     * @param receiverId
     *
     * @return
     */
    List<Chat> findAllBySender_IdOrReceiver_IdOrderByUpdateAtDesc(int senderId, int receiverId);

    /**
     * TODO: Method description
     *
     *
     * @param senderId
     * @param receiverId
     *
     * @return
     */
    int saveCustom(int senderId, int receiverId);

    /**
     * TODO: Method description
     *
     * @param chat
     *
     * @return
     */
    Chat save(Chat chat);
}
