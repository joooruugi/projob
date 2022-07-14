package fin.spring.projob.fileshare.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import fin.spring.projob.fileshare.service.FileshareService;
import fin.spring.projob.fileshare.vo.FIleshare;
import fin.spring.projob.project.vo.Project;
import fin.spring.projob.prouser.vo.Prouser;
import lombok.AllArgsConstructor;

@Controller
@RequestMapping("fileshare")
public class FileshareController {
	
	@Autowired
	public FileshareService service;
	
	// fileshare 페이지 이동
	@RequestMapping("")
	public ModelAndView fileshare(
			ModelAndView mv,
			@RequestParam(value = "pro_no", defaultValue = "0") String pro_no,
			HttpSession ss
			) {
		Prouser prouser = (Prouser)ss.getAttribute("loginSsInfo");
		if(prouser == null) {
			mv.setViewName("redirect:login");
			return mv;
		}
		//프로젝트 목록
		String us_id = prouser.getUs_id();
		List<Project> project = service.selectProject(us_id);
		//프로젝트별 파일공유 리스트
		List<Map<String, Object>> list = service.selectFileshareList(pro_no);
		
		mv.addObject("pro_no", pro_no);
		mv.addObject("project", project);
		mv.addObject("list", list);
		mv.setViewName("fileshare/fileshare");
		return mv;
	}
	
	// 파일등록 페이지 이동
	@RequestMapping("write")
	public ModelAndView fileshareWrite(
			ModelAndView mv
			) {
		
		mv.setViewName("fileshare/fileshare_write");
		return mv;
	}
	
	@RequestMapping(value = "fileupload", method= RequestMethod.POST)
	@ResponseBody
	public String fileshareWriteinsert(
			MultipartHttpServletRequest files
			) {
		System.out.println("컨트롤러 들어왔나?");
		Map<String, MultipartFile> map = files.getFileMap();
		for(int i =0 ; i < map.size(); i++) {
			savefile(map.get("files["+i+"]"));
		}
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String str = gson.toJson(map);
		return null;
	}
	public void savefile(MultipartFile file) {
		System.out.println(file);
	}
}
