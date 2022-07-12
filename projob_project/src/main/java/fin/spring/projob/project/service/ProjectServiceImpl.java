package fin.spring.projob.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fin.spring.projob.project.dao.ProjectDao;
import fin.spring.projob.project.vo.PMember;
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
	//프로젝트 목록 조회
	@Override
	public List<Project> projectList() throws Exception{
		return prodao.projectList();
	}
	//프로젝트 상세조회
	@Override
	public Project projectDetail(int pro_no) throws Exception{
		return prodao.projectDetail(pro_no);
	}
	//프로젝트 신청
	@Override
	public Project projectJoin(int pro_no) throws Exception{
		return prodao.projectJoin(pro_no);
	}
	// 프로젝트 신청 > 이력서 선택 / pmemberinsert
	@Override
	public int pmemberinsert(PMember pmember) throws Exception{
		return prodao.pmemberinsert(pmember);
	}
	//프로젝트 현황 보기(기업)
	@Override
	public List<Project> projectstatuscomp(String pro_id) throws Exception{
		return prodao.projectstatuscomp(pro_id);
	}
	//프로젝트 신청 현황 보기(기업)
	@Override
	public List<PMember> projectjoinstatus(int pro_no) throws Exception{
		return prodao.projectjoinstatus(pro_no);
	}
	@Override
	public Project projectjoininfo(int pro_no) throws Exception{
		return prodao.projectjoininfo(pro_no);
	}
	//
	
}
