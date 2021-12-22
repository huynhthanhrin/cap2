package com.capstone2.dichomuadich.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import java.sql.Timestamp;
import java.util.Collection;


/**
 * TODO: Class description
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "chat")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Chat {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "chat_id")
    private Integer id;

    @ManyToOne(
            cascade = CascadeType.MERGE,
            fetch = FetchType.EAGER
    )
    @JoinColumn(name = "sender_id")
    private User sender;

    @ManyToOne(
            cascade = CascadeType.MERGE,
            fetch = FetchType.EAGER
    )
    @JoinColumn(name = "receiver_id")
    private User receiver;

    @Column(name = "create_at")
    private Timestamp createAt;

    @Column(name = "update_at")
    private Timestamp updateAt;

    @OneToMany(mappedBy = "chat")
    @OrderBy("createAt ASC")
    private Collection<Message> messages;

    /**
     * TODO: Constructs ...
     *
     * @param sender
     * @param receiver
     */
    public Chat(User sender, User receiver) {
        this.sender = sender;
        this.receiver = receiver;
    }
}