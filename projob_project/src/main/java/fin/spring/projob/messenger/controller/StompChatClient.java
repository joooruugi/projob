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

    @MessageMapping(value = "/chat/message")
    public void message(Message message) {
    	String msg_no = service.selectMaxMsgNo();
    	message.setMsg_no(msg_no);
    	service.insertMessage(message);
    	String msg_sdate = service.selectMsgSdate(msg_no);
    	message.setMsg_sdate(msg_sdate);
        messagingTemplate.convertAndSend("/sub/chat/message/"+message.getMr_no(),message);
    }
    
    public void enter(Message message) {
    	messagingTemplate.convertAndSend("/sub/chat/message/" + message.getMr_no(), message);
    }
    
    public void out(Message message) {
    	messagingTemplate.convertAndSend("/sub/chat/message/" + message.getMr_no(), message);
    }
}
