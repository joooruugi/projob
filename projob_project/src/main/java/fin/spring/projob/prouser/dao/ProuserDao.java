package fin.spring.projob.prouser.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fin.spring.projob.prouser.vo.Prouser;

@Repository
public interface ProuserDao {
	//ȸ������
	public int insertProuser(Prouser prouser) throws Exception;
}
