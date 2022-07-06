package fin.spring.projob.messenger.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import fin.spring.projob.messenger.service.MessengerService;
import fin.spring.projob.messenger.vo.Message;
import fin.spring.projob.prouser.vo.Prouser;

@Controller
@RequestMapping("/chat")
public class MessengerController {
	
	@Autowired
	StompChatClient stompChatClient;
	
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
		List<Message> message = service.selectMessage(roomId);
		//메시지 호출
		mv.addObject("message", message);
		//세션에서 아이디 호출
		Prouser userInfo = (Prouser) ss.getAttribute("loginSsInfo");
		String userId = userInfo.getUs_id();
		//채팅방 리스트
		List<Map<String, Object>> mr = service.selectAllRooms(userId);
		//프로젝트 리스트
		List<Map<String, Object>> project = service.selectProject(userId);
		//채팅방 클릭으로 왔을때
		List<String> arr = new ArrayList<String>();
		if(!roomId.equals("0")) {
			mv.addObject("room", service.selectRoomByRoomId(roomId));
			List<Map<String, Object>> list = service.selectRoomMember(roomId);
			for(int i =0; i < list.size(); i++) {
				arr.add(i, (String) list.get(i).get("US_ID"));
			}
			mv.addObject("rm", list);
			mv.addObject("arr", arr);
		}
		//임시ID 담기
		mv.addObject("userId", userId);
		//방 번호 담기
		mv.addObject("roomId", roomId);
		//채팅방 리스트 담기
		mv.addObject("list", mr);
		//프로젝트 리스트 담기
		mv.addObject("project", project);
		if(!roomId.equals("0") && !arr.contains(userId)) {
			mv.setViewName("home");
		} else {
			mv.setViewName("messenger/messenger");
		}
		return mv;
	}
	
	@PostMapping("pMember")
	@ResponseBody
	public String selectPMember(
			@RequestParam(value = "pro_no") String pro_no,
			@RequestParam(value = "mr_no", required = false) String mr_no
			) {
		// 해당 프로젝트 명단, mr_no 가지고 참여자 명단 구해서 중복 제거 TODO
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pro_no", pro_no);
		map.put("mr_no", mr_no);
		List<Map<String, Object>> plist = service.selectPMember(map);
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String data = gson.toJson(plist);
		return data;
	}
	
	@PostMapping("pMember2")
	@ResponseBody
	public String selectPMember2(
			@RequestParam(value = "userInfo") String userInfo,
			@RequestParam(value = "mr_no", required = false) String mr_no
			) {
		// 해당 프로젝트 명단, mr_no 가지고 참여자 명단 구해서 중복 제거 TODO
		Map<String, Object> map = new HashMap<String, Object>();
		if(userInfo.length()>5) {
			if(userInfo.substring(0, 3).equals("010")) {
				if(!userInfo.substring(3, 4).equals("-")) {
					userInfo = userInfo.substring(0,3) + "-" + userInfo.substring(3, 7) + "-" + userInfo.substring(7, 11);
				}
			}
		}
		map.put("userInfo", userInfo);
		map.put("mr_no", mr_no);
		List<Prouser> user = service.selectPMember2(map);
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
			tus_id += "님이 입장하였습니다";
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
	
	@PostMapping("addMember")
	@ResponseBody
	public ModelAndView addMember(
			@RequestParam(value = "us_id", required = false) List<String> us_id,
			@RequestParam(value = "mr_no") String mr_no,
			ModelAndView mv,
			RedirectAttributes rttr
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("us_id", us_id.stream().distinct().collect(Collectors.toList()));
		map.put("mr_no", mr_no);
		String str = "";
		for(int i=0; i<us_id.size(); i++) {
			str += us_id.get(i);
			if(i < us_id.size()-1) {
				str += ", ";
			}
		}
		str += "님이 입장하였습니다";
		Message message = new Message();
		message.setMr_no(mr_no);
		message.setMsg_content(str);
		message.setMsg_id("sys");
		stompChatClient.enter(message);
		map.put("str", str);
		int result = service.insertChatRoomAdd(map);
		if(result > 0) {
			rttr.addFlashAttribute("msg", "초대 성공하였습니다");
			mv.setViewName("redirect:/chat/room?roomId="+mr_no);
		} else {
			rttr.addFlashAttribute("msg", "초대 실패하였습니다");
			mv.setViewName("redirect:/chat/room");
		}
		return mv;
	}
	
	//한글꺠짐 produces 꼭해줘야함 안그럼 ??? 로 출력됨
	@RequestMapping(value = "roomout", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String roomout(
			@RequestParam(value = "us_id") String us_id,
			@RequestParam(value = "mr_no") String mr_no
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("us_id", us_id);
		map.put("mr_no", mr_no);
		map.put("msg", us_id+"님이 퇴장하였습니다");
		int result = service.roomout(map);
		String msg = "";
		if(result > 0) {
			service.insertRoomoutMsg(map);
			msg = "대화방을 나갔습니다";
		} else {
			msg = "대화방을 나가지 못했습니다";
		}
		return msg;
	}
}
