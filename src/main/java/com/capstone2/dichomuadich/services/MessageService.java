package com.capstone2.dichomuadich.services;

public interface MessageService
{
    /**
     * TODO: Method description
     *
     *
     * @param chatId
     * @param senderId
     * @param content
     *
     * @return
     */
    int saveCustom(int chatId, int senderId, String content);

    /**
     * TODO: Method description
     *
     * @param chatId
     *
     */
    void readAllMessageByChat_Id(int chatId);

    /**
     * TODO: Method description
     *
     *
     * @param senderId
     * @param read
     *
     * @return
     */
    Integer countAllBySender_IdAndRead(int senderId, int read);
}


