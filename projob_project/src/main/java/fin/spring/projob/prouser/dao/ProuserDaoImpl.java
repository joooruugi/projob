package fin.spring.projob.prouser.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import fin.spring.projob.prouser.vo.Prouser;

@Repository
public class ProuserDaoImpl implements ProuserDao{

	@Inject SqlSession sql;
	@Override
	public int insertProuser(Prouser prouser) throws Exception{
		return sql.insert("Prouser.insertProuser", prouser);
		
	}
	
}
