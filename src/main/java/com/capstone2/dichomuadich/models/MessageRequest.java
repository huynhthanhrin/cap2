package com.capstone2.dichomuadich.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * TODO: Class description
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MessageRequest
{
    /** TODO: Field description */
    Integer chatId;

    /** TODO: Field description */
    Integer senderId;

    /** TODO: Field description */
    Integer receiverId;

    /** TODO: Field description */
    String content;
}

