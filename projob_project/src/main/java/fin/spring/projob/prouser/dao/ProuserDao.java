package fin.spring.projob.prouser.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fin.spring.projob.prouser.vo.Career;
import fin.spring.projob.prouser.vo.Certificate;
import fin.spring.projob.prouser.vo.Kakao;
import fin.spring.projob.prouser.vo.Prouser;
import fin.spring.projob.prouser.vo.Resume;

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
	
	//마이페이지 이력서 목록 조회
	public List<Resume> resumelist(String us_id) throws Exception{
		return sql.selectList("Prouser.resumelist", us_id);
	}
	//마이페이지 이력서 등록
	public int resumeinsert(Resume resume) throws Exception{
		return sql.insert("Prouser.resumeinsert", resume);
	}
	public int resumeinsertcareer(Career career) throws Exception{
		return sql.insert("Prouser.resumeinsertcareer", career);
	}
	public int resumeinsertcerti(Certificate certi)throws Exception{
		return sql.insert("Prouser.resumeinsertcerti", certi);
	}

	//프로젝트 신청 이력서 불러오기
	public List<Resume> resumeJoin(String us_id)throws Exception{
		return sql.selectList("Prouser.resumeJoin", us_id);
	}
}
