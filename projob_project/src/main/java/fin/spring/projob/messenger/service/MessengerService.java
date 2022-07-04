package fin.spring.projob.messenger.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fin.spring.projob.messenger.dao.MessengerDao;
import fin.spring.projob.messenger.vo.Message;
import fin.spring.projob.prouser.vo.Prouser;

@Service
public class MessengerService {
	
	@Autowired
	MessengerDao dao;

	public List<Map<String, Object>> selectAllRooms(String userId) {
		return dao.selectAllRooms(userId);
	}

	public int insertChatRoom(Map<String, Object> map) {
		return dao.insertChatRoom(map);
	}

	public  List<Map<String, Object>> selectRoomByRoomId(String roomId) {
		return dao.selectRoomByRoomId(roomId);
	}

	public List<Map<String, Object>> selectProject(String userId) {
		return dao.selectProject(userId);
	}

	public List<Map<String, Object>> selectPMember(String pro_no) {
		return dao.selectPMember(pro_no);
	}

	public List<Prouser> selectPMember2(String userInfo) {
		return dao.selectPMember2(userInfo);
	}

	public void insertMessage(Message message) {
		dao.insertMessage(message);
	}

	public List<Map<String, Object>> selectRoomMember(String roomId) {
		return dao.selectRoomMember(roomId);
	}

}
