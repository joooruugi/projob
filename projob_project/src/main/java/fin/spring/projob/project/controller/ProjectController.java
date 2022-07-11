package fin.spring.projob.project.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import fin.spring.projob.admin.vo.Admin;
import fin.spring.projob.common.ScriptUtils;
import fin.spring.projob.project.service.ProjectServiceImpl;
import fin.spring.projob.project.vo.PMember;
import fin.spring.projob.project.vo.Project;
import fin.spring.projob.prouser.controller.ProuserController;
import fin.spring.projob.prouser.service.ProuserServiceImpl;
import fin.spring.projob.prouser.vo.Prouser;
import fin.spring.projob.prouser.vo.Resume;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@SessionAttributes({ "loginSsInfo", "adminloginSsInfo" })
public class ProjectController {
	private static final Logger logger = LoggerFactory.getLogger(ProuserController.class);

	@Autowired
	private ProjectServiceImpl service;
	private ProuserServiceImpl prouserservice;
	
	//프로젝트 메인 GET
	//프로젝트 목록 조회 
	@RequestMapping(value="/project", method=RequestMethod.GET)
	public ModelAndView projectmainGet(ModelAndView mv
			,HttpSession session
			,@ModelAttribute("loginSsInfo") Prouser prouser)throws Exception {
		logger.info("projectmain GET");
		session.getAttribute("loginSsInfo");
		mv.addObject("projectlist", service.projectList());
		logger.info("projectmain GET");
		mv.setViewName("project/projectmain");
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
		project.setPro_comp(prouser.getUs_name());
		int result = service.insertProject(project);
		System.out.println(result);
		if(result<1) {
			logger.info("insertproject fail");
			mv.setViewName("redirect:/projectinsert");
		}else {
			logger.info("insertproject success");
			mv.setViewName("project/projectmain");
		}
		return mv;
	}
	//프로젝트 상세조회 GET
	@RequestMapping(value="/projectdetail", method=RequestMethod.GET)
	public ModelAndView projectDetailGet(ModelAndView mv
			, @ModelAttribute("loginSsInfo")Prouser prouser
			, HttpSession session
			, Project project)throws Exception{
		logger.info("projectdetail GET");
		session.getAttribute("loginSsInfo");
		mv.addObject("projectdetail", service.projectDetail(project.getPro_no()));
		mv.setViewName("project/projectdetail");
		return mv;
	}
	//프로젝트 신청 GET
	@RequestMapping(value="/projectjoin", method=RequestMethod.GET)
	public ModelAndView projectjoinGet(ModelAndView mv, HttpSession session
			, @ModelAttribute("loginSsInfo")Prouser prouser, Project project
			, Resume resume)throws Exception{
		logger.info("projectjoin for free GET");
		session.getAttribute("loginSsInfo");
		System.out.println(prouser);
		mv.addObject("projectjoin", service.projectDetail(project.getPro_no()));
		System.out.println(service.projectDetail(project.getPro_no()));
		resume.setUs_id(prouser.getUs_id());
		mv.addObject("resumeJoin", prouserservice.resumeJoin(resume.getUs_id()));
		mv.setViewName("project/projectjoin");
		return mv;
	}
	//프로젝트 신청 POST
	@PostMapping("/projectjoin")
	public ModelAndView projectjoinPost(ModelAndView mv
			, HttpSession session
			, HttpServletResponse response
			, @ModelAttribute("loginSsInfo")Prouser prouser
			, Project project
			, Resume resume
			, PMember pmember)throws Exception{
		logger.info("projectjoin for POST");
		session.getAttribute("loginSsInfo");
		pmember.setUs_id(prouser.getUs_id());
		int result = service.pmemberinsert(pmember);
		System.out.println(result);
		if(result <1) {
			logger.info("pmemberinsert fail");
			mv.setViewName("project/projectjoin");
		}else {
			logger.info("pmemberinsert success");
			ScriptUtils.alert(response, "프로젝트 신청이 완료되었습니다.");
			mv.setViewName("project/projectmain");
		}
		return mv;
	}

}












