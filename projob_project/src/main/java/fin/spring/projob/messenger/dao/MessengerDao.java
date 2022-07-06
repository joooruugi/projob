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
	public List<Map<String, Object>> selectPMember(Map<String, Object> map) {
		List<Map<String, Object>> list = sqlsession.selectList("Messenger.selectMemberPick", map);
		map.put("list", list);
		return sqlsession.selectList("Messenger.selectPMember", map);
	}
	public List<Prouser> selectPMember2(Map<String, Object> map) {
		List<Map<String, Object>> list = sqlsession.selectList("Messenger.selectMemberPick", map);
		map.put("list", list);
		return sqlsession.selectList("Messenger.selectPMember2", map);
	}
	public void insertMessage(Message message) {
		sqlsession.insert("Messenger.insertMessage", message);
		
	}
	public List<Map<String, Object>> selectRoomMember(String roomId) {
		return sqlsession.selectList("Messenger.selectRoomMember", roomId);
	}
	public int insertChatRoomAdd(Map<String, Object> map) {
		return sqlsession.insert("Messenger.insertChatRoomAdd", map);
	}
	public int roomout(Map<String, Object> map) {
		return sqlsession.delete("Messenger.roomout", map);
	}
	public void insertRoomoutMsg(Map<String, Object> map) {
		sqlsession.insert("Messenger.insertRoomoutMsg", map);
	}
	public List<Message> selectMessage(String roomId) {
		return sqlsession.selectList("Messenger.selectMessage", roomId);
	}
	public String selectMaxMsgNo() {
		return sqlsession.selectOne("Messenger.selectMaxMsgNo");
	}
	public String selectMsgSdate(String msg_no) {
		return sqlsession.selectOne("Messenger.selectMsgSdate", msg_no);
	}
	
}
