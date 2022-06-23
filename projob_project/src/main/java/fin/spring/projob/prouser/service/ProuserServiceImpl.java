package fin.spring.projob.prouser.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fin.spring.projob.prouser.dao.ProuserDao;
import fin.spring.projob.prouser.dao.ProuserDaoImpl;
import fin.spring.projob.prouser.vo.Prouser;

@Service
public class ProuserServiceImpl implements ProuserService {
	
	@Inject ProuserDao pdao;
	
	@Override
	public int insertProuserfree(Prouser puser) throws Exception {
		return pdao.insertProuserfree(puser);
	}
	@Override
	public int insertProusercomp(Prouser puser) throws Exception {
		return pdao.insertProusercomp(puser);
	}
	@Override
	public int insertProusercomp2(Prouser puser) throws Exception {
		return pdao.insertProusercomp2(puser);
	}
	
}
