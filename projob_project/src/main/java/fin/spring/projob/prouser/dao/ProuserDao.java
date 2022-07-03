package fin.spring.projob.prouser.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fin.spring.projob.prouser.vo.Kakao;
import fin.spring.projob.prouser.vo.Prouser;

@Repository
public interface ProuserDao {
	//회원가입
	public int insertProuserfree(Prouser prouser) throws Exception;
	public int insertProusercomp(Prouser prouser) throws Exception;
	public int idchk(String us_id);
	public int emailchk(String us_email);
	public Prouser login(Prouser prouser) throws Exception;
	public Prouser findid(Prouser prouser) throws Exception;
	public Prouser findpw(Prouser prouser) throws Exception;
	public void kakaoinsert(HashMap<String, Object> prouserinfo) throws Exception;
	public Kakao findkakao(HashMap<String, Object> prouserinfo) throws Exception;
}
