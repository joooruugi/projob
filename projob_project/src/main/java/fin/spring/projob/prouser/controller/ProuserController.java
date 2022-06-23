package fin.spring.projob.prouser.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProuserController {

	//ȸ������ ����� ���� ȭ��(ȸ������1)
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public ModelAndView join(ModelAndView mv) {
		mv.setViewName("prouser/join");
		return mv;
	}
	//ȸ������ ����� ������� ȭ��(ȸ������2)
	@RequestMapping(value="/terms",  method=RequestMethod.GET)
	public ModelAndView terms(ModelAndView mv) {
		mv.setViewName("prouser/terms");
		return mv;
	}
	//ȸ������ �����>�������� �����Է� ȭ��(ȸ������3)
	@RequestMapping(value="/infofree",  method=RequestMethod.GET)
	public ModelAndView infofree(ModelAndView mv) {
		mv.setViewName("prouser/infofree");
		return mv;
	}
	//ȸ������ �����>��� �����Է� ȭ��(ȸ������3)
	@RequestMapping(value="/infocomp",  method=RequestMethod.GET)
	public ModelAndView infocomp(ModelAndView mv) {
		mv.setViewName("prouser/infocomp");
		return mv;
	}
}
