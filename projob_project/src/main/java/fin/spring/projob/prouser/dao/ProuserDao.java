package fin.spring.projob.prouser.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fin.spring.projob.project.vo.Project;
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

	// 마이페이지 내정보 불러오기
	public List<Prouser> myinfo(String us_id) throws Exception {
		return sql.selectList("Prouser.myinfo", us_id);
	}

	// 마이페이지 개인정보 수정
	public int updateInfo(Prouser prouser) throws Exception {
		return sql.update("Prouser.updateInfo", prouser);
	}

	// 마이페이지 이력서 목록 조회
	public List<Resume> resumelist(String us_id) throws Exception {
		return sql.selectList("Prouser.resumelist", us_id);
	}

	// 마이페이지 이력서 조회
	public List<Resume> resume(int re_no) throws Exception {
		return sql.selectList("Prouser.resume", re_no);
	}
	public List<Resume> resumeimg(int re_no) throws Exception{
		return sql.selectList("Prouser.resumeimg", re_no);
	}
	public List<Career> career(int re_no) throws Exception {
		return sql.selectList("Prouser.career", re_no);
	}

	public List<Certificate> certificate(int re_no) throws Exception {
		return sql.selectList("Prouser.certi", re_no);
	}

	// 마이페이지 이력서 등록
	public int resumeinsert(Resume resume, HttpServletRequest req) throws Exception {
		System.out.println("Dao============"+resume);
		return sql.insert("Prouser.resumeinsert", resume);
	}
	public void uploadReimg(Resume resume) throws Exception{
		System.out.println("Dao============"+resume);
		sql.insert("Prouser.uploadReimg", resume);
	}

	public int resumeinsertcareer(Career career) throws Exception {
		return sql.insert("Prouser.resumeinsertcareer", career);
	}
	public int resumeinsertcareer2(Career career) throws Exception {
		return sql.insert("Prouser.resumeinsertcareer2", career);
	}
	public int resumeinsertcareer3(Career career) throws Exception {
		return sql.insert("Prouser.resumeinsertcareer3", career);
	}

	public int resumeinsertcerti(Certificate certi) throws Exception {
		return sql.insert("Prouser.resumeinsertcerti", certi);
	}
	public int resumeinsertcerti2(Certificate certi) throws Exception {
		return sql.insert("Prouser.resumeinsertcerti2", certi);
	}
	public int resumeinsertcerti3(Certificate certi) throws Exception {
		return sql.insert("Prouser.resumeinsertcerti3", certi);
	}
	//이력서 수정
	public int updateresume(Resume resume)throws Exception{
		return sql.update("Prouser.updateresume", resume);
	}
	public int updatecareer(Career career)throws Exception{
		return sql.update("Prouser.updatecareer", career);
	}
	public int updatecareer2(Career career)throws Exception{
		return sql.update("Prouser.updatecareer2", career);
	}
	public int updatecareer3(Career career)throws Exception{
		return sql.update("Prouser.updatecareer3", career);
	}
	public int updatecerti(Certificate certi)throws Exception{
		return sql.update("Prouser.updatecerti", certi);
	}
	public int updatecerti2(Certificate certi)throws Exception{
		return sql.update("Prouser.updatecerti2", certi);
	}
	public int updatecerti3(Certificate certi)throws Exception{
		return sql.update("Prouser.updatecerti3", certi);
	}
	//이력서 삭제
	public int deleteresume(int re_no)throws Exception{
		return sql.delete("Prouser.deleteresume", re_no);
	}
	public int deletecerti(int re_no)throws Exception{
		return sql.delete("Prouser.deletecerti", re_no);
	}
	public int deletecareer(int re_no)throws Exception{
		return sql.delete("Prouser.deletecareer", re_no);
	}
	public int resumepmember(int re_no)throws Exception{
		return sql.selectOne("Prouser.resumepmember", re_no);
	}

	// 프로젝트 신청 이력서 불러오기 (프리랜서)
	public List<Resume> resumeJoin(String us_id) throws Exception {
		return sql.selectList("Prouser.resumeJoin", us_id);
	}
	

	// 마이페이지 프리랜서 승인 대기중인 프로젝트 정보 불러오기(건수)
	public int freeprojectyetcnt(String us_id) throws Exception {
		return sql.selectOne("Prouser.freeprojectyetcnt", us_id);
	}

	// 마이페이지 프리랜서 승인 대기중인 프로젝트 정보 불러오기(이름, 번호)
	public List<Project> freeprojectyetinfo(String us_id) throws Exception {
		return sql.selectList("Prouser.freeprojectyetinfo", us_id);
	}

	// 마이페이지 프리랜서 진행중인 프로젝트 정보 불러오기(건수)
	public int freeprojectcnt(String us_id) throws Exception {
		return sql.selectOne("Prouser.freeprojectcnt", us_id);
	}

	// 마이페이지 프리랜서 진행중인 프로젝트 정보 불러오기(이름, 번호)
	public List<Project> freeprojectinfo(String us_id) throws Exception {
		return sql.selectList("Prouser.freeprojectinfo", us_id);
	}

	// 마이페이지 기업 승인 대기중인 프로젝트 정보 불러오기(건수)
	public int compprojectyetcnt(String us_id) throws Exception {
		return sql.selectOne("Prouser.compprojectyetcnt", us_id);
	}

	// 마이페이지 기업 승인 대기중인 프로젝트 정보 불러오기(이름, 번호)
	public List<Project> compprojectyetinfo(String us_id) throws Exception {
		return sql.selectList("Prouser.compprojectyetinfo", us_id);
	}

	// 마이페이지 기업 진행중인 프로젝트 정보 불러오기(건수)
	public int compprojectcnt(String us_id) throws Exception {
		return sql.selectOne("Prouser.compprojectcnt", us_id);
	}

	// 마이페이지 기업 진행중인 프로젝트 정보 불러오기(이름, 번호)
	public List<Project> compprojectinfo(String us_id) throws Exception {
		return sql.selectList("Prouser.compprojectinfo", us_id);
	}
	public Resume pmemberresume(int re_no)throws Exception{
		return sql.selectOne("Prouser.pmemberresume", re_no);
	}

}
