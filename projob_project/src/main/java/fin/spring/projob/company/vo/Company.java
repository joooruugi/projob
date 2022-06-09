package fin.spring.projob.company.vo;

public class Company {
//	COM_CRN	VARCHAR2(30)	✔
//	COM_ID	VARCHAR2(20)	✔
//	COM_PASSWORD	VARCHAR2(20)	✔
//	COM_NAME	VARCHAR2(20)	✔
//	COM_PHONE	VARCHAR2(15)	✔
//	COM_EMAIL	VARCHAR2(40)	✔
//	COM_ADDRESS	VARCHAR2(100)	✔
//	COM_ADNAME	VARCHAR2(5)	✔
//	COM_ADPHONE	VARCHAR2(15)	✔
//	COM_ADEMAIL	VARCHAR2(40)	✔
	
	private String comCrn;
	private String comId;
	private String comPassword;
	private String comName;
	private String comNick;
	private String comPhone;
	private String comEmail;
	private String comAddress;
	private String comAdname;
	private String comAdphone;
	private String comAdemail;
	@Override
	public String toString() {
		return "Company [comCrn=" + comCrn + ", comId=" + comId + ", comPassword=" + comPassword + ", comName="
				+ comName + ", comNick=" + comNick + ", comPhone=" + comPhone + ", comEmail=" + comEmail
				+ ", comAddress=" + comAddress + ", comAdname=" + comAdname + ", comAdphone=" + comAdphone
				+ ", comAdemail=" + comAdemail + "]";
	}
	public String getComCrn() {
		return comCrn;
	}
	public void setComCrn(String comCrn) {
		this.comCrn = comCrn;
	}
	public String getComId() {
		return comId;
	}
	public void setComId(String comId) {
		this.comId = comId;
	}
	public String getComPassword() {
		return comPassword;
	}
	public void setComPassword(String comPassword) {
		this.comPassword = comPassword;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getComNick() {
		return comNick;
	}
	public void setComNick(String comNick) {
		this.comNick = comNick;
	}
	public String getComPhone() {
		return comPhone;
	}
	public void setComPhone(String comPhone) {
		this.comPhone = comPhone;
	}
	public String getComEmail() {
		return comEmail;
	}
	public void setComEmail(String comEmail) {
		this.comEmail = comEmail;
	}
	public String getComAddress() {
		return comAddress;
	}
	public void setComAddress(String comAddress) {
		this.comAddress = comAddress;
	}
	public String getComAdname() {
		return comAdname;
	}
	public void setComAdname(String comAdname) {
		this.comAdname = comAdname;
	}
	public String getComAdphone() {
		return comAdphone;
	}
	public void setComAdphone(String comAdphone) {
		this.comAdphone = comAdphone;
	}
	public String getComAdemail() {
		return comAdemail;
	}
	public void setComAdemail(String comAdemail) {
		this.comAdemail = comAdemail;
	}
	
	
}
