package fin.spring.projob.freelancer.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fin.spring.projob.freelancer.vo.Freelancer;

@Repository
public class FreelancerDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertFreelancer(Freelancer freelancer) {
		return sqlSession.insert("Freelancer.insertFreelancer", freelancer);
	}
}
