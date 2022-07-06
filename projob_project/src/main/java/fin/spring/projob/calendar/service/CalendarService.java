package fin.spring.projob.calendar.service;

import java.util.List;

import fin.spring.projob.calendar.domain.Calendar;


public interface CalendarService {

	//일정 조회
	public List<Calendar> calendarList();
	
	//일정 추가
	public int insertCalendar(Calendar calendar);
	
	
}
