package fin.spring.projob;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fin.spring.projob.home.service.HomeService;
import fin.spring.projob.prouser.vo.Prouser;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	HomeService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession ss, RedirectAttributes rttr) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		if(ss.getAttribute("loginSsInfo") != null) {
			Prouser userInfo = (Prouser) ss.getAttribute("loginSsInfo");
			String userId = userInfo.getUs_id();
			model.addAttribute("userInfo", userId);
		}
		List<Map<String, Object>> list = service.selectMainProject();
		String totalcnt = service.selectProjectTotalCnt();
//		String ingcnt = service.selectProjectIngCnt();
		model.addAttribute("totalcnt", totalcnt);
		model.addAttribute("list", list);
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
}
