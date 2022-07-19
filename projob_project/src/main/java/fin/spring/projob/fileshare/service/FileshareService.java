package fin.spring.projob.fileshare.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fin.spring.projob.fileshare.dao.FileshareDao;
import fin.spring.projob.fileshare.vo.FIleshare;
import fin.spring.projob.fileshare.vo.FileshareFile;
import fin.spring.projob.project.vo.Project;

@Service
public class FileshareService {
	
	@Autowired
	private FileshareDao dao;

	public List<Project> selectProject(String us_id) {
		return dao.selectProject(us_id);
	}

	public List<Map<String, Object>> selectFileshareList(Map<String, Object> map) {
		return dao.selectFileshareList(map);
	}

	public String selectMaxShNo() {
		return dao.selectMaxShNo();
	}

	public int insertShare(FIleshare fileshare) {
		return dao.insertShare(fileshare);
	}

	public int insertShareFile(FileshareFile fileshareFile) {
		return dao.insertShareFile(fileshareFile);
	}

	public String selectCheckNo(FIleshare fileshare) {
		return dao.selectCheckNo( fileshare);
	}

	public List<Map<String, Object>> selectFileListCheck(String sh_no) {
		return dao.selectFileListCheck(sh_no);
	}

	public int deleteList(String sh_no) {
		return dao.deleteList(sh_no);
	}

	public List<Map<String, Object>> selectFileshareListSearchTitle(Map<String, Object> map) {
		return dao.selectFileshareListSearchTitle(map);
	}
	
	public List<Map<String, Object>> selectFileshareListSearchContent(Map<String, Object> map) {
		return dao.selectFileshareListSearchContent(map);
	}
	
	public List<Map<String, Object>> selectFileshareListSearchId(Map<String, Object> map) {
		return dao.selectFileshareListSearchId(map);
	}

	public int selectCountShareList(String pro_no) {
		return dao.selectCountShareList(pro_no);
	}

	public int selectCounthareListSearchTitle(Map<String, Object> map) {
		return dao.selectCounthareListSearchTitle(map);
	}

	public int selectCounthareListSearchContent(Map<String, Object> map) {
		return dao.selectCounthareListSearchTitle(map);
	}
	
	public int selectCounthareListSearchId(Map<String, Object> map) {
		return dao.selectCounthareListSearchId(map);
	}

}
