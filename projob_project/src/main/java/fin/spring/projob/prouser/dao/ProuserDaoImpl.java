package fin.spring.projob.prouser.dao;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import fin.spring.projob.prouser.vo.Prouser;

@Repository
public class ProuserDaoImpl implements ProuserDao{

	@Inject SqlSession sql;
	@Override
	public int insertProuserfree(Prouser prouser) throws Exception{
		return sql.insert("Prouser.insertProuserfree", prouser);
	}
	@Override
	public int insertProusercomp(Prouser prouser) throws Exception{
		return sql.insert("Prouser.insertProusercomp", prouser);
	}
	
}
