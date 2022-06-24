package fin.spring.projob.prouser.vo;

public class Prouser {

	private String us_id;
	private String us_pw;
	private String us_name;
	private String us_phone;
	private String us_email;
	private String us_address;
	private int us_crn;
	private int us_info;
	private int us_ok;
	private String us_adname;
	private String us_adphone;
	private String us_ademail;
	@Override
	public String toString() {
		return "Prouser [us_id=" + us_id + ", us_pw=" + us_pw + ", us_name=" + us_name + ", us_phone=" + us_phone
				+ ", us_email=" + us_email + ", us_address=" + us_address + ", us_crn=" + us_crn + ", us_info="
				+ us_info + ", us_ok=" + us_ok + ", us_adname=" + us_adname + ", us_adphone=" + us_adphone
				+ ", us_ademail=" + us_ademail + "]";
	}
	public String getUs_id() {
		return us_id;
	}
	public void setUs_id(String us_id) {
		this.us_id = us_id;
	}
	public String getUs_pw() {
		return us_pw;
	}
	public void setUs_pw(String us_pw) {
		this.us_pw = us_pw;
	}
	public String getUs_name() {
		return us_name;
	}
	public void setUs_name(String us_name) {
		this.us_name = us_name;
	}
	public String getUs_phone() {
		return us_phone;
	}
	public void setUs_phone(String us_phone) {
		this.us_phone = us_phone;
	}
	public String getUs_email() {
		return us_email;
	}
	public void setUs_email(String us_email) {
		this.us_email = us_email;
	}
	public String getUs_address() {
		return us_address;
	}
	public void setUs_address(String us_address) {
		this.us_address = us_address;
	}
	public int getUs_crn() {
		return us_crn;
	}
	public void setUs_crn(int us_crn) {
		this.us_crn = us_crn;
	}
	public int getUs_info() {
		return us_info;
	}
	public void setUs_info(int us_info) {
		this.us_info = us_info;
	}
	public int getUs_ok() {
		return us_ok;
	}
	public void setUs_ok(int us_ok) {
		this.us_ok = us_ok;
	}
	public String getUs_adname() {
		return us_adname;
	}
	public void setUs_adname(String us_adname) {
		this.us_adname = us_adname;
	}
	public String getUs_adphone() {
		return us_adphone;
	}
	public void setUs_adphone(String us_adphone) {
		this.us_adphone = us_adphone;
	}
	public String getUs_ademail() {
		return us_ademail;
	}
	public void setUs_ademail(String us_ademail) {
		this.us_ademail = us_ademail;
	}
	
}
