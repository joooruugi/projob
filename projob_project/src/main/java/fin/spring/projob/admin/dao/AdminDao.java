package fin.spring.projob.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fin.spring.projob.admin.vo.Admin;
import fin.spring.projob.project.vo.Project;
import fin.spring.projob.prouser.vo.Prouser;

@Repository
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sql;
	// 관리자 로그인
	public Admin adlogin(Admin admin) {
		return sql.selectOne("Admin.adlogin", admin);
	}
	// 관리자 회원, 프로젝트 승인 필요 조회
	public List<Prouser> aduserapprove(int us_ok){
		return sql.selectList("Admin.aduserapprove", us_ok);
	}
	public List<Project> adprojectapprove(int pro_ok){
		return sql.selectList("Admin.adprojectapprove", pro_ok);
	}
	//미승인건 확인
	public int adusercnt() {
		return sql.selectOne("Admin.adusercnt");
	}
	public int adprojectcnt() {
		return sql.selectOne("Admin.adprojectcnt");
	}
	// 관리자 회원, 프로젝트 승인
	public int updateuserok(String us_id) {
		return sql.update("Admin.updateuserok", us_id);
	}
	public int updateusernok(String us_id) {
		return sql.update("Admin.updateusernok", us_id);
	}
	public int updateprojectok(int pro_no) {
		return sql.update("Admin.updateprojectok", pro_no);
	}
	public int updateprojectnok(int pro_no) {
		return sql.update("Admin.updateprojectnok", pro_no);
	}
	// 관리자 회원 검색
	public Prouser adsearchuser(String searchuser) {
		return sql.selectOne("Admin.adsearchuser", searchuser);
	}
}
