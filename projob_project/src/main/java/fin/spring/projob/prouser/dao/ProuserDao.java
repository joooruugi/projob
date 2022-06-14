package fin.spring.projob.prouser.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fin.spring.projob.prouser.vo.Prouser;

@Repository
public class ProuserDao {

	@Autowired
	private SqlSession sqlsession;
	
	public int insertProuser(Prouser puser) {
		return sqlsession.insert("Prouser.insertProuser", puser);
	}
}
