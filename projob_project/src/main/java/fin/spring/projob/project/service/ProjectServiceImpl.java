package fin.spring.projob.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fin.spring.projob.project.dao.ProjectDao;
import fin.spring.projob.project.vo.Project;

@Service
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	private ProjectDao prodao;

	//프로젝트 공고 등록
	@Override
	public int insertProject(Project project) throws Exception{
		return prodao.insertProject(project);
	}
}
