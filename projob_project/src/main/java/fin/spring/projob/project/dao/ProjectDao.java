package fin.spring.projob.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fin.spring.projob.project.vo.PMember;
import fin.spring.projob.project.vo.Project;
import fin.spring.projob.prouser.vo.Resume;

@Repository
public class ProjectDao {

	@Autowired
	private SqlSessionTemplate sql;

	// 프로젝트 공고 등록
	public int insertProject(Project project) throws Exception {
		return sql.insert("Project.insertProject", project);
	}

	// 프로젝트 목록 조회
	public List<Project> projectList() throws Exception {
		return sql.selectList("Project.projectlist");
	}

	// 프로젝트 상세 조회
	public Project projectDetail(int pro_no) throws Exception {
		return sql.selectOne("Project.projectdetail", pro_no);
	}

	// 프로젝트 신청
	public Project projectJoin(int pro_no) throws Exception {
		return sql.selectOne("Project.projectJoin", pro_no);
	}

	// 프로젝트 신청 > 이력서 선택 / pmemberinsert
	public int pmemberinsert(PMember pmember) throws Exception {
		System.out.println(pmember.getUs_id());
		return sql.insert("Project.pmemberinsert", pmember);
	}

	// 프로젝트 현황보기(기업)
	public List<Project> projectstatuscomp(String pro_id) throws Exception {
		return sql.selectList("Project.projectstatuscomp", pro_id);
	}

	// 프로젝트 신청 현황 보기(기업)
	public List<PMember> projectjoinstatus(int pro_no) throws Exception {
		return sql.selectList("Project.projectjoinstatus", pro_no);
	}

	public Project projectjoininfo(int pro_no) throws Exception {
		return sql.selectOne("Project.projectjoininfo", pro_no);
	}

	public List<PMember> joinfree(int pro_no) throws Exception {
		return sql.selectList("Project.joinfree", pro_no);
	}
	//프리랜서 선정(기업)
	public int selectfree(PMember pm)throws Exception{
		return sql.update("Project.selectfree", pm);
	}
}
