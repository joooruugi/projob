package fin.spring.projob.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import fin.spring.projob.company.service.CompanyService;
import fin.spring.projob.company.vo.Company;

@Controller
@RequestMapping("/comp")
public class CompanyController {

	@Autowired
	private CompanyService service;
	
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public ModelAndView insertCompany(
			ModelAndView mv) {
		mv.setViewName("comp/info");
		return mv;
	}
	
	@RequestMapping(value="/insert" , method=RequestMethod.POST)
	public ModelAndView insertCompany(
			ModelAndView mv
			, Company company) {
		int result = service.insertCompany(company);
		mv.setViewName("redirect:/");
		return mv;
	}
	
}
