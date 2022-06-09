package fin.spring.projob.freelancer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fin.spring.projob.freelancer.dao.FreelancerDao;
import fin.spring.projob.freelancer.vo.Freelancer;

@Service
public class FreelancerService {

	@Autowired
	private FreelancerDao fdao;
	
	public int insertFreelancer(Freelancer freelancer) {
		return fdao.insertFreelancer(freelancer);
	}
}
