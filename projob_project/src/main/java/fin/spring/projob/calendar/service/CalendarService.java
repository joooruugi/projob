package fin.spring.projob.calendar.service;

import java.util.List;

import fin.spring.projob.calendar.domain.Calendar;


public interface CalendarService {

	//���� ��ȸ
	public List<Calendar> calendarList();
	
	//���� �߰�
	public int insertCalendar(Calendar calendar);
	
	
}
