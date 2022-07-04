package fin.spring.projob.prouser.service;

import java.util.HashMap;


import fin.spring.projob.prouser.vo.Kakao;
import fin.spring.projob.prouser.vo.Prouser;

public interface ProuserService {
	
	public int insertProuserfree(Prouser prouser) throws Exception;
	public int insertProusercomp(Prouser prouser) throws Exception;
	public int idchk(String us_id);
	public int emailchk(String us_email);
	public Prouser login(Prouser prouser) throws Exception;
	public Prouser findid(Prouser prouser) throws Exception;
	public int findpw(Prouser prouser) throws Exception;
	public int updatepw(Prouser prouser) throws Exception;
	public String getAccessToken(String authorize_code) throws Exception;
	public Kakao prouserinfo(String access_Token)throws Exception;
}
