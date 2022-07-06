package fin.spring.projob.calendar.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

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
	
	
}
	


