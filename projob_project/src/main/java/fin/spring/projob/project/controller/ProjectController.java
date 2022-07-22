package fin.spring.projob.project.controller;



import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fin.spring.projob.common.ScriptUtils;
import fin.spring.projob.project.service.ProjectService;
import fin.spring.projob.project.vo.PMember;
import fin.spring.projob.project.vo.Project;
import fin.spring.projob.prouser.controller.ProuserController;
import fin.spring.projob.prouser.service.ProuserService;
import fin.spring.projob.prouser.vo.Prouser;
import fin.spring.projob.prouser.vo.Resume;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@SessionAttributes("loginSsInfo")
public class ProjectController {
	private static final Logger logger = LoggerFactory.getLogger(ProuserController.class);

	@Autowired
	private ProjectService service;
	private ProuserService prouserservice;

	// 프로젝트 메인 GET
	// 프로젝트 목록 조회
	@RequestMapping(value = "/project", method = RequestMethod.GET)
	public ModelAndView projectmainGet(ModelAndView mv, HttpSession session) throws Exception {
		logger.info("projectmain GET");
		mv.addObject("projectlist", service.projectList());
		mv.setViewName("project/projectmain");
		return mv;
	}

	// 프로젝트 공고 작성 GET for company
	@RequestMapping(value = "/projectinsert", method = RequestMethod.GET)
	public ModelAndView projectinsertGet(ModelAndView mv, HttpSession session,
			@ModelAttribute("loginSsInfo") Prouser prouser) {
		logger.info("projectinsert GET");
		session.getAttribute("loginSsInfo");
		mv.setViewName("project/projectinsert");
		return mv;
	}

	// 프로젝트 공고 작성 POST for company
	@PostMapping("/projectinsert")
	public ModelAndView projectinsertPost(ModelAndView mv, HttpSession session, Project project,
			@ModelAttribute("loginSsInfo") Prouser prouser
			, MultipartHttpServletRequest mreq, HttpServletResponse response) throws Exception {
		logger.info("projectinsert POST");
		session.getAttribute("loginSsInfo");
		project.setPro_comp(prouser.getUs_name());
		project.setPro_id(prouser.getUs_id());
		int result = service.insertProject(project, mreq);
		System.out.println(result);
		if (result < 1) {
			logger.info("insertproject fail");
			ScriptUtils.alertAndBackPage(response, "프로젝트 등록에 실패하였습니다. 재시도 해주세요.");
		} else {
			logger.info("insertproject success");
			mv.setViewName("redirect:/projectstatus");
		}
		return mv;
	}

	// 프로젝트 상세조회 GET
	@RequestMapping(value = "/projectdetail", method = RequestMethod.GET)
	public ModelAndView projectDetailGet(ModelAndView mv, @ModelAttribute("loginSsInfo") Prouser prouser,
			HttpSession session, Project project
		) throws Exception {
		logger.info("projectdetail GET");
		session.getAttribute("loginSsInfo");
		int prono = project.getPro_no();
		mv.addObject("projectdetail", service.projectDetail(prono));
		mv.addObject("selectimgpro", service.selectimgpro(prono));
		mv.setViewName("project/projectdetail");
		return mv;
	}
	//(관리자) 프로젝트 승인시 조회 GET
	@RequestMapping(value="/adprojectdetail", method=RequestMethod.GET)
	public ModelAndView adprojectdetail(ModelAndView mv, Project project)throws Exception{
		logger.info("adprojectdetail GET");
		int prono = project.getPro_no();
		mv.addObject("projectdetail", service.projectDetail(prono));
		mv.addObject("selectimgpro", service.selectimgpro(prono));
		mv.setViewName("project/adprojectdetail");
		return mv;
	}

