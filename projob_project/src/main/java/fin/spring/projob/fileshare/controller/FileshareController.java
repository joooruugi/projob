package fin.spring.projob.fileshare.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.transaction.annotation.Transactional;
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
import fin.spring.projob.fileshare.vo.FileshareFile;
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
			@RequestParam(value = "page_no", defaultValue = "1") String page_no,
			@RequestParam(value = "p", defaultValue = "1") String p, 
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
		
		int currentPage = Integer.parseInt(p);
		System.out.println("선택된 페이지 : " + currentPage);
		//페이지 리스트 갯수
		final int pageSize = 10;
		//페이지 선택 갯수
		final int pageBlock =5;
		
		//총 페이지 갯수 구하기
		int totalCnt = service.selectCountShareList(pro_no);
		
		// paging 처리
		// 총 페이지 수
		int pageCnt = (totalCnt/pageSize) + (totalCnt%pageSize==0 ? 0 : 1);
		int startPage = 1;
		int endPage = 1;
		if(currentPage%pageBlock == 0) {
			startPage = ((currentPage/pageBlock)-1)*pageBlock + 1;
		} else {
			startPage = (currentPage/pageBlock)*pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
		
		// rownum 처리
		int startRnum = 0;
		int endRnum = 0;
		startRnum = (currentPage-1)*pageSize + 1;
		endRnum = startRnum + pageSize - 1;
		if(endRnum > totalCnt) {
			endRnum = totalCnt;
		}
		
		//파일공유 리스트
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pro_no", pro_no);
		map.put("startPage", startRnum);
		map.put("endPage", endRnum);
		List<Map<String, Object>> list = service.selectFileshareList(map);
		
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("pageCnt", pageCnt);
		mv.addObject("currentPage", currentPage);
		
		mv.addObject("pro_no", pro_no);
		mv.addObject("project", project);
		mv.addObject("list", list);
		mv.setViewName("fileshare/fileshare");
		return mv;
	}
	
	// fileshare 검색 페이지 이동
		@RequestMapping("search")
		public ModelAndView fileshareSearch(
				ModelAndView mv,
				@RequestParam(value = "pro_no", defaultValue = "0") String pro_no,
				@RequestParam(value = "f", defaultValue = "") String f, 
				@RequestParam(value = "q", defaultValue = "") String q, 
				@RequestParam(value = "p", defaultValue = "1") String p, 
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

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("pro_no", pro_no);
			map.put("content", q);
			
			int currentPage = Integer.parseInt(p);
			System.out.println("선택된 페이지 : " + currentPage);
			//페이지 리스트 갯수
			final int pageSize = 10;
			//페이지 선택 갯수
			final int pageBlock =5;
			
			//총 페이지 갯수 구하기
			int totalCnt = 0;
			
			if(f.equals("1")) {
				//프로젝트별 파일공유 리스트(검색 제목)
				totalCnt = service.selectCounthareListSearchTitle(map);
			} else if(f.equals("2")) {
				//프로젝트별 파일공유 리스트(검색 내용)
				totalCnt = service.selectCounthareListSearchContent(map);
			} else if(f.equals("3")) {
				//프로젝트별 파일공유 리스트(검색 작성자)
				totalCnt = service.selectCounthareListSearchId(map);
			} 
			
			// paging 처리
			// 총 페이지 수
			int pageCnt = (totalCnt/pageSize) + (totalCnt%pageSize==0 ? 0 : 1);
			int startPage = 1;
			int endPage = 1;
			if(currentPage%pageBlock == 0) {
				startPage = ((currentPage/pageBlock)-1)*pageBlock + 1;
			} else {
				startPage = (currentPage/pageBlock)*pageBlock + 1;
			}
			endPage = startPage + pageBlock - 1;
			if(endPage > pageCnt) {
				endPage = pageCnt;
			}
			
			// rownum 처리
			int startRnum = 0;
			int endRnum = 0;
			startRnum = (currentPage-1)*pageSize + 1;
			endRnum = startRnum + pageSize - 1;
			if(endRnum > totalCnt) {
				endRnum = totalCnt;
			}
			
			map.put("startPage", startRnum);
			map.put("endPage", endRnum);
			
			List<Map<String, Object>> list = null;
			if(f.equals("1")) {
				//프로젝트별 파일공유 리스트(검색 제목)
				list = service.selectFileshareListSearchTitle(map);
			} else if(f.equals("2")) {
				//프로젝트별 파일공유 리스트(검색 내용)
				list = service.selectFileshareListSearchContent(map);
			} else if(f.equals("3")) {
				//프로젝트별 파일공유 리스트(검색 작성자)
				list = service.selectFileshareListSearchId(map);
			} 
			
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("pageCnt", pageCnt);
			mv.addObject("currentPage", currentPage);
			
			mv.addObject("f", f);
			mv.addObject("q", q);
			mv.addObject("pro_no", pro_no);
			mv.addObject("project", project);
			mv.addObject("list", list);
			mv.setViewName("fileshare/fileshareSearch");
			return mv;
		}
	
	// 파일등록 페이지 이동
	@RequestMapping("write")
	public ModelAndView fileshareWrite(
			ModelAndView mv,
			HttpSession ss,
			@RequestParam("pro_no") String pro_no
			) {
		Prouser prouser = (Prouser)ss.getAttribute("loginSsInfo");
		if(prouser == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		mv.addObject("pro_no", pro_no);
		mv.addObject("us_id", prouser.getUs_id());
		mv.setViewName("fileshare/fileshare_write");
		return mv;
	}
	
	@RequestMapping(value = "fileupload", method= RequestMethod.POST)
	@ResponseBody
	public String fileupload(
			MultipartHttpServletRequest files
			) {
		Map<String, Object> file = new HashMap<String, Object>();
		// 저장된 파일 경로+이름 저장용
		List<Map<String, Object>> file_list = new ArrayList<Map<String, Object>>();
		// 파일 추출
		Map<String, MultipartFile> map = files.getFileMap();
		for(int i =0 ; i < map.size(); i++) {
			file_list.add(savefile(map.get("files["+i+"]"), files));
		}
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String str = gson.toJson(file_list);
		return str;
	}
	
	@RequestMapping(value = "checkshno", method= RequestMethod.POST)
	@ResponseBody
	@Transactional
	public String checkshno(
			FIleshare fileshare
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String sh_no = service.selectMaxShNo();
		fileshare.setSh_no(sh_no);
		//게시글 등록
		service.insertShare(fileshare);
		map.put("sh_no", sh_no);
		String str = gson.toJson(map);
		return str;
	}
	@RequestMapping(value = "insertFileshare", method= RequestMethod.POST)
	@ResponseBody
	@Transactional
	public String filesharefileupload(
			@RequestParam("sh_no") String sh_no,
			@RequestParam("shf_realname") String[] shf_realname,
			@RequestParam("shf_newname") String[] shf_newname,
			@RequestParam("shf_path") String[] shf_path,
			FileshareFile fileshareFile
			) {
		fileshareFile.setSh_no(sh_no);
		System.out.println("sh_no : "+sh_no);
		System.out.println("shf_realname : "+shf_realname);
		System.out.println("shf_newname : "+shf_newname);
		System.out.println("shf_path : "+shf_path);
		// 생성할 sh_no번호 받아오기
//		String check_no = service.selectCheckNo(fileshare);
//		System.out.println("check_no : "+check_no);
		int result = 0;
		for(int i =0; i < shf_realname.length; i++) {
			fileshareFile.setShf_realname(shf_realname[i]);
			fileshareFile.setShf_newname(shf_newname[i]);
			fileshareFile.setShf_path(shf_path[i]);
			result = service.insertShareFile(fileshareFile);
		}
		String msg = "등록에 실패하였습니다";
//		if(result > 0) {
			msg = "등록하였습니다";
//		}
		return msg;
	}
	
	@PostMapping("fileListCheck")
	@ResponseBody
	public String fileListCheck(
			String sh_no
			) {
		List<Map<String, Object>> list = service.selectFileListCheck(sh_no);
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String data = gson.toJson(list);
		return data;
	}
	
	@PostMapping("deleteList")
	@ResponseBody
	public String deleteList(
			String sh_no[]
			) {
		int result = 0;
		for(int i = 0; i < sh_no.length; i++) {
			result = service.deleteList(sh_no[i]);
		}
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String msg = "";
		if(result > 0) {
			msg = gson.toJson("삭제하였습니다");
		} else {
			msg = gson.toJson("실패하였습니다");
		}
		return msg;
	}
	
	//파일 저장
	public Map<String, Object> savefile(
			MultipartFile report,
			HttpServletRequest request
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		String realPath = request.getSession().getServletContext().getRealPath("");
		long timeForRename = System.currentTimeMillis();
		String savePath = "resources\\uploadFiles";
		File folder = new File(realPath+savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		String newName = timeForRename +"_"+report.getOriginalFilename();
		String filePath = realPath+savePath+"\\"+ newName;
		try {
			report.transferTo(new File(filePath));// 파일 저장
			
		} catch (IllegalStateException e) {
			// 파일저장 실패
			e.printStackTrace();
		} catch (IOException e) {
			// 파일저장 실패
			e.printStackTrace();
		}   
		// 파일저장 실패시 null, 성공시 저장한파일경로와파일명
		map.put("shf_realname", report.getOriginalFilename());
		map.put("shf_newname", newName);
		map.put("shf_path", "/resources/uploadFiles/");
		return map;
	}
}
