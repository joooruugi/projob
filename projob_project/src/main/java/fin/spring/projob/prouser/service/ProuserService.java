package fin.spring.projob.prouser.service;

import fin.spring.projob.prouser.vo.Prouser;

public interface ProuserService {

	public int insertProuserfree(Prouser prouser) throws Exception;
	public int insertProusercomp(Prouser prouser) throws Exception;
	public int idchk(String us_id);
	public int emailchk(String us_email);
}
