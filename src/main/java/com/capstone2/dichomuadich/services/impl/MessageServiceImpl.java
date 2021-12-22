package com.capstone2.dichomuadich.services.impl;

import com.capstone2.dichomuadich.repository.MessageRepository;
import com.capstone2.dichomuadich.services.MessageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class MessageServiceImpl implements MessageService
{
    /** TODO: Field description */
    @Autowired
    MessageRepository messageRepository;

    @Override
    public int saveCustom(int chatId, int senderId, String content)
    {
        try
        {
            return messageRepository.saveCustom(chatId, senderId, content);
        }
        catch (Exception e)
        {
            log.error("Có lỗi xảy ra tại [saveCustom]", e);
        }
        return 0;
    }

    @Override
    public void readAllMessageByChat_Id(int chatId)
    {
        try
        {
            messageRepository.readAllMessageByChat_Id(chatId);
        }
        catch (Exception e)
        {
            log.error("Có lỗi xảy ra tại [readAllMessageByChat_Id]", e);
        }
    }

    @Override
    public Integer countAllBySender_IdAndRead(int senderId, int read)
    {
        try
        {
            return messageRepository.countAllBySender_UserIdAndRead(senderId, read);
        }
        catch (Exception e)
        {
            log.error("Có lỗi xảy ra tại [countAllBySender_IdAndRead]", e);
        }
        return null;
    }
}


