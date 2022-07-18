package fin.spring.projob.calendar.service;

import java.util.List;
import java.util.Map;

import fin.spring.projob.calendar.domain.Calendar;
import fin.spring.projob.calendar.domain.Color_sample;
import fin.spring.projob.project.vo.PMember;
import fin.spring.projob.project.vo.Project;


public interface CalendarService {

	//일정 조회 (작성자별, 프로젝트별)
	public List<Calendar> calendarList(String pro_no, String writer);
	
	//일정 추가
	public int insertCalendar(Calendar calendar);
	
	//일정 삭제
	public int deleteCalendar(Calendar calendar);
	
	//프로젝트 리스트
	public List<Map<String, Object>> selectProject(String userId);

	//색깔 조회
	//public String selectColor(String userId, String pro_no);
	public String selectColor(Map<String, Object> map);
	//public String selectColor(String userId);
	
	//프로젝트 멤버 조회
	public List<PMember> selectPMember(String pro_no);
}
