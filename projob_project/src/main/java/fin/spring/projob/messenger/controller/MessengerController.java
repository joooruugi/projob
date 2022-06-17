package fin.spring.projob.messenger.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MessengerController {
	
	@RequestMapping(value = "/messenger", method = RequestMethod.GET)
	public ModelAndView chat(ModelAndView mv) {
		mv.setViewName("messenger/messenger");
		
//		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		System.out.println("username : " + user.getUsername());
//		
//		System.out.println("normal chat page");
//		mv.addObject("userid", user.getUsername());
		
		return mv;
	}
}
