package fin.spring.projob.messenger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import fin.spring.projob.messenger.service.MessengerService;
import fin.spring.projob.messenger.vo.Message;
import lombok.RequiredArgsConstructor;

@Controller()
@RequiredArgsConstructor
public class StompChatClient {
    private final SimpMessagingTemplate messagingTemplate;
    
    @Autowired
    MessengerService service;

    @MessageMapping(value = "/chat/enter")
    public void enter(Message message) {
        System.out.println("연결성공");
        message.setMsg_content(message.getMsg_id() + "님이 채팅방에 참여하셨습니다.");
        messagingTemplate.convertAndSend("/sub/chat/message/" + message.getMr_no(), message);
    }

    @MessageMapping(value = "/chat/message")
    public void message(Message message) {
    	service.insertMessage(message);
        messagingTemplate.convertAndSend("/sub/chat/message/"+message.getMr_no(),message);
    }
}
