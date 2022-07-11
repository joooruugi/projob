package fin.spring.projob.project.service;

import java.util.List;

import fin.spring.projob.project.vo.PMember;
import fin.spring.projob.project.vo.Project;

public interface ProjectService {

	public int insertProject(Project project) throws Exception;
	public List<Project> projectList() throws Exception;
	public Project projectDetail(int pro_no) throws Exception;
	public Project projectJoin(int pro_no) throws Exception;
	public int pmemberinsert(PMember pmember) throws Exception;
}
