package fin.spring.projob.messenger.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fin.spring.projob.prouser.vo.Prouser;

@Repository
public class MessengerDao {

	@Autowired
	SqlSession sqlsession;
	public Prouser selectId() {
		return sqlsession.selectOne("Messenger.selectId");
	}

	
	
}
