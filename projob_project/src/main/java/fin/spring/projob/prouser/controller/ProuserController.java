package fin.spring.projob.prouser.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fin.spring.projob.common.ScriptUtils;
import fin.spring.projob.prouser.service.ProuserService;
import fin.spring.projob.prouser.vo.Career;
import fin.spring.projob.prouser.vo.Certificate;
import fin.spring.projob.prouser.vo.Kakao;
import fin.spring.projob.prouser.vo.Prouser;
import fin.spring.projob.prouser.vo.Resume;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@SessionAttributes("loginSsInfo")
public class ProuserController {

	private static final Logger logger = LoggerFactory.getLogger(ProuserController.class);

	@Autowired
	private ProuserService service;
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
	@ResponseBody
	public ModelAndView infofreepost(ModelAndView mv, Prouser prouser, RedirectAttributes rttr, HttpServletRequest req)
			throws Exception {
		logger.info("join for freelancer_POST");
		int result = service.insertProuserfree(prouser);
		if (result < 1) {
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
	public ModelAndView infocomppost(ModelAndView mv, Prouser prouser, HttpServletResponse response, RedirectAttributes rttr, HttpServletRequest req)
			throws Exception {
		logger.info("join for company_POST");
		int result = service.insertProusercomp(prouser);
		if (result < 1) {
			ScriptUtils.alert(response, "가입에 실패하였습니다. 정보를 다시 입력해주세요.");
			mv.setViewName("redirect:/infofree");
			return mv;
		}
		ScriptUtils.alert(response, "환영합니다!");
		mv.setViewName("redirect:/login");
		return mv;
	}

	// 회원가입 사용자 아이디 중복확인
	@PostMapping(value = "/idchk")
	@ResponseBody
	public int idchk(@RequestParam("us_id") String us_id) throws Exception {
		int result = service.idchk(us_id);
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
	public ModelAndView login(ModelAndView mv, Prouser prouser, RedirectAttributes rttr, HttpSession session
			,HttpServletRequest req)
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
	public ModelAndView findidpost(ModelAndView mv, HttpServletResponse response, Prouser prouser, HttpServletRequest request,
			RedirectAttributes rttr) throws Exception {
		logger.info("findid POST");
		Prouser result = service.findid(prouser);
		if (result != null) {
			logger.info("findid success");
			logger.info(result.getUs_id());
//			mv.addObject("msg", result.getUs_name()+"님의 아이디는  "+result.getUs_id()+" 입니다.");
			ScriptUtils.alert(response, result.getUs_name()+"님의 아이디는 "+result.getUs_id()+" 입니다.");
			mv.setViewName("prouser/login");
			return mv;
		} else {
			logger.info("findid fail");
			ScriptUtils.alert(response, "등록된 회원정보가 없습니다.");
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
	public ModelAndView logout(ModelAndView mv, HttpServletResponse response, HttpSession session)throws Exception {
		logger.info("Prouser logout");
		ScriptUtils.alert(response, "로그아웃 되었습니다.");
		mv.setViewName("redirect:/");
		session.invalidate();
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
		//진행중인 프로젝트 조회 (기업, 프리랜서)
		if(prouser.getUs_info()==0) {
			mv.addObject("freeprojectyetcnt", service.freeprojectyetcnt(prouser.getUs_id()));
			mv.addObject("freeprojectcnt", service.freeprojectcnt(prouser.getUs_id()));
			mv.addObject("freeprojectyetinfo", service.freeprojectyetinfo(prouser.getUs_id()));
			mv.addObject("freeprojectinfo", service.freeprojectinfo(prouser.getUs_id()));
		}else {
			mv.addObject("compprojectyetcnt", service.compprojectyetcnt(prouser.getUs_id()));
			mv.addObject("compprojectcnt", service.compprojectcnt(prouser.getUs_id()));
			mv.addObject("compprojectyetinfo", service.compprojectyetinfo(prouser.getUs_id()));
			mv.addObject("compprojectinfo", service.compprojectinfo(prouser.getUs_id()));
			
		}
		mv.setViewName("mypage/mypage");
		return mv;
	}

	// 마이페이지 본인확인 GET
	@RequestMapping(value = "/checkforupdate", method = RequestMethod.GET)
	public ModelAndView checkforupdateGet(ModelAndView mv, HttpSession session,
			@ModelAttribute("loginSsInfo") Prouser prouser) throws Exception {
		session.getAttribute("loginSsInfo");
		logger.info("checkforupdate GET");
		System.out.println(prouser);
		mv.setViewName("mypage/checkforupdate");
		return mv;
	}

	// 마이페이지 본인확인 POST
	@PostMapping(value = "/checkforupdate")
	public ModelAndView checkforupdatePost(ModelAndView mv, HttpSession session,
			@ModelAttribute("loginSsInfo") Prouser prouser, @RequestParam("us_pw") String us_pwchk) throws Exception {
		session.getAttribute("loginSsInfo");
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securepw = encoder.encode(us_pwchk);
		System.out.println("session information of checkforupdate" + prouser);
		if (passEncoder.matches(prouser.getUs_pw(), securepw)) {
			logger.info("checkforupdate success");
			mv.setViewName("redirect:/updateinfo");
		} else {
			logger.info("checkforupdate  fail");
			mv.setViewName("redirect:/checkforupdate");
		}
		return mv;
	}

	// 마이페이지 정보수정 GET
	@RequestMapping(value = "/updateinfo", method = RequestMethod.GET)
	public ModelAndView updateinfoGet(ModelAndView mv, HttpSession session,
			@ModelAttribute("loginSsInfo") Prouser prouser) throws Exception {
		logger.info("updateinfo Get");
		session.getAttribute("loginSsInfo");
		System.out.println("session information of updateinfo" + prouser);
		String us_id = prouser.getUs_id();
		mv.addObject("updatemyinfo", service.myinfo(us_id));
		mv.setViewName("mypage/updateinfo");
		return mv;
	}

	// 마이페이지 정보수정 POST
	@PostMapping("/updateinfo")
	public ModelAndView updateinfoPost(ModelAndView mv, HttpSession session,
			@ModelAttribute("loginSsInfo") Prouser prouser, HttpServletResponse response) throws Exception {
		logger.info("updateinfo POST");
		session.getAttribute("loginSsInfo");
		int result = service.updateInfo(prouser);
		if (result < 1) {
			logger.info("updateInfo fail");
			ScriptUtils.alertAndBackPage(response, "정보수정에 실패했습니다. 재시도해주세요.");
		} else {
			logger.info("updateInfo success");
			ScriptUtils.alert(response, "정보수정이 완료되었습니다.");
			mv.setViewName("mypage/mypage");
		}
		return mv;
	}

	// 마이페이지 이력서 관리 GET
	@RequestMapping(value = "/resumelist", method = RequestMethod.GET)
	public ModelAndView resumelistGet(ModelAndView mv, HttpSession session,
			@ModelAttribute("loginSsInfo") Prouser prouser, Resume resume) throws Exception {
		logger.info("resume list Get");
		session.getAttribute("loginSsInfo");
		System.out.println(prouser);
		mv.addObject("resumelist", service.resumelist(prouser.getUs_id()));
		mv.setViewName("mypage/resumelist");
		return mv;
	}
	//마이페이지 이력서 상세조회 GET
	@RequestMapping(value="/resume", method=RequestMethod.GET)
	public ModelAndView resumeGet(ModelAndView mv
			,@ModelAttribute("loginSsInfo")Prouser prouser
			, HttpSession session
			, Resume resume, Career career
			,Certificate certi )throws Exception{
		logger.info("resume GET");
		session.getAttribute("loginSsInfo");
		mv.addObject("resume", service.resume(resume.getRe_no()));
		mv.addObject("resumeimg", service.resumeimg(resume.getRe_no()));
		System.out.println(resume);
		mv.addObject("career", service.career(resume.getRe_no()));
		mv.addObject("certi", service.certi(resume.getRe_no()));
		mv.setViewName("mypage/resume");
		return mv;
	}
	// 마이페이지 이력서 등록하기 GET
	@RequestMapping(value = "/resumeinsert", method = RequestMethod.GET)
	public ModelAndView resumeinsertGet(ModelAndView mv, HttpSession session,
			@ModelAttribute("loginSsInfo") Prouser prouser) throws Exception {
		logger.info("resumeinsert Get");
		session.getAttribute("loginSsInfo");
		mv.setViewName("mypage/resumeinsert");
		return mv;
	}

	// 마이페이지 이력서 등록하기 POST
	@PostMapping("/resumeinsert")
	public ModelAndView resumeinsertPost(ModelAndView mv, HttpSession session,
			@ModelAttribute("loginSsInfo") Prouser prouser, Resume resume, Career career, Certificate certi,
			HttpServletRequest req, HttpServletResponse response
			) throws Exception {
		logger.info("resumeinsert POST");
		session.getAttribute("loginSsInfo"); //로그인된 정보 불러오기
		resume.setUs_id(prouser.getUs_id()); //이력서us_id에 세션아이디값 넣어주기
		int result = service.resumeinsert(resume, req);
		System.out.println("이력서에 들어간 값 조회:"+resume);
		int resultcar = service.resumeinsertcareer(career);
		
		int resultcerti = service.resumeinsertcerti(certi);
		if (result < 1 || resultcar < 1 || resultcerti < 1) {
			logger.info("resume insert fail");
			mv.setViewName("redirect:/resumeinsert");
		} else {
			ScriptUtils.alert(response, "이력서 등록 완료. 공개처리 하셔야 기업에 공개됩니다.");
			logger.info("resume insert success");
			mv.setViewName("mypage/mypage");
		}
		return mv;
	}
	
	//개별 이력서 조회(이력서 번호 가져옴)
	@RequestMapping(value="/resumeview", method=RequestMethod.GET)
	public ModelAndView resumeviewGet(ModelAndView mv,
			HttpSession session
			, @ModelAttribute("loginSsInfo")Prouser prouser
			, Resume resume, Certificate certi, Career career
			, @RequestParam("re_no")int re_no)throws Exception{
		logger.info("resumeview GET");
		session.getAttribute("loginSsInfo");
		mv.addObject("resume", service.resume(re_no));
		mv.addObject("career", service.career(re_no));
		mv.addObject("certi", service.certi(re_no));
		mv.setViewName("mypage/resumeview");
		return mv;
	}

}
