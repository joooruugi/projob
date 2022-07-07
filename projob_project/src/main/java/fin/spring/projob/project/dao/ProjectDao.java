package fin.spring.projob.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fin.spring.projob.project.vo.Project;

@Repository
public class ProjectDao {

	@Autowired
	private SqlSessionTemplate sql;
	
	//프로젝트 공고 등록
	public int insertProject(Project project) throws Exception{
		return sql.insert("Project.insertProject", project);
	}
	//프로젝트 목록 조회
	public List<Project> projectList() throws Exception{
		return sql.selectList("Project.projectlist");
	}
	//프로젝트 상세 조회
	public Project projectDetail(int pro_no) throws Exception{
		return sql.selectOne("Project.projectdetail", pro_no);
	}
}
