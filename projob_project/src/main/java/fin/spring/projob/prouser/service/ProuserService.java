package fin.spring.projob.prouser.service;


import java.util.List;

import fin.spring.projob.project.vo.Project;
import fin.spring.projob.prouser.vo.Career;
import fin.spring.projob.prouser.vo.Certificate;
import fin.spring.projob.prouser.vo.Kakao;
import fin.spring.projob.prouser.vo.Prouser;
import fin.spring.projob.prouser.vo.Resume;

public interface ProuserService {
	
	public int insertProuserfree(Prouser prouser) throws Exception;
	public int insertProusercomp(Prouser prouser) throws Exception;
	public int idchk(String us_id);
	public int emailchk(String us_email);
	public Prouser login(Prouser prouser) throws Exception;
	public Prouser findid(Prouser prouser) throws Exception;
	public int findpw(Prouser prouser) throws Exception;
	public int updatepw(Prouser prouser) throws Exception;
	public List<Prouser> myinfo(String us_id) throws Exception;
	public int updateInfo(Prouser prouser)throws Exception;
	public String getAccessToken(String authorize_code) throws Exception;
	public Kakao prouserinfo(String access_Token)throws Exception;
	public List<Resume> resumelist(String us_id) throws Exception;
	public List<Resume> resume(int re_no) throws Exception;
	public List<Career> career(int re_no) throws Exception;
	public List<Certificate> certi(int re_no) throws Exception;
	public int resumeinsert(Resume resume)throws Exception;
	public int resumeinsertcareer(Career career)throws Exception;
	public int resumeinsertcerti(Certificate certi)throws Exception;
	public List<Resume> resumeJoin(String us_id)throws Exception;
	public List<Project> freeprojectyetinfo(String us_id)throws Exception;
	public List<Project> freeprojectinfo(String us_id)throws Exception;
	public List<Project> compprojectyetinfo(String us_id)throws Exception;
	public List<Project> compprojectinfo(String us_id)throws Exception;
	public int freeprojectyetcnt(String us_id)throws Exception;
	public int freeprojectcnt(String us_id)throws Exception;
	public int compprojectyetcnt(String us_id)throws Exception;
	public int compprojectcnt(String us_id)throws Exception;
	
}
