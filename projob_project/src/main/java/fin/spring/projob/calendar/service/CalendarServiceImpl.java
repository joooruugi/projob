package fin.spring.projob.calendar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fin.spring.projob.calendar.dao.CalendarDao;
import fin.spring.projob.calendar.domain.Calendar;
import fin.spring.projob.project.vo.PMember;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private CalendarDao dao;

	@Override
	public List<Calendar> calendarList(String pro_no, String writer) {
		return dao.calendarList(pro_no, writer);
	}

	@Override
	public int insertCalendar(Calendar calendar) {
		return dao.insertCalendar(calendar);
	}
	
	@Override
		public int deleteCalendar(Calendar calendar) {
			return dao.deleteCalendar(calendar);
	}
	
	@Override
	public List<Map<String, Object>> selectProject(String userId) {
		return dao.selectProject(userId);
	}
	

	@Override
	public String selectColor(String userId, String pro_no) {
		return dao.selectColor(userId, pro_no);
	}
	
	
	@Override
	public List<PMember> selectPMemberList(String pro_no) {
		return dao.selectPMemberList(pro_no);
	}
	
	@Override
	public Map<String, Object> selectColorInput(String userId, int pro_no){
		return dao.selectColorInput(userId, pro_no);
	}

	
	
}
