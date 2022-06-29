package fin.spring.projob.messenger.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessengerDao {

	@Autowired
	SqlSession sqlsession;
	
	public List<Map<String, Object>> selectAllRooms(String userId) {
		return sqlsession.selectList("Messenger.selectAllRooms", userId);
	}
	public int insertChatRoom(String name) {
		int maxnum = sqlsession.selectOne("Messenger.maxmessageroomno");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("maxnum", maxnum);
		return sqlsession.insert("Messenger.insertChatRoom", map);
	}
	
	public List<Map<String, Object>> selectRoomByRoomId(String roomId) {
		return sqlsession.selectList("Messenger.selectRoomByRoomId", roomId);
	}
	
}
