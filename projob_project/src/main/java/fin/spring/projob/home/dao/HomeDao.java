package fin.spring.projob.home.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HomeDao {
	
	@Autowired
	SqlSession sqlsession;

	public List<Map<String, Object>> selectMainProject() {
		return sqlsession.selectList("Home.selectMainProject");
	}

	public String selectProjectTotalCnt() {
		return sqlsession.selectOne("Home.selectProjectTotalCnt");
	}

	public String selectProjectIngCnt() {
		return sqlsession.selectOne("Home.selectProjectIngCnt");
	}

}
