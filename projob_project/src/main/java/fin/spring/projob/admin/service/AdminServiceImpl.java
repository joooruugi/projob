package fin.spring.projob.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fin.spring.projob.admin.dao.AdminDao;
import fin.spring.projob.admin.vo.Admin;
import fin.spring.projob.prouser.vo.Prouser;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao adao;
	
	@Override
	public Admin adlogin(Admin admin) throws Exception{
		return adao.adlogin(admin);
	}
	//관리자 회원승인 조회
	@Override
	public List<Prouser> aduserapprove(int us_ok)throws Exception{
		return adao.aduserapprove(us_ok);
	}
	
}
