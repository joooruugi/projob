package fin.spring.projob.messenger.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/messenger")
public class MessengerController {
	
	@RequestMapping("/home")
	public ModelAndView messengerHome(
			ModelAndView mv
			) {
		mv.setViewName("messenger/messenger");
		return mv;
	}

}
