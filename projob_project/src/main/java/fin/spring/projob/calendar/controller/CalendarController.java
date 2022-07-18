package fin.spring.projob.calendar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import fin.spring.projob.calendar.domain.Calendar;
import fin.spring.projob.calendar.domain.Color_sample;
import fin.spring.projob.calendar.service.CalendarService;
import fin.spring.projob.project.vo.PMember;
import fin.spring.projob.project.vo.Project;
import fin.spring.projob.prouser.vo.Prouser;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	@Autowired
	private CalendarService service;
	
	//캘린더 기본 화면
	@GetMapping("/list")
	public ModelAndView list(ModelAndView mv,
			RedirectAttributes rttr,
			HttpSession ss,
			@RequestParam(name="pro_no", defaultValue ="0") String pro_no
			) {
		
		
		if(ss.getAttribute("loginSsInfo") == null) {
			mv.setViewName("redirect:/login");
			rttr.addFlashAttribute("msg", "로그인 먼저 해주세요");
			return mv;
		}
		//세션에서 아이디 호출
		Prouser userInfo = (Prouser) ss.getAttribute("loginSsInfo");
		String userId = userInfo.getUs_id();
		 
		//프로젝트 리스트
		List<Map<String, Object>> project = service.selectProject(userId);
		//색상 호출
		//String color = service.selectColor(userId, pro_no);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("pro_no", pro_no);
		String color = service.selectColor(map);

		//
		
		//유저 ID 담기
		mv.addObject("userId", userId);
		//프로젝트 리스트 담기
		mv.addObject("project", project);
		mv.setViewName("calendar/calendar");
		//색상 담기
		mv.addObject("color", color);
		return mv;
	}
	
		

	//일정 데이터 조회 (writer별)
	@GetMapping(value="/data", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String getCalData(Model m, HttpSession ss,
			@RequestParam(name="pro_no", defaultValue ="0") String pro_no) {
		//m.addAttribute("list", service.calenList());
		//return "pageJsonReport";
		
		//세션에서 아이디 호출
		Prouser userInfo = (Prouser) ss.getAttribute("loginSsInfo");
		String writer = userInfo.getUs_id();
		
		return new Gson().toJson(service.calendarList(pro_no, writer));
	}
	
	
	//일정 데이터 추가
	@PostMapping(value="/insert", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insertCalendar(Calendar calendar) {
//		calendar.setStart(calendar.getStart().substring(0, 16).replace('T', ' '));
//		calendar.setEnd(calendar.getEnd().substring(0, 16).replace('T', ' '));
//		System.out.println("^^^^^^^^^^^^^^^^"+calendar.getStart());
		
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
	
	//프로젝트 멤버리스트 조회
	@PostMapping("pMember")
	@ResponseBody
	public String selectPMember(
			@RequestParam("pro_no") String pro_no) {
		List<PMember> pmlist = service.selectPMember(pro_no);
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String data = gson.toJson(pmlist);
		return data;
		
	}
	
	

}
