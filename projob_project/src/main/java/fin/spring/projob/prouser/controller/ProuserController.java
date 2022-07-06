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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fin.spring.projob.prouser.service.ProuserService;
import fin.spring.projob.prouser.service.ProuserServiceImpl;
import fin.spring.projob.prouser.vo.Kakao;
import fin.spring.projob.prouser.vo.Prouser;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@SessionAttributes("loginSsInfo")
public class ProuserController {

	private static final Logger logger = LoggerFactory.getLogger(ProuserController.class);

	@Autowired
	private ProuserServiceImpl service;
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
		if (result != null && passEncoder.matches(prouser.getUs_pw(), result.getUs_pw())) {
			logger.info("Login POST");
			System.out.println(result.getUs_info());
			session.setAttribute("loginSsInfo", result);
			if (result.getUs_ok() == 0) {
				mv.setViewName("prouser/waitjoin");
			} else if (result.getUs_ok() == 1) {
				mv.setViewName("prouser/join");
			} else if (result.getUs_ok() == 2) {
				mv.setViewName("prouser/join");
			}
			return mv;
		} else {
//			rttr.addFlashAttribute("`", "로그인에 실패했습니다. 아이디와 패스워드를 다시 확인해주세요.");
			mv.setViewName("redirect:/login");
			return mv;
		}
	}

	// 카카오 로그인
	@RequestMapping(value = "/kakaologin", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session)
			throws Exception {
		System.out.println("#####" + code);
		String access_Token = service.getAccessToken(code);

		Kakao prouserinfo = service.prouserinfo(access_Token);
		System.out.println("###access_Token### : " + access_Token);
		System.out.println("###nickname#### : " + prouserinfo.getKakao_name());
//		System.out.println("###email#### : " + prouserinfo.getKakao_email());
		if (session != null) {
			session.invalidate();
		}
		// 위 코드는 session객체에 담긴 정보를 초기화 하는 코드.
		session.setAttribute("loginSsInfo", prouserinfo);
		session.setAttribute("kakaoN", prouserinfo.getKakao_name());
//		session.setAttribute("kakaoE", prouserinfo.getKakao_email());
		// 위 2개의 코드는 닉네임과 이메일을 session객체에 담는 코드
		// jsp에서 ${sessionScope.kakaoN} 이런 형식으로 사용할 수 있다.
		return "prouser/login";

	}

	// 사용자 아이디 찾기 get
	@RequestMapping(value = "/findid", method = RequestMethod.GET)
	public ModelAndView findidget(ModelAndView mv) {
		logger.info("findid GET");
		mv.setViewName("prouser/findid");
		return mv;
	}

	// 사용자 아이디 찾기 post
	@ResponseBody
	@PostMapping(value = "/findid")
	public ModelAndView findidpost(ModelAndView mv, Prouser prouser, HttpServletRequest request,
			RedirectAttributes rttr) throws Exception {
		logger.info("findid POST");
		Prouser result = service.findid(prouser);
		if (result != null) {
			logger.info("findid success");
			logger.info(result.getUs_id());
//			mv.addObject("msg", result.getUs_name()+"님의 아이디는  "+result.getUs_id()+" 입니다.");
			mv.addObject("us_name", result.getUs_name());
			mv.addObject("us_id", result.getUs_id());
			mv.setViewName("prouser/home");
			return mv;
		} else {
			logger.info("findid fail");
			request.setAttribute("msg", "일치하는 회원이 없습니다.");
			mv.setViewName("redirect:/findid");
			return mv;
		}
	}

	// 사용자 비밀번호 찾기 get
	@RequestMapping(value = "/findpw", method = RequestMethod.GET)
	public ModelAndView findpwget(ModelAndView mv) {
		mv.setViewName("prouser/findpw");
		return mv;
	}

	// 사용자 비밀번호 찾기 post
	@PostMapping(value = "/findpw")
	public ModelAndView findpwpost(ModelAndView mv, Prouser prouser, RedirectAttributes rttr) throws Exception {
		logger.info("findpw POST");
		int result = service.findpw(prouser);
		if (result != 0) {
			logger.info("findpw success");
			mv.setViewName("redirect:/updatepw");
		} else {
			logger.info("findpw fail");
			mv.setViewName("redirect:/findpw");
		}
		return mv;
	}

	// 사용자 비밀번호 재설정 get
	@RequestMapping(value = "/updatepw", method = RequestMethod.GET)
	public ModelAndView updatepwGet(ModelAndView mv, Prouser prouser) {
		logger.info("updatepw GET");
		mv.setViewName("prouser/updatepw");
		return mv;
	}

	// 사용자 비밀번호 재설정 post
	@RequestMapping(value = "/updatepw", method = RequestMethod.POST)
	public ModelAndView updatepwPost(ModelAndView mv, Prouser prouser, @RequestParam(value = "us_id") String us_id)
			throws Exception {
		logger.info("updatepw POST");
		int result = service.updatepw(prouser);
		if (result != 0) {
			logger.info("updatepw success");
			mv.setViewName("redirect:/login");
		} else {
			logger.info("updatepw fail");
			mv.setViewName("redirect:/updatepw");
		}
		return mv;
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(ModelAndView mv, HttpSession session) {
		session.invalidate();
		logger.info("Prouser logout");
		mv.setViewName("prouser/login");
		return mv;
	}

	// 관리자 승인 전 대기화면
	@RequestMapping(value = "/waitjoin", method = RequestMethod.GET)
	public ModelAndView waitjoinGet(ModelAndView mv, @ModelAttribute("loginSsInfo") Prouser prouser) throws Exception {
		mv.setViewName("prouser/waitjoin");
		return mv;
	}

	// 마이페이지 메인
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView mypageGet(ModelAndView mv, HttpSession session, @ModelAttribute("loginSsInfo") Prouser prouser)
			throws Exception {
		session.getAttribute("loginSsInfo");
		session.setAttribute("us_name", prouser.getUs_name());
//		System.out.println(session);
//		System.out.println(prouser);
//		System.out.println("mypagemain session info: " + prouser.getUs_info());
		if (prouser.getUs_info() == 0) {
			mv.setViewName("mypage/mypagefree");
		} else {
			mv.setViewName("mypage/mypagecomp");
		}
		return mv;
	}

	// 마이페이지 본인확인 GET
	@RequestMapping(value = "/checkforupdate", method = RequestMethod.GET)
	public ModelAndView checkforupdateGet(ModelAndView mv, HttpSession session,
			@ModelAttribute("loginSsInfo") Prouser prouser) throws Exception {
		session.getAttribute("loginSsInfo");
		System.out.println("session information of checkforupdate"+prouser);
		logger.info("checkforupdate GET");
		System.out.println(prouser);
		mv.setViewName("mypage/checkforupdate");
		return mv;
	}

//	int result = service.findpw(prouser);
//	if (result != 0) {
//		logger.info("findpw success");
//		mv.setViewName("redirect:/updatepw");
//	} else {
//		logger.info("findpw fail");
//		mv.setViewName("redirect:/findpw");
//	}
//	return mv;
	// 마이페이지 본인확인 POST
	@PostMapping(value = "/checkforupdate")
	public ModelAndView checkforupdatePost(ModelAndView mv, HttpSession session,
			@ModelAttribute("loginSsInfo") Prouser prouser
			, @RequestParam("us_pw") String us_pwchk) throws Exception {
		session.getAttribute("loginSsInfo");
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securepw = encoder.encode(us_pwchk);
		System.out.println("session information of checkforupdate"+prouser);
		if(passEncoder.matches(prouser.getUs_pw(), securepw) && prouser.getUs_info()==0) {
			logger.info("checkforupdate for freelancer success");
			mv.setViewName("mypage/updateinfofree");
		}else if(passEncoder.matches(prouser.getUs_pw(), securepw) && prouser.getUs_info()==1){
			logger.info("checkforupdate for company success");
			mv.setViewName("mypage/updateinfocomp");
		}else {
			logger.info("checkforupdate for somebody fail");
			mv.setViewName("redirect:/checkforupdate");
		}
		return mv;
	}

	// 마이페이지 정보수정 GET
	@RequestMapping(value = "/updateinfo", method = RequestMethod.GET)
	public ModelAndView updateinfo(ModelAndView mv, HttpSession session
			, @ModelAttribute("loginSsInfo") Prouser prouser)
			throws Exception {
		logger.info("updateinfoGet");
		session.getAttribute("loginSsInfo");
		System.out.println(prouser);
		session.setAttribute("us_phone", prouser.getUs_phone());
		session.setAttribute("us_email", prouser.getUs_email());
		session.setAttribute("us_address", prouser.getUs_address());
		session.setAttribute("us_address2", prouser.getUs_address2());
		session.setAttribute("us_address3", prouser.getUs_address3());
		if (prouser.getUs_info() == 0) {
			mv.setViewName("mypage/updateinfofree");
		} else {
			session.setAttribute("us_adname", prouser.getUs_adname());
			session.setAttribute("us_adphone", prouser.getUs_adphone());
			session.setAttribute("us_ademail", prouser.getUs_ademail());
			mv.setViewName("mypage/updateinfocomp");
		}
		return mv;
	}
	//마이페이지 정보수정 POST
	//마이페이지 이력서 관리 GET
	
}
