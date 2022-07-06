package fin.spring.projob.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fin.spring.projob.project.vo.Project;

@Repository
public class ProjectDao {

	@Autowired
	private SqlSessionTemplate sql;
	
	public int insertProject(Project project) throws Exception{
		return sql.insert("Project.insertProject", project);
	}
}
