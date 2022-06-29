package fin.spring.projob.messenger.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import fin.spring.projob.messenger.service.MessengerService;
import fin.spring.projob.prouser.vo.Prouser;

@Controller
@RequestMapping("/chat")
public class MessengerController {
	
	@Autowired
	MessengerService service;
	
	@GetMapping("room")
	public ModelAndView chat(ModelAndView mv,
			@RequestParam(value = "roomId", defaultValue = "0") String roomId,
			HttpSession ss
			) {
		System.out.println(ss.getAttribute("loginSsInfo"));
		//임시ID
		Prouser userInfo = (Prouser) ss.getAttribute("loginSsInfo");
		String userId = userInfo.getUs_id();
		//채팅방 리스트
		List<Map<String, Object>> mr = service.selectAllRooms(userId);
		//채팅방 클릭으로 왔을때
		if(roomId != "0") {
			mv.addObject("room", service.selectRoomByRoomId(roomId));
		}

		//임시ID 담기
		mv.addObject("userId", userId);
		//채팅방 리스트 담기
		mv.addObject("roomId", roomId);
		mv.addObject("list", mr);
		mv.setViewName("messenger/messenger");
		return mv;
	}
}
