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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fin.spring.projob.admin.service.AdminService;
import fin.spring.projob.admin.vo.Admin;
import fin.spring.projob.prouser.controller.ProuserController;
import fin.spring.projob.prouser.vo.Prouser;
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
			mv.setViewName("home");
		} else {
			mv.setViewName("redirect:/adlogin");
		}
		return mv;
	}


	// 관리자 메인페이지 Get
	@RequestMapping(value = "/adminmain", method = RequestMethod.GET)
	public ModelAndView adminmainGet(
			ModelAndView mv, HttpSession session, HttpServletRequest req
			, @ModelAttribute("adminloginSsInfo")Admin admin)
			throws Exception {
		session.getAttribute("adminloginSsInfo");
		int usok = 0;
		int prook = 0;
		System.out.println(service.adusercnt(usok));
		System.out.println(service.adprojectcnt(prook));
		mv.addObject("adusercnt", service.adusercnt(usok));
		mv.addObject("adprojectcnt", service.adprojectcnt(prook));
		System.out.println(admin);
		logger.info("adminMain GET");
		mv.setViewName("admin/adminmain");
		return mv;
	}

	// 관리자 회원 승인 페이지 Get
	@RequestMapping(value = "/aduserapprovelist", method = RequestMethod.GET)
	public ModelAndView aduserapprovelistGet(ModelAndView mv, HttpSession session, 
			HttpServletRequest req, @ModelAttribute("adminloginSsInfo")Admin admin)
			throws Exception {
		session.getAttribute("adminloginSsInfo");
		logger.info("aduserapprovelist GET");
		int us_ok = 0;
		mv.addObject("aduserapprovelist", service.aduserapprove(us_ok));
		mv.setViewName("admin/aduserapprovelist");
		return mv;
	}

	// 관리자 회원 승인 POST
	@PostMapping("/adprouserok")
	public ModelAndView adprouserokPOST(ModelAndView mv, HttpSession session, HttpServletResponse response, RedirectAttributes rttr,
			@RequestParam("us_id")String usid
			,@ModelAttribute("adminloginSsInfo")Admin admin) throws Exception {
		logger.info("adprojectapprove POST");
		session.getAttribute("adminloginSsInfo");
		service.updateuserok(usid);
		rttr.addFlashAttribute("userapprove", "승인되었습니다.");
		mv.setViewName("redirect:/aduserapprovelist");
		return mv;
	}

	// 관리자 프로젝트 공고 승인 페이지 Get
	@RequestMapping(value = "/adprojectapprove", method = RequestMethod.GET)
	public ModelAndView adprojectapproveGet(ModelAndView mv, HttpSession session, @ModelAttribute("adminloginSsInfo")Admin admin,
			HttpServletResponse response) throws Exception {
		logger.info("adprojectapprove GET");
		session.getAttribute("adminloginSsInfo");
		int pro_ok = 0;
		mv.addObject("adprojectapprove", service.adprojectapprove(pro_ok));
		mv.setViewName("admin/adprojectapprove");
		return mv;
	}

	// 관리자 프로젝트 공고 승인 POST
	@PostMapping("/adprojectok")
	public ModelAndView adprojectokPOST(ModelAndView mv, HttpSession session,RedirectAttributes rttr,
			@RequestParam("pro_no") int prono
			, @ModelAttribute("adminloginSsInfo")Admin admin) throws Exception {
		logger.info("adprojectapprove POST");
		session.getAttribute("adminloginSsInfo");
		service.updateprojectok(prono);
		rttr.addFlashAttribute("projectapprove", "승인되었습니다.");
		mv.setViewName("redirect:/adprojectapprove");
		return mv;
	}
	//관리자 회원 검색
	@RequestMapping(value="/adsearchuser", method=RequestMethod.GET)
	public ModelAndView adsearchuser(ModelAndView mv, 
			@ModelAttribute("adminloginSsInfo")Admin admin, HttpSession session
			, @RequestParam("searchuser")String searchuser, HttpServletResponse response, Prouser prouser, RedirectAttributes rttr)throws Exception{
		logger.info("Admin search user");
		session.getAttribute("adminloginSsInfo");
		session.getAttribute(searchuser);
		Prouser result = service.adsearchuser(searchuser);
		if(result != null) {
			logger.info("searchuser success");
			mv.addObject("adsearchuser", service.adsearchuser(searchuser));
			mv.setViewName("admin/adsearchuser");
		}else {
			logger.info("searchuser fail");
			rttr.addFlashAttribute("search", "일치하는 회원이 없습니다.");
			mv.setViewName("redirect:/adminmain");
		}
		return mv;
	}
}
