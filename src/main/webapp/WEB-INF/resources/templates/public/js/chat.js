'use strict';

var url = window.location.origin;
let stompClient;
let userId;
let userChatId;
let chatId;
let $listUser;
let $chatMessage;
let $buttonSend;
let $inputMessage;
let $chatHistory;

function init() {
    cacheDOM();
    bindEvents();
}

function cacheDOM() {
    $listUser = document.querySelector('.friend-list');
    $chatMessage = document.querySelector('.chat-message .chat');
    $chatHistory = document.querySelector('.chat-message');
    $buttonSend = document.querySelector('#btn-send-msg');
    $inputMessage = document.querySelector('#txt-message');
    userId = document.querySelector('#userId').getAttribute('value');
    console.log(userId);
    if($listUser) {
        getListUser(userId);
    }
    if(userChatId) {
        getDataChatHistory(userChatId);
    }
}

function bindEvents() {
    if($inputMessage != null) {
        $inputMessage.addEventListener('keyup', sendMessage, true);
        $buttonSend.addEventListener('click', sendMessage, true);
    }
    connect();
}

function connect(event) {
    var socket = new SockJS('/ws');
    stompClient = Stomp.over(socket);

    stompClient.connect({}, onConnected, onError);
}

function onError(error) {
    console.log(error);
}

function onConnected() {
    stompClient.subscribe('/load/message', onMessageReceived);
}

function sendMessage(e) {
    if (e.keyCode === 13 || e.pointerId) {
        var messageContent = $inputMessage.value.trim();
        if (messageContent && stompClient) {
            var chatMessage = {
                chatId: chatId,
                senderId: userId,
                receiverId: userChatId,
                content: $inputMessage.value
            };
            stompClient.send("/chat/sendMessage", {}, JSON.stringify(chatMessage));
            $inputMessage.value = '';
        }
    }
}

function onMessageReceived(payload) {
    var li = document.createElement("li");
    var data = JSON.parse(payload.body);
    var position = data.user.userId == userId ? 'right' : 'left';
    var avatar = data.user.avatar || 'userChat.jpg';
    li.className = position;
    li.innerHTML = "<span class=\"chat-img pull-" + position + "\">\n" +
        "                <img src=\"/resources/uploads/" + avatar + "\" alt=\"User Avatar\">\n" +
        "            </span>\n" +
        "            <div class=\"chat-body clearfix\">\n" +
        "              <div class=\"header\">\n" +
        "                <strong class=\"primary-font\">" + (data.user.firstName+' '+data.user.lastName) + "</strong>\n" +
        "                <small class=\"pull-right text-muted\"><i class=\"fa fa-clock-o\"></i>" + new Date(data.createAt).toLocaleTimeString() + "</small>\n" +
        "              </div>\n" +
        "              <p>\n" +
        data.content +
        "              </p>\n" +
        "            </div>";
    $chatMessage.appendChild(li);
    getListUser(userId);
    $chatHistory.scrollTop = $chatHistory.scrollHeight;
}

//Load tin nhắn trong khung chat
function loadChatHistory(data) {
    $chatMessage.textContent = "";
    var message = data.messages;
    for(var msg of message) {
        var avatar = msg.sender.avatar || 'userChat.jpg';
        var li = document.createElement("li");
        var position = msg.sender.userId == userId ? 'right' : 'left';
        li.className = position;
        li.innerHTML = "<span class=\"chat-img pull-" + position + "\">\n" +
            "                <img src=\"/resources/uploads/" + avatar + "\" alt=\"User Avatar\">\n" +
            "            </span>\n" +
            "            <div class=\"chat-body clearfix\">\n" +
            "              <div class=\"header\">\n" +
            "                <strong class=\"primary-font\">" + (msg.sender.firstName+' '+msg.sender.lastName) + "</strong>\n" +
            "                <small class=\"pull-right text-muted\"><i class=\"fa fa-clock-o\"></i>" + new Date(msg.createAt).toLocaleTimeString() + "</small>\n" +
            "              </div>\n" +
            "              <p>\n" +
            msg.content +
            "              </p>\n" +
            "            </div>";
        $chatMessage.appendChild(li);
    }
    $chatHistory.scrollTop = $chatHistory.scrollHeight;
}

function getDataChatHistory(id) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", url+"/chat/"+id, true);
    xhr.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var res = JSON.parse(xhr.responseText);
            loadChatHistory(res.data.chat);
        }
    }
    xhr.send();
}

function getNumberUnreadMsg(messages) {
    var rs = 0;
    for(let i = messages.length-1; i >= 0; i--) {
        if(messages[i].sender.userId == userId || messages[i].read != 0)
            break;
        rs++;
    }
    return rs;
}

function loadListUser(data) {
    $listUser.textContent = "";
    for(var u of data) {
        var numUnreadMsg = getNumberUnreadMsg(u.messages);
        var currentUser = u.sender.userId == userId ? u.receiver : u.sender;
        var avatar = currentUser.avatar || 'userChat.jpg';
        var lastMessage = u.messages[u.messages.length-1];
        if(lastMessage) {
            var li = document.createElement("li");
            li.setAttribute("onclick","selectUser("+u.id+", "+currentUser.userId+")");
            li.innerHTML = "<a href=\"#\" class=\"clearfix\">\n" +
                "                <img src=\"/resources/uploads/" + avatar + "\" alt=\"\" class=\"img-circle\">\n" +
                "                    <div class=\"friend-name\">\n" +
                "                        <strong>" + (currentUser.firstName+' '+currentUser.lastName) + "</strong>\n" +
                "                    </div>\n" +
                "                    <div class=\"last-message text-muted\">" + lastMessage.content + "</div>\n" +
                "                    <small class=\"time text-muted\">" + new Date(lastMessage.createAt).toLocaleTimeString() + "</small>\n" +
                "                    <small class=\"chat-alert label label-danger\">" + numUnreadMsg + "</small>\n" +
                "            </a>";
            $listUser.appendChild(li);
        }
    }
}

function getListUser(id) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", url+"/chat/listuser/"+id, true);
    xhr.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var res = JSON.parse(xhr.responseText);
            loadListUser(res.data.chatList);
        }
    }
    xhr.send();
}

function readMessage(chatid) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", url+"/chat/readMessage", true);
    var data = new FormData();
    data.append("chatId", chatid);
    xhr.send(data);
}

function selectUser(chatid, receiverid) {
    chatId = chatid;
    userChatId = receiverid;
    readMessage(chatid);
    getDataChatHistory(chatid);
    getListUser(userId);
}

init();