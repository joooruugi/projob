package fin.spring.projob.prouser.controller;

import javax.inject.Inject;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fin.spring.projob.prouser.service.ProuserService;
import fin.spring.projob.prouser.service.ProuserServiceImpl;
import fin.spring.projob.prouser.vo.Prouser;

@Controller
public class ProuserController {

	private static final Logger logger = LoggerFactory.getLogger(ProuserController.class);

	@Autowired
	private ProuserServiceImpl service;

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
	public ModelAndView infofreepost(ModelAndView mv, Prouser prouser, RedirectAttributes rttr, HttpServletRequest req)
			throws Exception {
		logger.info("join for freelancer_POST");
		int result = service.insertProuserfree(prouser);
		if (result < 1) {
			rttr.addFlashAttribute("msg", " 가입에 실패하였습니다.");
			mv.setViewName("redirect:/infofree");
			return mv;
		}
		mv.setViewName("redirect:/");
		return mv;
	}

	// 회원가입 사용자>기업 정보입력 화면GET(회원가입3)
	@RequestMapping(value = "/infocomp", method = RequestMethod.GET)
	public ModelAndView infocomp(ModelAndView mv) {
		logger.info("join for company_GET");
		mv.setViewName("prouser/infocomp");
		return mv;
	}

	// 회원가입 사용자>기업 정보입력 화면POST1(회원가입3)
	@PostMapping("/infocomp")
	public ModelAndView infocomppost(ModelAndView mv, Prouser prouser, RedirectAttributes rttr, HttpServletRequest req)
			throws Exception {
		logger.info("join for company_POST");
		int result = service.insertProusercomp(prouser);
		if (result < 1) {
			rttr.addFlashAttribute("msg", " 가입에 실패하였습니다.");
			mv.setViewName("redirect:/infocomp");
			return mv;
		}
		mv.setViewName("redirect:/");
		return mv;
	}

	//회원가입 사용자>프리랜서 아이디 중복확인
	@RequestMapping(value="/usidChk", method=RequestMethod.POST)
	@ResponseBody
	public String usidChkPOST(String us_id) throws Exception{
//		logger.info("usidChk() 진입");
		int result = service.idchk(us_id);
		logger.info("결과값 = " + result);
		if(result != 0) {
			return "fail";
		}else {
			return "success";
		}
		
	}
	// 사용자 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("prouser/login");
		return mv;
	}
}
