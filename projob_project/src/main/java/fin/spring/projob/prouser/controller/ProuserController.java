package fin.spring.projob.prouser.controller;

import java.util.HashMap;

import java.util.Map;

import javax.inject.Inject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fin.spring.projob.prouser.dao.ProuserDaoImpl;
import fin.spring.projob.prouser.service.ProuserService;
import fin.spring.projob.prouser.service.ProuserServiceImpl;
import fin.spring.projob.prouser.vo.Prouser;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ProuserController {

	private static final Logger logger = LoggerFactory.getLogger(ProuserController.class);

	@Autowired
	private ProuserServiceImpl service;
	private ProuserDaoImpl pdao;
	BCryptPasswordEncoder passEncoder;

	// 회원가입 사용자 선택 화면(회원가입1)
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public ModelAndView join(ModelAndView mv) {
		mv.setViewName("prouser/join");
		logger.info("join");
		return mv;
	}

	// 회원가입 사용자>프리랜서 약관동의 화면(회원가입2)
	@RequestMapping(value = "/termsfree", method = RequestMethod.GET)
	public ModelAndView termsfree(ModelAndView mv) {
		mv.setViewName("prouser/termsfree");
		logger.info("termsfree");
		return mv;
	}

	// 회원가입 사용자>기업 약관동의 화면(회원가입2)
	@RequestMapping(value = "/termscomp", method = RequestMethod.GET)
	public ModelAndView termscomp(ModelAndView mv) {
		mv.setViewName("prouser/termscomp");
		logger.info("termscomp");
		return mv;
	}

	// 회원가입 사용자>프리랜서 정보입력 화면GET(회원가입3)
	@RequestMapping(value = "/infofree", method = RequestMethod.GET)
	public ModelAndView infofree(ModelAndView mv) {
		mv.setViewName("prouser/infofree");
		logger.info("join for freelancer_GET");
		return mv;
	}

	// 회원가입 사용자>프리랜서 정보입력 화면POST(회원가입3)
	@PostMapping("/infofree")
	// @ResponseBody
	public ModelAndView infofreepost(ModelAndView mv, Prouser prouser, RedirectAttributes rttr, HttpServletRequest req)
			throws Exception {
		logger.info("join for freelancer_POST");
		int result = service.insertProuserfree(prouser);
		if (result < 1) {
			rttr.addFlashAttribute("msg", " 가입에 실패하였습니다.");
			mv.setViewName("redirect:/infofree");
			return mv;
		}
		mv.setViewName("redirect:/login");
		return mv;
	}

	// 회원가입 사용자>기업 정보입력 화면GET(회원가입3)
	@RequestMapping(value = "/infocomp", method = RequestMethod.GET)
	public ModelAndView infocomp(ModelAndView mv) {
		logger.info("join for company_GET");
		mv.setViewName("prouser/infocomp");
		return mv;
	}

//	// 회원가입 사용자>기업 정보입력 화면POST1(회원가입3)
	@PostMapping("/infocomp")
	// @ResponseBody
	public ModelAndView infocomppost(ModelAndView mv, Prouser prouser, RedirectAttributes rttr, HttpServletRequest req)
			throws Exception {
		logger.info("join for company_POST");
		int result = service.insertProusercomp(prouser);
		if (result < 1) {
			rttr.addFlashAttribute("msg", " 가입에 실패하였습니다.");
			mv.setViewName("redirect:/infofree");
			return mv;
		}
		mv.setViewName("redirect:/login");
		return mv;
	}

	// 회원가입 사용자 아이디 중복확인
	@PostMapping(value = "/idchk")
	@ResponseBody
	public int idchk(@RequestParam("us_id") String us_id) throws Exception {
//		logger.info("idchk");
		int result = service.idchk(us_id);
//		logger.info("Controller"+result);
		return result;
	}

	// 회원가입 사용자 이메일 중복확인
	@PostMapping(value = "/emailchk")
	@ResponseBody
	public int emailchk(@RequestParam("us_email") String us_email) throws Exception {
		int result_e = service.emailchk(us_email);
		return result_e;
	}

	// 사용자 로그인 get
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginget(ModelAndView mv) {
		logger.info("login");
		mv.setViewName("prouser/login");
		return mv;
	}

	// 사용자 로그인(post) us_id만 가져가서 비교 > 암호화된 비밀번호와 입력한 비밀번호가 일치하는지 확인
	@PostMapping(value = "/login")
	public ModelAndView login(ModelAndView mv, Prouser prouser, RedirectAttributes rttr, HttpSession session)
			throws Exception {
		Prouser result = service.login(prouser);
		if (result != null && passEncoder.matches(prouser.getUs_pw(), prouser.getUs_pw())) {
			session.setAttribute("loginSsInfo", result);
			rttr.addFlashAttribute("msg", prouser.getUs_name() + "님 로그인되었습니다.");
			mv.setViewName("redirect:prouser/login");
			return mv;
		} else {
			rttr.addFlashAttribute("msg", "로그인에 실패했습니다. 아이디와 패스워드를 다시 확인해주세요.");
			mv.setViewName("redirect:/");
			return mv;
		}
	}
}
