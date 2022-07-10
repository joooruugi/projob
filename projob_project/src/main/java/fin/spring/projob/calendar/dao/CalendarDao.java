package fin.spring.projob.calendar.dao;

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

	//일정 조회
	public List<Calendar> calendarList() {
		return sqlsession.selectList("Calendar.calendarList");
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
		return sqlsession.selectList("Messenger.selectProject", userId);
	}

	
}
	


