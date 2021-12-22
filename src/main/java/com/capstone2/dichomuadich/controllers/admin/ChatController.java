package com.capstone2.dichomuadich.controllers.admin;

import com.capstone2.dichomuadich.domain.Chat;
import com.capstone2.dichomuadich.domain.User;
import com.capstone2.dichomuadich.models.MessageRequest;
import com.capstone2.dichomuadich.services.impl.ChatServiceImpl;
import com.capstone2.dichomuadich.services.impl.MessageServiceImpl;
import com.capstone2.dichomuadich.services.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping("/chat")
public class ChatController {

    /** TODO: Field description */
    @Autowired
    ChatServiceImpl chatService;

    /** TODO: Field description */
    @Autowired
    MessageServiceImpl messageService;

    /** TODO: Field description */
    @Autowired
    UserServiceImpl userService;

    @GetMapping("")
    public String loadChat()
    {
        return "public.chat";
    }

    @MessageMapping("sendMessage")
    @SendTo("/load/message")
    public Map sendMessage(@Payload MessageRequest messageRequest)
    {
        Integer chatId = messageRequest.getChatId();
        Integer senderId = messageRequest.getSenderId();
        Integer receiverId = messageRequest.getReceiverId();
        String content = messageRequest.getContent();
        Chat chat = chatService.findByReceiverAndSender(senderId, receiverId);
        if (Objects.isNull(chat))
        {
            chatService.saveCustom(senderId, receiverId);
            chatId = chatService.findByReceiverAndSender(senderId, receiverId).getId();
        }

        messageService.saveCustom(chatId, senderId, content);
        chat = chatService.findById(chatId);
        chat.setUpdateAt(Timestamp.from(Instant.now()));
        chatService.save(chat);

        User user = userService.findUserByUserId(senderId);

        Map<String, Object> result = new HashMap<>();
        result.put("content", content);
        result.put("user", user);
        result.put("createAt", Timestamp.from(Instant.now()));

        return result;
    }


    /**
     * TODO: Method description
     *
     * @param request
     * @param userId
     * @return
     */
    @GetMapping("{userId}")
    public String loadSendNewMsg(HttpServletRequest request, @PathVariable Integer userId, HttpSession session) {


        User user = (User) session.getAttribute("userInfo");
        User sendUser = userService.findUserByUserId(user.getUserId());
        Chat chat = chatService.findByReceiverAndSender(user.getUserId(), userId);

        request.setAttribute("chat", chat);
        request.setAttribute("senderUser", sendUser);
        return "public.chat";
    }
}
