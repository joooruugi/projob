package fin.spring.projob.messenger.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

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
		//채팅방 리스트
		List<Map<String, Object>> mr = service.selectAllRooms(userId);
		//프로젝트 리스트
		List<Map<String, Object>> project = service.selectProject(userId);
		//채팅방 클릭으로 왔을때
		if(roomId != "0") {
			mv.addObject("room", service.selectRoomByRoomId(roomId));
			mv.addObject("rm", service.selectRoomMember(roomId));
		}

		//임시ID 담기
		mv.addObject("userId", userId);
		//방 번호 담기
		mv.addObject("roomId", roomId);
		//채팅방 리스트 담기
		mv.addObject("list", mr);
		//프로젝트 리스트 담기
		mv.addObject("project", project);
		mv.setViewName("messenger/messenger");
		return mv;
	}
	
	@PostMapping("pMember")
	@ResponseBody
	public String selectPMember(
			@RequestParam(value = "pro_no") String pro_no
			) {
		List<Map<String, Object>> plist = service.selectPMember(pro_no);
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String data = gson.toJson(plist);
		return data;
	}
	
	@PostMapping("pMember2")
	@ResponseBody
	public String selectPMember2(
			@RequestParam(value = "userInfo") String userInfo
			) {
		if(userInfo.length()>5) {
			if(userInfo.substring(0, 3).equals("010")) {
				if(!userInfo.substring(3, 4).equals("-")) {
					userInfo = userInfo.substring(0,3) + "-" + userInfo.substring(3, 7) + "-" + userInfo.substring(7, 11);
				}
			}
		}
		System.out.println(userInfo);
		List<Prouser> user = service.selectPMember2(userInfo);
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String data = gson.toJson(user);
		return data;
	}
	
	@PostMapping("room")
	@ResponseBody
    public ModelAndView create(
    		@RequestParam(value = "us_id", required = false) List<String> us_id, 
    		@RequestParam String mr_name,
    		ModelAndView mv,
    		RedirectAttributes rttr,
    		HttpSession ss
    		){
		Map<String, Object> map = new HashMap<String, Object>();
		//세션에서 아이디 호출
		Prouser userInfo = (Prouser) ss.getAttribute("loginSsInfo");
		String userId = userInfo.getUs_id();
		// 채팅방 입장 메시지 출력용
		String tus_id = "";
		if(us_id != null) {
			for(int i=0; i<us_id.size(); i++) {
				tus_id += us_id.get(i);
				if(i < us_id.size()-1) {
					tus_id += ", ";
				}
			}
			tus_id += "님이 입장했습니다";
			map.put("tus_id", tus_id);
			map.put("us_id", us_id.stream().distinct().collect(Collectors.toList()));
		}
		//중복 아이디 제거
		map.put("mr_name", mr_name);
		map.put("cus_id", userId);
		int result = service.insertChatRoom(map);
		if(result > 0) {
			rttr.addFlashAttribute("msg", "대화방을 생성했습니다");
			mv.setViewName("redirect:/chat/room");
		} else {
			rttr.addFlashAttribute("msg", "대화방 생성을 실패했습니다");
			mv.setViewName("redirect:/chat/room");
		}
        return mv;
    }
}
