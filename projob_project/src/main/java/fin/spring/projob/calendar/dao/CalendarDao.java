package fin.spring.projob.calendar.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fin.spring.projob.calendar.domain.Calendar;

@Repository
public class CalendarDao {
	@Autowired
	private SqlSession sqlsession;

	//프로젝트별, 작성자별 일정 조회
	public List<Calendar> calendarList(String pro_no, String writer) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("pro_no", pro_no);
		map.put("writer", writer);
		return sqlsession.selectList("Calendar.calendarList", map);
	}
	
	//일정 추가
	public int insertCalendar(Calendar calendar) {
		return sqlsession.insert("Calendar.insertCalendar",calendar);
	}
	
	//일정 삭제
	public int deleteCalendar(Calendar calendar) {
		return sqlsession.delete("Calendar.deleteCalendar",calendar);
	}
	
	//프로젝트 리스트
	public List<Map<String, Object>> selectProject(String userId) {
		return sqlsession.selectList("Calendar.selectProject", userId);
	}
	
	//색깔 조회
	public String selectColor(String userId, String pro_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("pro_no", pro_no);
		return sqlsession.selectOne("Calendar.selectColor", map);
	}
	
	//프로젝트 멤퍼 조회
//	public List<PMember> selectPMemberlist(String pro_no) {
//		return sqlsession.selectList("Calendar.selectPMember", pro_no);
//	}

	
}
	


