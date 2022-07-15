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
	//관리자 회원승인 조회
	public List<Prouser> aduserapprove(int us_ok)throws Exception{
		return adao.aduserapprove(us_ok);
	}
	//관리자 회원 승인
	public int updateuserok(String us_id)throws Exception{
		return adao.updateuserok(us_id);
	}
	//관리자 회원 반려
	public int updateusernok(String us_id)throws Exception{
		return adao.updateusernok(us_id);
	}
	//관리자 프로젝트 공고 승인 조회
	public List<Project> adprojectapprove(int pro_ok)throws Exception{
		return adao.adprojectapprove(pro_ok);
	}
	//관리자 프로젝트 승인
	public int updateprojectok(int pro_no)throws Exception{
		return adao.updateprojectok(pro_no);
	}
	//관리자 프로젝트 반려
	public int updateprojectnok(int pro_no)throws Exception{
		return adao.updateprojectnok(pro_no);
	}
}
