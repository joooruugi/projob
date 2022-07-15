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
	
	public Admin adlogin(Admin admin) {
		return sql.selectOne("Admin.adlogin", admin);
	}
	public List<Prouser> aduserapprove(int us_ok){
		return sql.selectList("Admin.aduserapprove", us_ok);
	}
	public List<Project> adprojectapprove(int pro_ok){
		return sql.selectList("Admin.adprojectapprove", pro_ok);
	}
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
}
