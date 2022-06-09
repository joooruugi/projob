package fin.spring.projob.freelancer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import fin.spring.projob.freelancer.service.FreelancerService;
import fin.spring.projob.freelancer.vo.Freelancer;

@Controller
@RequestMapping("/free")
public class FreelancerController {
	@Autowired
	private FreelancerService fservice;
	
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public ModelAndView insertFree(
			ModelAndView mv) {
		mv.setViewName("free/info");
		return mv;
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public ModelAndView insertFree(
			ModelAndView mv
			, Freelancer freelancer) {
		int result = fservice.insertFreelancer(freelancer);
		mv.setViewName("redirect:/");
		return mv;
	}
	
}
