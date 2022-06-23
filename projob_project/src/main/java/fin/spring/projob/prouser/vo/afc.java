package fin.spring.projob.prouser.vo;

public class afc {
	private String us_id;
	private String afc_name;
	private String afc_phone;
	private String afc_email;
	public String getUs_id() {
		return us_id;
	}
	public void setUs_id(String us_id) {
		this.us_id = us_id;
	}
	public String getAfc_name() {
		return afc_name;
	}
	public void setAfc_name(String afc_name) {
		this.afc_name = afc_name;
	}
	public String getAfc_phone() {
		return afc_phone;
	}
	public void setAfc_phone(String afc_phone) {
		this.afc_phone = afc_phone;
	}
	public String getAfc_email() {
		return afc_email;
	}
	public void setAfc_email(String afc_email) {
		this.afc_email = afc_email;
	}
	@Override
	public String toString() {
		return "afc [us_id=" + us_id + ", afc_name=" + afc_name + ", afc_phone=" + afc_phone + ", afc_email="
				+ afc_email + "]";
	}
}
