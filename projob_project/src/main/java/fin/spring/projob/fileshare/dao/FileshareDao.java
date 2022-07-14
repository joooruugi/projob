package fin.spring.projob.fileshare.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fin.spring.projob.fileshare.vo.FIleshare;
import fin.spring.projob.project.vo.Project;

@Repository
public class FileshareDao {

	@Autowired
	SqlSession sqlsession;
	
	public List<Project> selectProject(String us_id) {
		return sqlsession.selectList("Fileshare.selectProject", us_id);
	}

	public List<Map<String, Object>> selectFileshareList(String pro_no) {
		return sqlsession.selectList("Fileshare.selectFileshareList", pro_no);
	}

}
