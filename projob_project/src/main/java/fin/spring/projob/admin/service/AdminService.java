package fin.spring.projob.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fin.spring.projob.admin.dao.AdminDao;
import fin.spring.projob.admin.vo.Admin;
import fin.spring.projob.project.vo.Project;
import fin.spring.projob.prouser.vo.Prouser;

@Service
@Transactional
public class AdminService {
	@Autowired
	private AdminDao adao;
	
	public Admin adlogin(Admin admin) throws Exception{
		return adao.adlogin(admin);
	}
	//������ ȸ������ ��ȸ
	public List<Prouser> aduserapprove(int us_ok)throws Exception{
		return adao.aduserapprove(us_ok);
	}
	//������ ȸ�� ����
	public int updateuserok(String us_id)throws Exception{
		return adao.updateuserok(us_id);
	}
	//������ ȸ�� �ݷ�
	public int updateusernok(String us_id)throws Exception{
		return adao.updateusernok(us_id);
	}
	//������ ������Ʈ ���� ���� ��ȸ
	public List<Project> adprojectapprove(int pro_ok)throws Exception{
		return adao.adprojectapprove(pro_ok);
	}
	//������ ������Ʈ ����
	public int updateprojectok(int pro_no)throws Exception{
		return adao.updateprojectok(pro_no);
	}
	//������ ������Ʈ �ݷ�
	public int updateprojectnok(int pro_no)throws Exception{
		return adao.updateprojectnok(pro_no);
	}
}
