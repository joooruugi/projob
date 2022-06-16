package fin.spring.projob.messenger.controller;

import java.util.*;

import org.springframework.stereotype.*;
import org.springframework.web.socket.*;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.handler.*;

// WebSocket을 사용하기 위해서는 반드시 TextWebSocketHandler를 상속해줘야 함

@Component
public class ChatHandler extends TextWebSocketHandler implements WebSocketConfigurer {
	
	private static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	
	// 사용자가 접속 했을 때 호출되는 메소드
	@Override	
	public void afterConnectionEstablished(
			WebSocketSession session
			) throws Exception {
		System.out.println(" ### 사용자 접속 ");
		list.add(session);
	}
	
	// 사용자가 메세지를 보냈을 때 호출되는 메소드
	@Override
	protected void handleTextMessage(
			WebSocketSession session, 
			TextMessage message
			) throws Exception {
		// 전송된 메세지를 List의 모든 세션에 전송
		String msg = message.getPayload();
		for(WebSocketSession s : list) {
			s.sendMessage(new TextMessage(session.getAcceptedProtocol() + msg));
		}
	}
	
	// 사용자 접속 해제했을 때 호출되는 메소드
	@Override
	public void afterConnectionClosed(
			WebSocketSession session, 
			CloseStatus status
			) throws Exception {
		System.out.println(" ### 사용자 접속 해제");
		list.remove(session);
	}
	
	@Override
	public void registerWebSocketHandlers(
			WebSocketHandlerRegistry registry
			) {
		registry.addHandler(this, "/chat-ws").setAllowedOrigins("*");
	}

	
}
