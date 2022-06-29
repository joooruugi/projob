package fin.spring.projob.messenger.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fin.spring.projob.messenger.dao.MessengerDao;

@Service
public class MessengerService {
	
	@Autowired
	MessengerDao dao;

	public List<Map<String, Object>> selectAllRooms(String userId) {
		return dao.selectAllRooms(userId);
	}

	public int insertChatRoom(String name) {
		return dao.insertChatRoom(name);
	}

	public  List<Map<String, Object>> selectRoomByRoomId(String roomId) {
		return dao.selectRoomByRoomId(roomId);
	}

}
