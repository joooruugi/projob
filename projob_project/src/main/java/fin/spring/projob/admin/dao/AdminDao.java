package fin.spring.projob.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fin.spring.projob.admin.vo.Admin;
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
}
