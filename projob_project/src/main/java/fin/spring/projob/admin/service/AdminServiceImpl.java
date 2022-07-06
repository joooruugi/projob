package fin.spring.projob.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fin.spring.projob.admin.dao.AdminDao;
import fin.spring.projob.admin.vo.Admin;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao adao;
	
	@Override
	public Admin adlogin(Admin admin) throws Exception{
		return adao.adlogin(admin);
	}
	
}
