package fin.spring.projob.calendar.domain;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fin.spring.projob.calendar.dao.CalendarDao;

@Service
public class CalendarBo {

	@Autowired
	private CalendarDao calendarDao;
	
	private static final String CALENDAR_BACKGROUND_COLOR = "green";
	
	public void addCalendar(String title, String start, String end) {
		String backgroundColor = CALENDAR_BACKGROUND_COLOR;
		calendarDao.insertCalendar(title, start, end, backgroundColor);
	}
	
//	public List<Calendar> getCalendarList(){
//		return calendarDao.selectCalendarList();
//	}
}
