package fin.spring.projob.fileshare.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fin.spring.projob.fileshare.vo.FIleshare;
import fin.spring.projob.fileshare.vo.FileshareFile;
import fin.spring.projob.project.vo.Project;

@Repository
public class FileshareDao {

	@Autowired
	SqlSession sqlsession;
	
	public List<Project> selectProject(String us_id) {
		return sqlsession.selectList("Fileshare.selectProject", us_id);
	}

	public List<Map<String, Object>> selectFileshareList(Map<String, Object> map) {
		return sqlsession.selectList("Fileshare.selectFileshareList", map);
	}

	public String selectMaxShNo() {
		return sqlsession.selectOne("Fileshare.selectMaxShNo");
	}

	public int insertShare(FIleshare fileshar) {
		return sqlsession.insert("Fileshare.insertShare", fileshar);
	}

	public int insertShareFile(FileshareFile fileshareFile) {
		return sqlsession.insert("Fileshare.insertShareFile", fileshareFile);
	}

	public String selectCheckNo(FIleshare fileshare) {
		return sqlsession.selectOne("Fileshare.selectCheckNo", fileshare);
	}

	public List<Map<String, Object>> selectFileListCheck(String sh_no) {
		return sqlsession.selectList("Fileshare.selectFileListCheck", sh_no);
	}

	public int deleteList(String sh_no) {
		return sqlsession.update("Fileshare.deleteList", sh_no);
	}

	public List<Map<String, Object>> selectFileshareListSearchTitle(Map<String, Object> map) {
		return sqlsession.selectList("Fileshare.selectFileshareListSearchTitle", map);
	}
	
	public List<Map<String, Object>> selectFileshareListSearchContent(Map<String, Object> map) {
		return sqlsession.selectList("Fileshare.selectFileshareListSearchContent", map);
	}
	
	public List<Map<String, Object>> selectFileshareListSearchId(Map<String, Object> map) {
		return sqlsession.selectList("Fileshare.selectFileshareListSearchId", map);
	}

	public int selectCountShareList(String pro_no) {
		return sqlsession.selectOne("Fileshare.selectCountShareList", pro_no);
	}

	public int selectCounthareListSearchTitle(Map<String, Object> map) {
		return sqlsession.selectOne("Fileshare.selectCounthareListSearchTitle", map);
	}
	
	public int selectCounthareListSearchContent(Map<String, Object> map) {
		return sqlsession.selectOne("Fileshare.selectCounthareListSearchContent", map);
	}

	public int selectCounthareListSearchId(Map<String, Object> map) {
		return sqlsession.selectOne("Fileshare.selectCounthareListSearchId", map);
	}

}
