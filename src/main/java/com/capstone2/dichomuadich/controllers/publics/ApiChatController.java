package com.capstone2.dichomuadich.controllers.publics;

import com.capstone2.dichomuadich.domain.Chat;
import com.capstone2.dichomuadich.domain.User;
import com.capstone2.dichomuadich.models.ResponseAPI;
import com.capstone2.dichomuadich.services.impl.ChatServiceImpl;
import com.capstone2.dichomuadich.services.impl.MessageServiceImpl;
import com.capstone2.dichomuadich.services.impl.UserServiceImpl;
import com.capstone2.dichomuadich.utils.AuthenticateUtil;
import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("chat")
public class ApiChatController
{
    /** TODO: Field description */
    @Autowired
    SimpMessagingTemplate messagingTemplate;

    /** TODO: Field description */
    @Autowired
    ChatServiceImpl chatService;

    /** TODO: Field description */
    @Autowired
    MessageServiceImpl messageService;

    /** TODO: Field description */
    @Autowired
    UserServiceImpl userService;

    /**
     * TODO: Method description
     *
     * @param id
     *
     * @return
     */
    @PostMapping("{id}")
    public ResponseAPI findMessage(@PathVariable Integer id)
    {
        HashMap<String, Object> result = new HashMap<>();

        Chat chat = chatService.findById(id);
        result.put("chat", chat);

        return new ResponseAPI(HttpStatus.SC_OK, "OK", result);
    }

    /**
     * TODO: Method description
     *
     *
     * @param chatId
     * @param request
     *
     * @return
     */
    @PostMapping("readMessage")
    public ResponseAPI readMessage(HttpServletRequest request, Integer chatId)
    {
        HashMap<String, Object> result = new HashMap<>();

        messageService.readAllMessageByChat_Id(chatId);

        return new ResponseAPI(HttpStatus.SC_OK, "OK", result);
    }

    /**
     * TODO: Method description
     *
     * @param id
     *
     * @return
     */
    @PostMapping("listuser/{id}")
    public ResponseAPI getListUser(@PathVariable Integer id)
    {
        HashMap<String, Object> result = new HashMap<>();

        List<Chat> chatList = chatService.findAllBySender_IdOrReceiver_IdOrderByUpdateAtDesc(id, id);
        result.put("chatList", chatList);

        return new ResponseAPI(HttpStatus.SC_OK, "OK", result);
    }

    /**
     * TODO: Method description
     *
     * @param request
     *
     * @return
     *
     */
    @PostMapping("listuser")
    public ResponseAPI getListUser(HttpServletRequest request)
    {
        HashMap<String, Object> result = new HashMap<>();

        User user = AuthenticateUtil.getUserAuthenticated(request);
        List<Chat> chatList = chatService.findAllBySender_IdOrReceiver_IdOrderByUpdateAtDesc(user.getUserId(), user.getUserId());
        result.put("user", user);
        result.put("chatList", chatList);

        return new ResponseAPI(HttpStatus.SC_OK, "OK", result);
    }
}
