package fin.spring.projob.admin.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fin.spring.projob.admin.service.AdminServiceImpl;
import fin.spring.projob.admin.vo.Admin;
import fin.spring.projob.prouser.controller.ProuserController;
import fin.spring.projob.prouser.service.ProuserServiceImpl;
import fin.spring.projob.prouser.vo.Prouser;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@SessionAttributes("adminloginSsInfo")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(ProuserController.class);

	@Autowired
	private AdminServiceImpl service;

	// 관리자 로그인 get
	@RequestMapping(value = "/adlogin", method = RequestMethod.GET)
	public ModelAndView adloginGet(ModelAndView mv) {
		logger.info("adminlogin");
		mv.setViewName("admin/adminlogin");
		return mv;
	}
	//관리자 로그인 post
	@PostMapping(value="/adlogin")
	public ModelAndView adloginPost(ModelAndView mv
			, Admin admin, HttpSession session)throws Exception{
		Admin result = service.adlogin(admin);
		if(result != null) {
			session.setAttribute("adminloginSsInfo", admin);
			logger.info("AdminLogin POST");
			mv.setViewName("admin/adminmain");
		}else {
			mv.setViewName("redirect:/adlogin");
		}
		return mv;
	}
	//관리자 로그아웃
	@RequestMapping(value="/adlogout", method=RequestMethod.GET)
	public ModelAndView adlogout(ModelAndView mv, HttpSession session) {
		session.invalidate();
		logger.info("Admin logout");
		mv.setViewName("/home");
		return mv;
	}
	
}
