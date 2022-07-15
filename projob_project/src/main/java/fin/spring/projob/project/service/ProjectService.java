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

	// ������Ʈ ���� ���
	public int insertProject(Project project) throws Exception {
		return prodao.insertProject(project);
	}

	// ������Ʈ ��� ��ȸ
	public List<Project> projectList() throws Exception {
		return prodao.projectList();
	}

	// ������Ʈ ����ȸ
	public Project projectDetail(int pro_no) throws Exception {
		return prodao.projectDetail(pro_no);
	}

	// ������Ʈ ��û
	public Project projectJoin(int pro_no) throws Exception {
		return prodao.projectJoin(pro_no);
	}
	//������Ʈ ��û�� ���û�� �������� ��û ������Ű��
	public int alreadyjoinproject(PMember pmember) throws Exception{
		return prodao.alreadyjoinproject(pmember);
	}

	// ������Ʈ ��û > �̷¼� ���� / pmemberinsert
	public int pmemberinsert(PMember pmember) throws Exception {
		return prodao.pmemberinsert(pmember);
	}

	// ������Ʈ ��Ȳ ����(���)
	public List<Project> projectstatuscomp(String pro_id) throws Exception {
		return prodao.projectstatuscomp(pro_id);
	}

	// ������Ʈ ��û ��Ȳ ����(���)
	public List<PMember> projectjoinstatus(int pro_no) throws Exception {
		return prodao.projectjoinstatus(pro_no);
	}

	public Project projectjoininfo(int pro_no) throws Exception {
		return prodao.projectjoininfo(pro_no);
	}

	public List<PMember> joinfree(int pro_no) throws Exception {
		return prodao.joinfree(pro_no);
	}

	// �������� ����
	public int selectfree(PMember pm) throws Exception {
		return prodao.selectfree(pm);
	}
	//�⼱���� �������� �� ��ȸ
	public int selectedfree(PMember pm)throws Exception{
		return prodao.selectedfree(pm);
	}

}
