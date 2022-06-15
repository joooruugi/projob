package fin.spring.projob.prouser.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fin.spring.projob.prouser.vo.Prouser;

@Repository
public class ProuserDao {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	public int insertProuser(Prouser puser) {
		return sqlsession.insert("Prouser.insertProuser", puser);
	}
}
