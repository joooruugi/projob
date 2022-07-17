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

	public List<Map<String, Object>> selectFileshareList(String pro_no) {
		return dao.selectFileshareList(pro_no);
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

}
