package fin.spring.projob.prouser.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProuserController {

	//회원가입 사용자 선택 화면(회원가입1)
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public ModelAndView join(ModelAndView mv) {
		mv.setViewName("prouser/join");
		return mv;
	}
	//회원가입 사용자 약관동의 화면(회원가입2)
	@RequestMapping(value="/terms",  method=RequestMethod.GET)
	public ModelAndView terms(ModelAndView mv) {
		mv.setViewName("prouser/terms");
		return mv;
	}
	//회원가입 사용자>프리랜서 정보입력 화면(회원가입3)
	@RequestMapping(value="/infofree",  method=RequestMethod.GET)
	public ModelAndView infofree(ModelAndView mv) {
		mv.setViewName("prouser/infofree");
		return mv;
	}
	//회원가입 사용자>기업 정보입력 화면(회원가입3)
	@RequestMapping(value="/infocomp",  method=RequestMethod.GET)
	public ModelAndView infocomp(ModelAndView mv) {
		mv.setViewName("prouser/infocomp");
		return mv;
	}
}
