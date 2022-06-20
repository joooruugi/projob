package fin.spring.projob.messenger.common;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		logger.info("{} 연결됨 ", session.getId());
//		System.out.println("채팅방 입장자 : " + session.getPrincipal().getName());
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(session.getId() + "님이 입장하였습니다"));
		}
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(session.getId() + "|" + message.getPayload()));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		
		logger.info("{}연결 끊김", session.getId());
//		System.out.println("채팅방 퇴장자 : " + session.getPrincipal().getName());
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(session.getId() + "님이 퇴장하였습니다"));
		}
	}

}
