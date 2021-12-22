package com.capstone2.dichomuadich.services.impl;

import com.capstone2.dichomuadich.domain.Chat;
import com.capstone2.dichomuadich.repository.ChatRepository;
import com.capstone2.dichomuadich.services.ChatService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
@Slf4j
public class ChatServiceImpl implements ChatService
{
    /** TODO: Field description */
    @Autowired
    ChatRepository chatRepository;

    @Override
    public Chat findBySender_IdAndReceiver_Id(int senderId, int receiverId)
    {
        try
        {
            return chatRepository.findBySender_UserIdAndReceiver_UserId(senderId, receiverId);
        }
        catch (Exception e)
        {
            log.error("Có lỗi xảy ra tại [findBySender_IdAndReceiver_Id]", e);
        }
        return null;
    }

    @Override
    public Chat findByReceiver_IdAndSender_Id(int receiverId, int senderId)
    {
        try
        {
            return chatRepository.findByReceiver_UserIdAndSender_UserId(receiverId, senderId);
        }
        catch (Exception e)
        {
            log.error("Có lỗi xảy ra tại [findByReceiver_IdAndSender_Id]", e);
        }
        return null;
    }

    @Override
    public Chat findByReceiverAndSender(int senderId, int receiverId)
    {
        try
        {
            Chat chat = findByReceiver_IdAndSender_Id(receiverId, senderId);
            if (Objects.isNull(chat))
            {
                return findBySender_IdAndReceiver_Id(receiverId, senderId);
            }
            else
            {
                return chat;
            }
        }
        catch (Exception e)
        {
            log.error("Có lỗi xảy ra tại [findByReceiver_IdAndSender_Id]", e);
        }
        return null;
    }

    @Override
    public List<Chat> findAllBySender_IdOrderByUpdateAtDesc(int senderId)
    {
        try
        {
            return chatRepository.findAllBySender_UserIdOrderByUpdateAtDesc(senderId);
        }
        catch (Exception e)
        {
            log.error("Có lỗi xảy ra tại [findAllBySender_IdOrderByUpdateAtDesc]", e);
        }
        return null;
    }

    @Override
    public Chat findById(int id)
    {
        try
        {
            return chatRepository.findById(id);
        }
        catch (Exception e)
        {
            log.error("Có lỗi xảy ra tại [findById]", e);
        }
        return null;
    }

    @Override
    public List<Chat> findAllBySender_IdOrReceiver_IdOrderByUpdateAtDesc(int senderId, int receiverId)
    {
        try
        {
            return chatRepository.findAllBySender_UserIdOrReceiver_UserIdOrderByUpdateAtDesc(senderId, receiverId);
        }
        catch (Exception e)
        {
            log.error("Có lỗi xảy ra tại [findAllBySender_IdOrReceiver_IdOrderByUpdateAtDesc]", e);
        }
        return null;
    }

    @Override
    public int saveCustom(int senderId, int receiverId)
    {
        try
        {
            return chatRepository.saveCustom(senderId, receiverId);
        }
        catch (Exception e)
        {
            log.error("Có lỗi xảy ra tại [saveCustom]", e);
        }
        return 0;
    }

    @Override
    public Chat save(Chat chat)
    {
        try
        {
            return chatRepository.save(chat);
        }
        catch (Exception e)
        {
            log.error("Có lỗi xảy ra tại [save]", e);
        }
        return null;
    }
}
