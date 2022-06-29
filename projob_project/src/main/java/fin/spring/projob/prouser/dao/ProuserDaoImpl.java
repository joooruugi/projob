package fin.spring.projob.prouser.dao;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import fin.spring.projob.prouser.vo.Prouser;

@Repository
public class ProuserDaoImpl implements ProuserDao{

	@Autowired
	private SqlSessionTemplate sql;
	//회원가입 프리랜서
	@Override
	public int insertProuserfree(Prouser prouser) throws Exception{
		return sql.insert("Prouser.insertProuserfree", prouser);
	}
	//회원가입 기업
	@Override
	public int insertProusercomp(Prouser prouser) throws Exception{
		return sql.insert("Prouser.insertProusercomp", prouser);
	}
	//아이디 중복확인
	@Override
	public int idchk(String us_id){
		return sql.selectOne("Prouser.idchk", us_id);
	}
	// 이메일 중복확인
	public int emailchk(String us_email) {
		return sql.selectOne("Prouser.emailchk", us_email);
	}
	
	//로그인
	public Prouser login(Prouser prouser) {
		return sql.selectOne("Prouser.login", prouser);
	}
	
	//아이디 찾기
	public Prouser findid(Prouser prouser) {
		return sql.selectOne("Prouser.findid", prouser);
	}
	
	//비밀번호 찾기
	public Prouser findpw(Prouser prouser) {
		return sql.selectOne("Prouser.findpw", prouser);
	}
	
}
