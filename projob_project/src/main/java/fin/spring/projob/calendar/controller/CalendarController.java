package fin.spring.projob.calendar.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import fin.spring.projob.calendar.domain.Calendar;
import fin.spring.projob.calendar.service.CalendarService;
import fin.spring.projob.project.vo.PMember;
import fin.spring.projob.prouser.vo.Prouser;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	@Autowired
	private CalendarService service;
	
	//캘린더 기본 화면
	@GetMapping("/list")
	public ModelAndView list(ModelAndView mv,
			HttpSession ss
			) {
		if(ss.getAttribute("loginSsInfo") == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		//세션에서 아이디 호출
		Prouser userInfo = (Prouser) ss.getAttribute("loginSsInfo");
		String userId = userInfo.getUs_id();
		 
		//프로젝트 리스트
		List<Map<String, Object>> project = service.selectProject(userId);

		//유저 ID 담기
		mv.addObject("userId", userId);
		//프로젝트 리스트 담기
		mv.addObject("projectlist", project);
		mv.setViewName("calendar/calendar");
		return mv;
	}
	@PostMapping("/list")
	public ModelAndView listPost(ModelAndView mv,
			HttpSession ss,
			@RequestParam(name="pro_no", defaultValue ="0") int pro_no
			) {
		
		if(ss.getAttribute("loginSsInfo") == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		//세션에서 아이디 호출
		Prouser userInfo = (Prouser) ss.getAttribute("loginSsInfo");
		String userId = userInfo.getUs_id();
		 
		//프로젝트 리스트 호출
		List<Map<String, Object>> project = service.selectProject(userId);
		
		//색깔 분배 호출
		Map<String, Object> colorInput = service.selectColorInput(userId, pro_no);
		
		//색상 호출
		String mycolor = "#3788d8";	//기본 색상
		if(pro_no != 0) {
			mycolor = service.selectColor(userId, String.valueOf(pro_no));
		}
		System.out.println("sjk pro_no:"+pro_no);
		System.out.println("sjk mycolor:"+mycolor);
		
		//프로젝트 멤버 호출
		List<PMember> pmlist = service.selectPMemberList(String.valueOf(pro_no));
		
		//유저 ID 담기
		mv.addObject("userId", userId);
		//프로젝트 리스트 담기
		mv.addObject("projectlist", project);
		//색상 담기
		mv.addObject("mycolor", mycolor);
		//프로젝트 멤버 담기
		mv.addObject("pmlist", pmlist);
		//색깔 분배 담기
		mv.addObject("colorInput", colorInput);
		//프로젝트 번호 담기
		mv.addObject("pro_no", pro_no);
		mv.setViewName("calendar/calendar");
		return mv;
	}

	//일정 데이터 조회 (writer별 & project별)
	@PostMapping(value="/data", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String getCalData(Model m, HttpSession ss,
			@RequestParam(name="pro_no", defaultValue ="0") String pro_no) {
		
		//세션에서 아이디 호출
		Prouser userInfo = (Prouser) ss.getAttribute("loginSsInfo");
		String writer = userInfo.getUs_id();
		
		return new Gson().toJson(service.calendarList(pro_no, writer));
	}
	
	
	//일정 데이터 추가
	@PostMapping(value="/insert", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insertCalendar(Calendar calendar) {
		int result = service.insertCalendar(calendar);
		return String.valueOf(result);	//숫자를 String으로 변환
		
	}
	
	//일정 데이터 삭제
	@PostMapping(value="/delete", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String deleteCalendar(Calendar calendar) {
		int result = service.deleteCalendar(calendar);
		return String.valueOf(result);
	}
	
	

}
