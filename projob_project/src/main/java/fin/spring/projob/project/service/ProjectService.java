package fin.spring.projob.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import fin.spring.projob.project.controller.FileUtils;
import fin.spring.projob.project.dao.ProjectDao;
import fin.spring.projob.project.vo.PMember;
import fin.spring.projob.project.vo.Project;

@Service
@Transactional
public class ProjectService {
	
	
	@Autowired
	private ProjectDao prodao;
	@Autowired
	private FileUtils fileUtils;
	
	// 프로젝트 공고 등록
	public void insertProject(Project project, MultipartHttpServletRequest mreq) throws Exception {
		 prodao.insertProject(project);
		 System.out.println("insertProject 에 들어가는 project : >>>>>>>>>>>>"+project);
		 List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(project, mreq);
		 int size = list.size();
		 for(int i = 0; i<size; i++) {
			 prodao.insertFile(list.get(i));
		 }
	}
	//승인 전 프로젝트 수정
	public int updateproject(Project project)throws Exception{
		return prodao.updateproject(project);
	}
	//승인 전 프로젝트 삭제
	public int deleteproject(int pro_no)throws Exception{
		return prodao.deleteproject(pro_no);
	}
	// 프로젝트 목록 조회
	public List<Project> projectList() throws Exception {
		return prodao.projectList();
	}

	// 프로젝트 상세조회
	public Project projectDetail(int pro_no) throws Exception {
		return prodao.projectDetail(pro_no);
	}
	public List<Map<String, Object>> selectFileList(int pro_no) throws Exception{
		return prodao.selectFileList(pro_no);
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
