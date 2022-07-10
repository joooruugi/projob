package fin.spring.projob.calendar.controller;

import java.io.Console;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.inject.Qualifier;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import fin.spring.projob.calendar.domain.Calendar;
import fin.spring.projob.calendar.service.CalendarService;
import fin.spring.projob.prouser.vo.Prouser;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	@Autowired
	private CalendarService service;
	
	//캘린더 기본 화면
	@GetMapping("/list")
	public ModelAndView list(ModelAndView mv,
//			@RequestParam(value="id") String id,
			RedirectAttributes rttr,
			HttpSession ss
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
		
		//임시ID 담기
		mv.addObject("userId", userId);
		//일정 번호 담기
//		mv.addObject("id", id);

		//프로젝트 리스트 담기
		mv.addObject("project", project);
		mv.setViewName("calendar/calendar");
		return mv;
	}
		

	//일정 데이터 조회
	@GetMapping(value="/data", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String getCalData(Model m) {
		//m.addAttribute("list", service.calenList());
		//return "pageJsonReport";
		return new Gson().toJson(service.calendarList());
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
	
	
	
	
	
	// @Controller
	// public class CalendarController {
//		@RequestMapping(value = "/calendar")
//		public ModelAndView calendar(ModelAndView mv) {
//			mv.setViewName("calendar/calendar");
//			return mv;
//		}

	// 달력기본화면
//	@RequestMapping(value = "/adms/calendar/management/list.do")
//	public String lnb04List(RedirectAttributes redirectAttributes, HttpServletRequest request, @ModelAttribute("searchVO") tbl_calendarVO searchVO, ModelMap model) throws Exception {
//	 
//	    
//	    int isAdm = 0;
//	 
//	    LoginVO loginVO = loginService.getLoginInfo();
//	      if(loginVO.getAuthCode().contentEquals("1")) isAdm =1;
//	      model.addAttribute("isAdm", isAdm);
//	 
//	    return "tiles:adms/calendar/management/list";
//	}
//	 
//	 
//	//달력데이터조회
//	@RequestMapping(value = "/adms/calendar/management/read_ajx.do" ,method = RequestMethod.POST)
//	@ResponseBody
//	public String getCalData(
//	        @ModelAttribute("searchVO") tbl_calendarVO searchVO,
//	        HttpServletRequest request,
//	        HttpServletResponse res,
//	        ModelMap model) throws Exception {
//	    
//	    JSONObject obj = new JSONObject();
//	    
//	    res.setContentType("text/html; charset=UTF-8");
//	    PrintWriter out = res.getWriter();
//	    
//	    searchVO.setSite_code(loginService.getSiteCode());
//	    List<tbl_calendarVO> list = calendarService.getCalData(searchVO);
//	 
//	    obj.put("success", "ok");
//	    obj.put("list",net.sf.json.JSONArray.fromObject(list));
//	    out.print(obj);
//	    return null;
//	}
//	 
//	 
//	//달력데이터등록화면
//	@RequestMapping(value = "/adms/calendar/management/create_ajx.do",method = RequestMethod.POST)
//	@ResponseBody
//	public String createAction(
//	        @RequestBody String filterJSON,
//	        HttpServletRequest request,
//	        HttpServletResponse res,
//	        ModelMap model) throws Exception {
//	    LoginVO loginVO = loginService.getLoginInfo();
//	    JSONObject obj = new JSONObject();
//	    
//	    res.setContentType("text/html; charset=UTF-8");
//	    PrintWriter out = res.getWriter();
//	 
//	    //================================ json Object parse ============================
//	    ObjectMapper mapper = new ObjectMapper();            
//	    tbl_calendarVO searchVO = (tbl_calendarVO)mapper.readValue(filterJSON,new TypeReference<tbl_calendarVO>(){ });
//	    //================================ json Object parse ============================
//	    searchVO.setSite_code(loginService.getSiteCode());
//	    searchVO.setCret_id(loginVO.getId());
//	    searchVO.setCret_ip(request.getRemoteAddr());
//	    
//	    
//	    calendarService.createCalendar(searchVO);
//	    
//	 
//	    obj.put("success", "ok");
//	    out.print(obj);
//	    return null;
//	}
//	 
//	 
//	//달력데이터업데이트
//	@RequestMapping(value = "/adms/calendar/management/update_ajx.do",method = RequestMethod.POST)
//	@ResponseBody
//	public String updateAction(
//	        @RequestBody String filterJSON,
//	        HttpServletRequest request,
//	        HttpServletResponse res,
//	        ModelMap model) throws Exception {
//	    LoginVO loginVO = loginService.getLoginInfo();
//	    JSONObject obj = new JSONObject();
//	    
//	    res.setContentType("text/html; charset=UTF-8");
//	    PrintWriter out = res.getWriter();
//	 
//	    //================================ json Object parse ============================
//	    ObjectMapper mapper = new ObjectMapper();            
//	    tbl_calendarVO searchVO = (tbl_calendarVO)mapper.readValue(filterJSON,new TypeReference<tbl_calendarVO>(){ });
//	    //================================ json Object parse ============================
//	    searchVO.setSite_code(loginService.getSiteCode());
//	    searchVO.setModi_id(loginVO.getId());
//	    searchVO.setModi_ip(request.getRemoteAddr());
//	    
//	    
//	    calendarService.updateCalendar(searchVO);
//	    
//	 
//	    obj.put("success", "ok");
//	    out.print(obj);
//	    return null;
//	}
//	 
//	 
//	//달력데이터삭제
//	@RequestMapping(value = "/adms/calendar/management/delete_ajx.do",method = RequestMethod.POST)
//	@ResponseBody
//	public String deleteAction(
//	        @RequestBody String filterJSON,
//	        HttpServletRequest request,
//	        HttpServletResponse res,
//	        ModelMap model) throws Exception {
//	    LoginVO loginVO = loginService.getLoginInfo();
//	    JSONObject obj = new JSONObject();
//	    
//	    res.setContentType("text/html; charset=UTF-8");
//	    PrintWriter out = res.getWriter();
//	 
//	    //================================ json Object parse ============================
//	    ObjectMapper mapper = new ObjectMapper();            
//	    tbl_calendarVO searchVO = (tbl_calendarVO)mapper.readValue(filterJSON,new TypeReference<tbl_calendarVO>(){ });
//	    //================================ json Object parse ============================
//	    searchVO.setSite_code(loginService.getSiteCode());
//	    searchVO.setModi_id(loginVO.getId());
//	    searchVO.setModi_ip(request.getRemoteAddr());
//	    
//	    
//	    calendarService.deleteCalendar(searchVO);
//	    
//	 
//	    obj.put("success", "ok");
//	    out.print(obj);
//	    return null;
//	}

}
