package fin.spring.projob.project.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import fin.spring.projob.admin.vo.Admin;
import fin.spring.projob.project.service.ProjectServiceImpl;
import fin.spring.projob.project.vo.Project;
import fin.spring.projob.prouser.controller.ProuserController;
import fin.spring.projob.prouser.vo.Prouser;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@SessionAttributes({ "loginSsInfo", "adminloginSsInfo" })
public class ProjectController {
	private static final Logger logger = LoggerFactory.getLogger(ProuserController.class);

	@Autowired
	private ProjectServiceImpl service;
	
	//프로젝트 메인 GET
	@RequestMapping(value="/project", method=RequestMethod.GET)
	public ModelAndView projectmainGet(ModelAndView mv
			,HttpSession session
			,@ModelAttribute("loginSsInfo") Prouser prouser) {
		logger.info("projectmain GET");
		session.getAttribute("loginSsInfo");
		if(prouser.getUs_info()==0) {
			logger.info("projectmain for free GET");
			mv.setViewName("project/projectmainfree");
		}else if(prouser.getUs_info()==1){
			logger.info("projectmain for comp GET");
			mv.setViewName("project/projectmaincomp");
		}else {
			logger.info("projectmain for nosession GET");
			mv.setViewName("project/projectmainfree");
		}
		return mv;
	}
	//프로젝트 공고 작성 GET for company
	@RequestMapping(value="/projectinsert", method=RequestMethod.GET)
	public ModelAndView projectinsertGet(ModelAndView mv
			,HttpSession session
			, @ModelAttribute("loginSsInfo")Prouser prouser) {
		logger.info("projectinsert GET");
		session.getAttribute("loginSsInfo");
		mv.setViewName("project/projectinsert");
		return mv;
	}
	//프로젝트 공고 작성 POST for company
	@PostMapping("/projectinsert")
	public ModelAndView projectinsertPost(ModelAndView mv
			, HttpSession session
			, Project project
			, @ModelAttribute("loginSsInfo")Prouser prouser)throws Exception {
		logger.info("projectinsert POST");
		session.getAttribute("loginSsInfo");
//		session.setAttribute("us_name", prouser.getUs_name());
		int result = service.insertProject(project);
		System.out.println(result);
		if(result<1) {
			logger.info("insertproject fail");
			mv.setViewName("redirect:/projectinsert");
		}else {
			logger.info("insertproject success");
			mv.setViewName("project/projectmaincomp");
		}
		return mv;
	}
}












