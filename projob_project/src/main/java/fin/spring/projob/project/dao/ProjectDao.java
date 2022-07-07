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
	
	//������Ʈ ���� ���
	public int insertProject(Project project) throws Exception{
		return sql.insert("Project.insertProject", project);
	}
	//������Ʈ ��� ��ȸ
	public List<Project> projectList() throws Exception{
		return sql.selectList("Project.projectlist");
	}
	//������Ʈ �� ��ȸ
	public Project projectDetail(int pro_no) throws Exception{
		return sql.selectOne("Project.projectdetail", pro_no);
	}
}
