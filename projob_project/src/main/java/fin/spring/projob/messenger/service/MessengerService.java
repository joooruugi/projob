package fin.spring.projob.messenger.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fin.spring.projob.messenger.dao.MessengerDao;
import fin.spring.projob.prouser.vo.Prouser;

@Service
public class MessengerService {
	
	@Autowired
	MessengerDao dao;

	public Prouser selectId() {
		return dao.selectId();
	}

}
