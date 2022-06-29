package fin.spring.projob.messenger.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import fin.spring.projob.messenger.service.MessengerService;

@Controller
@RequestMapping("/chat")
public class MessengerController {
	
	@Autowired
	MessengerService service;
	
	@GetMapping("room")
	public ModelAndView chat(ModelAndView mv,
			@RequestParam(value = "roomId", defaultValue = "0") String roomId
			) {
		//임시ID
		String userId = "jw";
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
