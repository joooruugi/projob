package fin.spring.projob.prouser.dao;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fin.spring.projob.prouser.vo.Prouser;

@Repository
public class ProuserDaoImpl implements ProuserDao{

	@Autowired
	private SqlSessionTemplate sql;
	@Override
	public int insertProuserfree(Prouser prouser) throws Exception{
		return sql.insert("Prouser.insertProuserfree", prouser);
	}
	@Override
	public int insertProusercomp(Prouser prouser) throws Exception{
		return sql.insert("Prouser.insertProusercomp", prouser);
	}
	@Override
	public int idchk(String us_id){
		return sql.selectOne("Prouser.idchk", us_id);
	}
	public int emailchk(String us_email) {
		return sql.selectOne("Prouser.emailchk", us_email);
	}
	
}
