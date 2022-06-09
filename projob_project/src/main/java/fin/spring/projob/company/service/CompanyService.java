package fin.spring.projob.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fin.spring.projob.company.dao.CompanyDao;
import fin.spring.projob.company.vo.Company;

@Service
public class CompanyService {

	@Autowired
	private CompanyDao cdao;
	
	public int insertCompany(Company company) {
		return cdao.insertCompany(company);
	}
}
