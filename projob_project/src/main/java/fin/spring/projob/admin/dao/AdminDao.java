package fin.spring.projob.admin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fin.spring.projob.admin.vo.Admin;

@Repository
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sql;
	
	public Admin adlogin(Admin admin) {
		return sql.selectOne("Admin.adlogin", admin);
	}
}
