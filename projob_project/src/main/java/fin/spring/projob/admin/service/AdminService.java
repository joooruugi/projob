package fin.spring.projob.admin.service;

import java.util.List;

import fin.spring.projob.admin.vo.Admin;
import fin.spring.projob.prouser.vo.Prouser;

public interface AdminService {
	public Admin adlogin(Admin admin) throws Exception;
	public List<Prouser> aduserapprove(int us_ok)throws Exception;
}
