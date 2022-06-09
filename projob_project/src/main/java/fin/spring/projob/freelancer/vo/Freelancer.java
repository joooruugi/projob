package fin.spring.projob.freelancer.vo;

public class Freelancer {
//	FR_CRN	VARCHAR2(30)	✔
//	FR_ID	VARCHAR2(20)	✔
//	FR_PASSWORD	VARCHAR2(20)	✔
//	FR_NAME	VARCHAR2(5)	✔
//	FR_NICK	VARCHAR2(10)	✔
//	FR_PHONE	VARCHAR2(15)	✔
//	FR_EMAIL	VARCHAR2(40)	✔
//	FR_ADDRESS	VARCHAR2(100)	✔
//	FR_BIRTH	VARCHAR2(10)	✔
	
	private String frCrn;
	private String frId;
	private String frPassword;
	private String frName;
	private String frNick;
	private String frPhone;
	private String frEmail;
	private String frAddress;
	private String frBirth;
	@Override
	public String toString() {
		return "Freelancer [frCrn=" + frCrn + ", frId=" + frId + ", frPassword=" + frPassword + ", frName=" + frName
				+ ", frNick=" + frNick + ", frPhone=" + frPhone + ", frEmail=" + frEmail + ", frAddress=" + frAddress
				+ ", frBirth=" + frBirth + "]";
	}
	public String getFrCrn() {
		return frCrn;
	}
	public void setFrCrn(String frCrn) {
		this.frCrn = frCrn;
	}
	public String getFrId() {
		return frId;
	}
	public void setFrId(String frId) {
		this.frId = frId;
	}
	public String getFrPassword() {
		return frPassword;
	}
	public void setFrPassword(String frPassword) {
		this.frPassword = frPassword;
	}
	public String getFrName() {
		return frName;
	}
	public void setFrName(String frName) {
		this.frName = frName;
	}
	public String getFrNick() {
		return frNick;
	}
	public void setFrNick(String frNick) {
		this.frNick = frNick;
	}
	public String getFrPhone() {
		return frPhone;
	}
	public void setFrPhone(String frPhone) {
		this.frPhone = frPhone;
	}
	public String getFrEmail() {
		return frEmail;
	}
	public void setFrEmail(String frEmail) {
		this.frEmail = frEmail;
	}
	public String getFrAddress() {
		return frAddress;
	}
	public void setFrAddress(String frAddress) {
		this.frAddress = frAddress;
	}
	public String getFrBirth() {
		return frBirth;
	}
	public void setFrBirth(String frBirth) {
		this.frBirth = frBirth;
	}
	
}
