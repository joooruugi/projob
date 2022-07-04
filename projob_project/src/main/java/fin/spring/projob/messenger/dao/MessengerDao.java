package fin.spring.projob.messenger.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fin.spring.projob.messenger.vo.Message;
import fin.spring.projob.prouser.vo.Prouser;

@Repository
public class MessengerDao {

	@Autowired
	SqlSession sqlsession;
	
	public List<Map<String, Object>> selectAllRooms(String userId) {
		return sqlsession.selectList("Messenger.selectAllRooms", userId);
	}
	public int insertChatRoom(Map<String, Object> map) {
		int maxnum = sqlsession.selectOne("Messenger.maxmessageroomno");
		map.put("maxnum", maxnum);
		return sqlsession.insert("Messenger.insertChatRoom", map);
	}
	
	public List<Map<String, Object>> selectRoomByRoomId(String roomId) {
		return sqlsession.selectList("Messenger.selectRoomByRoomId", roomId);
	}
	public List<Map<String, Object>> selectProject(String userId) {
		return sqlsession.selectList("Messenger.selectProject", userId);
	}
	public List<Map<String, Object>> selectPMember(String pro_no) {
		return sqlsession.selectList("Messenger.selectPMember", pro_no);
	}
	public List<Prouser> selectPMember2(String userInfo) {
		return sqlsession.selectList("Messenger.selectPMember2", userInfo);
	}
	public void insertMessage(Message message) {
		sqlsession.insert("Messenger.insertMessage", message);
		
	}
	public List<Map<String, Object>> selectRoomMember(String roomId) {
		return sqlsession.selectList("Messenger.selectRoomMember", roomId);
	}
	
}
