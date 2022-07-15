package fin.spring.projob.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fin.spring.projob.project.dao.ProjectDao;
import fin.spring.projob.project.vo.PMember;
import fin.spring.projob.project.vo.Project;

@Service
@Transactional
public class ProjectService {
	
	@Autowired
	private ProjectDao prodao;

	// 프로젝트 공고 등록
	public int insertProject(Project project) throws Exception {
		return prodao.insertProject(project);
	}

	// 프로젝트 목록 조회
	public List<Project> projectList() throws Exception {
		return prodao.projectList();
	}

	// 프로젝트 상세조회
	public Project projectDetail(int pro_no) throws Exception {
		return prodao.projectDetail(pro_no);
	}

	// 프로젝트 신청
	public Project projectJoin(int pro_no) throws Exception {
		return prodao.projectJoin(pro_no);
	}
	//프로젝트 신청시 기신청한 프리랜서 신청 금지시키기
	public int alreadyjoinproject(PMember pmember) throws Exception{
		return prodao.alreadyjoinproject(pmember);
	}

	// 프로젝트 신청 > 이력서 선택 / pmemberinsert
	public int pmemberinsert(PMember pmember) throws Exception {
		return prodao.pmemberinsert(pmember);
	}

	// 프로젝트 현황 보기(기업)
	public List<Project> projectstatuscomp(String pro_id) throws Exception {
		return prodao.projectstatuscomp(pro_id);
	}

	// 프로젝트 신청 현황 보기(기업)
	public List<PMember> projectjoinstatus(int pro_no) throws Exception {
		return prodao.projectjoinstatus(pro_no);
	}

	public Project projectjoininfo(int pro_no) throws Exception {
		return prodao.projectjoininfo(pro_no);
	}

	public List<PMember> joinfree(int pro_no) throws Exception {
		return prodao.joinfree(pro_no);
	}

	// 프리랜서 선정
	public int selectfree(PMember pm) throws Exception {
		return prodao.selectfree(pm);
	}
	//기선정된 프리랜서 수 조회
	public int selectedfree(PMember pm)throws Exception{
		return prodao.selectedfree(pm);
	}

}
