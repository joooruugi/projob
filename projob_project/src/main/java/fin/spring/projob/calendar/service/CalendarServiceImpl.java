package fin.spring.projob.calendar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fin.spring.projob.calendar.dao.CalendarDao;
import fin.spring.projob.calendar.domain.Calendar;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private CalendarDao dao;

	@Override
	public List<Calendar> calendarList() {
		return dao.calendarList();
	}

	@Override
	public int insertCalendar(Calendar calendar) {
		return dao.insertCalendar(calendar);
	}
	

	
	
}
