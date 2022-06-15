package fin.spring.projob.prouser.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fin.spring.projob.prouser.dao.ProuserDao;
import fin.spring.projob.prouser.vo.Prouser;

@Service
public class ProuserServiceImpl {
	
	@Autowired
	private ProuserDao pdao;
	
	public int insertProuser(Prouser puser) {
		return pdao.insertProuser(puser);
	}
	
}
