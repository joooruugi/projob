package fin.spring.projob.calendar.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import fin.spring.projob.calendar.domain.Calendar;

@Repository
public class CalendarDao {

	public void insertCalendar(
			@Param("CAL_TITLE") String CAL_TITLE,
			@Param("CAL_START") String CAL_START,
			@Param("CAL_END") String CAL_END,
			@Param("CAL_BACKGROUNDCOLOR") String CAL_BACKGROUNDCOLOR		
			) {
		
	}
	
//	public List<Calendar> selectCalendarList(){
//		return 
//	}
	
}
