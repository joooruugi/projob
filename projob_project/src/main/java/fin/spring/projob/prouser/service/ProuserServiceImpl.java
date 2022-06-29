package fin.spring.projob.prouser.service;

import javax.inject.Inject;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import fin.spring.projob.prouser.dao.ProuserDao;
import fin.spring.projob.prouser.dao.ProuserDaoImpl;
import fin.spring.projob.prouser.vo.Prouser;

@Service
public class ProuserServiceImpl implements ProuserService {
	
	@Autowired
	private ProuserDao pdao;
	
	//회원가입 프리랜서
	@Override
	public int insertProuserfree(Prouser puser) throws Exception {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securepw = encoder.encode(puser.getUs_pw());
		puser.setUs_pw(securepw);
		return pdao.insertProuserfree(puser);
	}
	//회원가입 기업
	@Override
	public int insertProusercomp(Prouser puser) throws Exception {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securepw = encoder.encode(puser.getUs_pw());
		puser.setUs_pw(securepw);
		return pdao.insertProusercomp(puser);
	}
	//아이디 중복확인
	@Override
	public int idchk(String us_id){
//		System.out.println(us_id);
		return pdao.idchk(us_id);
	}
	//이메일 중복확인
	@Override
	public int emailchk(String us_email) {
		return pdao.emailchk(us_email);
	}
	//로그인
	@Override
	public Prouser login(Prouser prouser) throws Exception{
		return pdao.login(prouser);
	}
}
