package fin.spring.projob.messenger.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fin.spring.projob.messenger.service.MessengerService;

@Controller
//@RequestMapping("/chat")
public class ChatRoomController {
	
	@Autowired
    private MessengerService service;

    //채팅방 목록 조회
//    @GetMapping(value = "/rooms")
    public ModelAndView rooms(
    		ModelAndView mv,
    		HttpSession session
    		){
    	List<Map<String, Object>> mr = service.selectAllRooms("jw");
//    	List<MessageRoom> mr = service.selectAllRooms((String)session.getAttribute("userId"));
        mv.addObject("list", mr);
        mv.setViewName("messenger/rooms");
        return mv;
    }

    //채팅방 개설
//    @PostMapping(value = "/room")
    public String create(@RequestParam String name, RedirectAttributes rttr){

        rttr.addFlashAttribute("roomName", service.insertChatRoom(name));
        return "redirect:/chat/rooms";
    }

    //채팅방 조회
//    @GetMapping(value = "/room")
    public ModelAndView getRoom(
    		@RequestParam(value = "roomId") String roomId,
    		ModelAndView mv){
        mv.addObject("room", service.selectRoomByRoomId(roomId));
        mv.setViewName("messenger/room");
        return mv;
    }
}
