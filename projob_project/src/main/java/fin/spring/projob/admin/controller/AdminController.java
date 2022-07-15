package fin.spring.projob.admin.controller;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import fin.spring.projob.admin.service.AdminService;
import fin.spring.projob.admin.vo.Admin;
import fin.spring.projob.prouser.controller.ProuserController;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@SessionAttributes("adminloginSsInfo")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(ProuserController.class);

	@Autowired
	private AdminService service;

	// 관리자 로그인 get
	@RequestMapping(value = "/adlogin", method = RequestMethod.GET)
	public ModelAndView adloginGet(ModelAndView mv) {
		logger.info("adminlogin");
		mv.setViewName("admin/adminlogin");
		return mv;
	}

	// 관리자 로그인 post
	@PostMapping(value = "/adlogin")
	public ModelAndView adloginPost(ModelAndView mv, Admin admin, HttpSession session) throws Exception {
		Admin result = service.adlogin(admin);
		if (result != null) {
			session.setAttribute("adminloginSsInfo", admin);
			logger.info("AdminLogin POST");
			mv.setViewName("admin/adminmain");
		} else {
			mv.setViewName("redirect:/adlogin");
		}
		return mv;
	}

	// 관리자 로그아웃
	@RequestMapping(value = "/adlogout", method = RequestMethod.GET)
	public ModelAndView adlogout(ModelAndView mv, HttpSession session,
			@ModelAttribute("adminloginSsInfo") Admin admin) {
		session.getAttribute("adminloginSsInfo");
		session.invalidate();
		logger.info("Admin logout");
		mv.setViewName("prouser/login");
		return mv;
	}

	// 관리자 메인페이지 Get
	@RequestMapping(value = "/adminmain", method = RequestMethod.GET)
	public ModelAndView adminmainGet(ModelAndView mv, HttpSession session, HttpServletRequest req, Admin admin) throws Exception {
		session.getAttribute("adminloginSsInfo");
		System.out.println(admin);
		logger.info("adminMain GET");
		mv.setViewName("admin/adminmain");
		return mv;
	}
	//관리자 회원 승인 페이지 Get
	@RequestMapping(value="/aduserapprovelist", method=RequestMethod.GET)
	public ModelAndView aduserapprovelistGet(ModelAndView mv, HttpSession session, HttpServletRequest req,
			Admin admin)throws Exception{
		session.getAttribute("adminloginSsInfo");
		logger.info("aduserapprovelist GET");
		int us_ok = 0;
		mv.addObject("aduserapprovelist", service.aduserapprove(us_ok));
		mv.setViewName("admin/aduserapprovelist");
		return mv;
	}
	//관리자 프로젝트 공고 승인 페이지 Get
	@RequestMapping(value="/adprojectapprove", method=RequestMethod.GET)
	public ModelAndView adprojectapproveGet(ModelAndView mv, HttpSession session, Admin admin, HttpServletResponse response) throws Exception{
		logger.info("adprojectapprove GET");
		session.getAttribute("adminloginSsInfo");
		int pro_ok = 0;
		mv.addObject("adprojectapprove", service.adprojectapprove(pro_ok));
		mv.setViewName("admin/adprojectapprove");
		return mv;
	}
	

}
