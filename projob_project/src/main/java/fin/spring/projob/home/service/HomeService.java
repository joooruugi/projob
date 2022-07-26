package fin.spring.projob.home.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fin.spring.projob.home.dao.HomeDao;

@Service
public class HomeService {
	
	@Autowired
	HomeDao dao;

	public List<Map<String, Object>> selectMainProject() {
		return dao.selectMainProject();
	}

	public String selectProjectTotalCnt() {
		return dao.selectProjectTotalCnt();
	}

	public String selectProjectIngCnt() {
		return dao.selectProjectIngCnt();
	}

}
