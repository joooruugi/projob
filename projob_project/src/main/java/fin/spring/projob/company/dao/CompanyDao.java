package fin.spring.projob.company.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fin.spring.projob.company.vo.Company;

@Repository
public class CompanyDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertCompany(Company company) {
		return sqlSession.insert("Company.insertCompany", company);
	}
}