	// 프로젝트 신청 GET
	@RequestMapping(value = "/projectjoin", method = RequestMethod.GET)
	public ModelAndView projectjoinGet(ModelAndView mv, HttpSession session,
			@ModelAttribute("loginSsInfo") Prouser prouser, Project project, Resume resume) throws Exception {
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

	// 프로젝트 신청 POST
	@PostMapping("/projectjoin")
	public ModelAndView projectjoinPost(ModelAndView mv, HttpSession session, HttpServletResponse response,
			@ModelAttribute("loginSsInfo") Prouser prouser, Project project, Resume resume, PMember pmember,
			@RequestParam("pro_no") int pro_no) throws Exception {
		logger.info("projectjoin for POST");
		session.getAttribute("loginSsInfo");
		pmember.setUs_id(prouser.getUs_id());
		pmember.setPro_no(pro_no);
		int alreadyjoin = service.alreadyjoinproject(pmember);
		if (alreadyjoin != 0) {
			logger.info("User has session already join this project.");
			ScriptUtils.alertAndBackPage(response, "기신청한 프로젝트 입니다.");
		} else {
			pmember.setUs_name(prouser.getUs_name());
			int result = service.pmemberinsert(pmember);
			System.out.println(result);
			if (result < 1) {
				logger.info("pmemberinsert fail");
				ScriptUtils.alertAndBackPage(response, "신청에 실패했습니다. 재시도해주세요.");
			} else {
				logger.info("pmemberinsert success");
				mv.setViewName("redirect:/project");

			}
		}
		return mv;

	}

	// (기업) 본인 프로젝트 목록 GET
	@RequestMapping(value = "/projectstatus", method = RequestMethod.GET)
	public ModelAndView projectstatusGet(ModelAndView mv, HttpSession session, HttpServletRequest req,
			HttpServletResponse response, @ModelAttribute("loginSsInfo") Prouser prouser, Project project)
			throws Exception {
		logger.info("projectstatus GET");
		session.getAttribute("loginSsInfo");
		System.out.println(prouser);
		String pro_id = prouser.getUs_id();
		System.out.println(pro_id);
		mv.addObject("projectstatuscomp", service.projectstatuscomp(pro_id));
		System.out.println(service.projectstatuscomp(pro_id));
		mv.setViewName("project/projectstatus");
		return mv;
	}
	// (기업) 승인 대기중인 프로젝트 GET
	@RequestMapping(value="/projectdetailforcomp", method=RequestMethod.GET)
	public ModelAndView projectdetailforcompGet(ModelAndView mv, HttpSession session, HttpServletResponse response
			, @ModelAttribute("loginSsInfo")Prouser prouser, Project project
			,@RequestParam("pro_no")int prono)throws Exception{
		logger.info("projectdetailforcomp GET");
		session.getAttribute("loginSsInfo");
		mv.addObject("projectdetail", service.projectDetail(prono));
		mv.setViewName("project/projectdetailforcomp");
		return mv;
	}
//	//(기업) 승인 전 프로젝트 수정 GET
//	@RequestMapping(value="/updateproject", method=RequestMethod.GET)
//	public ModelAndView updateprojectGet(ModelAndView mv, HttpSession session, HttpServletResponse response
//			, @ModelAttribute("loginSsInfo")Prouser prouser, Project project
//			,@RequestParam("pro_no")int prono)throws Exception{
//		logger.info("updateproject GET");
//		session.getAttribute("loginSsInfo");
//		mv.addObject("projectdetail", service.projectDetail(prono));
//		mv.setViewName("project/updateproject");
//		return mv;
//	}
//	// (기업) 승인 전 프로젝트 수정 POST
//	@PostMapping("/updateproject")
//	public ModelAndView updateprojectPost(ModelAndView mv, HttpSession session, HttpServletResponse response
//			, @ModelAttribute("loginSsInfo")Prouser prouser, Project project
//			, @RequestParam("pro_no")int prono) throws Exception{
//		logger.info("updateproject POST");
//		session.getAttribute("loginSsInfo");
//		int result = service.updateproject(project);
//		if(result == 0) {
//			ScriptUtils.alertAndBackPage(response, "정보수정 실패.");
//			
//		}else {
//			ScriptUtils.alert(response, "정보수정 완료되었습니다.");
//			mv.setViewName("mypage/mypage");
//		}
//		return mv;
//	}
	// (기업) 승인 전 프로젝트 삭제
	@RequestMapping(value="/deleteproject", method=RequestMethod.GET)
	public ModelAndView deleteproject(ModelAndView mv, HttpSession session, HttpServletResponse response
			, @ModelAttribute("loginSsInfo")Prouser prouser, Project project
			,@RequestParam("pro_no")int prono)throws Exception{
		logger.info("deleteproject GET");
		session.getAttribute("loginSsInfo");
		int result =  service.deleteproject(prono);
		if(result == 0) {
			ScriptUtils.alertAndBackPage(response, "공고 삭제에 실패하였습니다.");
		}else {
			mv.setViewName("redirect:/mypage");
		}
		return mv;
	}
	// (기업) 프로젝트 신청 및 선정현황 GET
	@RequestMapping(value = "/projectjoinstatus", method = RequestMethod.GET)
	public ModelAndView projectjoinstatusGet(ModelAndView mv, HttpSession session, HttpServletResponse response,
			@ModelAttribute("loginSsInfo") Prouser prouser, Project project, Resume resume,
			@RequestParam("pro_no") int pro_no) throws Exception {
		logger.info("projectjoinstatusGet for company");
		session.getAttribute("loginSsInfo");
		mv.addObject("projectjoininfo", service.projectjoininfo(pro_no));
		mv.addObject("projectjoinstatus", service.projectjoinstatus(pro_no));
		mv.addObject("joinfree", service.joinfree(pro_no));
		System.out.println(service.projectjoinstatus(pro_no));
		mv.setViewName("project/projectjoinstatus");
		return mv;
	}

	// (기업) 프로젝트 프리랜서 선정 (신청 및 선정현황에서 POST)
	@PostMapping("/projectjoinstatus")
	public ModelAndView projectjoinstatusPost(ModelAndView mv, HttpSession session, HttpServletResponse response,
			@ModelAttribute("loginSsInfo") Prouser prouser, Project project, @RequestParam("pro_no") int pro_no,
			@RequestParam("free_id") String free_id,@RequestParam("pro_personnel") int pro_personnel, PMember pm, RedirectAttributes rttr) throws Exception {
		logger.info("projectjoinstatusPOST for company");
		session.getAttribute("loginSsInfo");
		pm.setPro_no(pro_no);
		pm.setUs_id(free_id);
		int selected = service.selectedfree(pm);
		if (selected >= pro_personnel) {
			ScriptUtils.alertAndBackPage(response, "이미 필요인원을 다 선정하였습니다. 프로젝트를 마감해주세요.");
		} else {
			int result = service.selectfree(pm);
			rttr.addFlashAttribute("result", pm);
			mv.setViewName("project/projectjoinstatus");
		}

		return mv;
	}

}
