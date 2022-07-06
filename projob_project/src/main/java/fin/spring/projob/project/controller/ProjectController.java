package fin.spring.projob.project.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import fin.spring.projob.admin.vo.Admin;
import fin.spring.projob.project.service.ProjectServiceImpl;
import fin.spring.projob.prouser.controller.ProuserController;
import fin.spring.projob.prouser.vo.Prouser;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@SessionAttributes({ "loginSsInfo", "adminloginSsInfo" })
public class ProjectController {
	private static final Logger logger = LoggerFactory.getLogger(ProuserController.class);

	@Autowired
	private ProjectServiceImpl pservice;
	
	@RequestMapping(value="/project", method=RequestMethod.GET)
	public ModelAndView projectmainGet(ModelAndView mv) {
		logger.info("projectmain GET");
		mv.setViewName("project/projectmain");
		return mv;
	}
}












