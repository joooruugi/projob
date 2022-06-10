package fin.spring.projob.freelancer.vo;

import java.sql.Timestamp;

public class Resume {
//	FR_CRN	VARCHAR2(30)	✔
//	RE_NO	NUMBER	✔
//	RE_SCHOOL	VARCHAR2(10)	✔
//	RE_GRADUATE	VARCHAR2(5)	✔
//	RE_TYPE	NUMBER	✔
//	RE_HOMEPAGE	VARCHAR2(1000)	✔
//	RE_WDATE	TIMESTAMP	✔
//	RE_OPENYN	VARCHAR2(1)	✔
	
	private int reNo;
	private String reSchool;
	private String reGraduate;
	private int reType;
	private String reHomepage;
	private Timestamp reWdate;
	private String reOpenyn;
	@Override
	public String toString() {
		return "Resume [reNo=" + reNo + ", reSchool=" + reSchool + ", reGraduate=" + reGraduate + ", reType=" + reType
				+ ", reHomepage=" + reHomepage + ", reWdate=" + reWdate + ", reOpenyn=" + reOpenyn + "]";
	}
	public int getReNo() {
		return reNo;
	}
	public void setReNo(int reNo) {
		this.reNo = reNo;
	}
	public String getReSchool() {
		return reSchool;
	}
	public void setReSchool(String reSchool) {
		this.reSchool = reSchool;
	}
	public String getReGraduate() {
		return reGraduate;
	}
	public void setReGraduate(String reGraduate) {
		this.reGraduate = reGraduate;
	}
	public int getReType() {
		return reType;
	}
	public void setReType(int reType) {
		this.reType = reType;
	}
	public String getReHomepage() {
		return reHomepage;
	}
	public void setReHomepage(String reHomepage) {
		this.reHomepage = reHomepage;
	}
	public Timestamp getReWdate() {
		return reWdate;
	}
	public void setReWdate(Timestamp reWdate) {
		this.reWdate = reWdate;
	}
	public String getReOpenyn() {
		return reOpenyn;
	}
	public void setReOpenyn(String reOpenyn) {
		this.reOpenyn = reOpenyn;
	}
	
}
