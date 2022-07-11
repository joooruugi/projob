package fin.spring.projob.fileshare.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("fileshare")
public class FileshareController {

	@RequestMapping("")
	public ModelAndView fileshare(
			ModelAndView mv
			) {
		mv.setViewName("fileshare/fileshare");
		return mv;
	}
	
	@RequestMapping("write")
	public ModelAndView fileshareWrite(
			ModelAndView mv
			) {
		
		mv.setViewName("fileshare/fileshare_write");
		return mv;
	}
}
