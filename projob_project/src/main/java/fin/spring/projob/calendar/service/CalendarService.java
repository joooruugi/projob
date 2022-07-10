package fin.spring.projob.calendar.service;

import java.util.List;
import java.util.Map;

import fin.spring.projob.calendar.domain.Calendar;


public interface CalendarService {

	//일정 조회
	public List<Calendar> calendarList();
	
	//일정 추가
	public int insertCalendar(Calendar calendar);
	
	//일정 삭제
	public int deleteCalendar(Calendar calendar);
	
	//프로젝트 리스트
	public List<Map<String, Object>> selectProject(String userId);
	
	
}
