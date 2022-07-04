package fin.spring.projob.prouser.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fin.spring.projob.prouser.vo.Kakao;
import fin.spring.projob.prouser.vo.Prouser;

@Repository
public class ProuserDao {

	@Autowired
	private SqlSessionTemplate sql;

	// 회원가입 프리랜서
	public int insertProuserfree(Prouser prouser) throws Exception {
		return sql.insert("Prouser.insertProuserfree", prouser);
	}

	// 회원가입 기업
	public int insertProusercomp(Prouser prouser) throws Exception {
		return sql.insert("Prouser.insertProusercomp", prouser);
	}

	// 아이디 중복확인
	public int idchk(String us_id) {
		return sql.selectOne("Prouser.idchk", us_id);
	}

	// 이메일 중복확인
	public int emailchk(String us_email) {
		return sql.selectOne("Prouser.emailchk", us_email);
	}

	// 로그인
	public Prouser login(Prouser prouser) {
		return sql.selectOne("Prouser.login", prouser);
	}

	// 카카오로그인 정보 저장
	public void kakaoinsert(HashMap<String, Object> prouserinfo) {
		sql.insert("Prouser.kakaoinsert", prouserinfo);
	}

	// 카카오로그인 정보확인
	public Kakao findkakao(HashMap<String, Object> prouserinfo) {
		System.out.println("RN : " + prouserinfo.get("nickname"));
//			System.out.println("RE : "+prouserinfo.get("email"));
		return sql.selectOne("Prouser.findkakao", prouserinfo);
	}

	// 아이디 찾기
	public Prouser findid(Prouser prouser) {
		return sql.selectOne("Prouser.findid", prouser);
	}

	// 비밀번호 찾기
	public int findpw(Prouser prouser) {
		return sql.selectOne("Prouser.findpw", prouser);
	}

	// 비밀번호 재설정
	public int updatepw(Prouser prouser) {
		return sql.update("Prouser.updatepw", prouser);
	}

}
