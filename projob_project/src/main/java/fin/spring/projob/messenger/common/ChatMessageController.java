package fin.spring.projob.messenger.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ChatMessageController {
	
	@Autowired
    private final SimpMessagingTemplate simpMessagingTemplate;
    
    public void sendMsg(String path, Object message) throws Exception {
        simpMessagingTemplate.convertAndSend("/topic/" + path, message);
    }

}
