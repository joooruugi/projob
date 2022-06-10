package fin.spring.projob.admin.vo;

public class Admin {
	private String adId;
	private String adPassword;
	private String adName;
	@Override
	public String toString() {
		return "Admin [adId=" + adId + ", adPassword=" + adPassword + ", adName=" + adName + "]";
	}
	public String getAdId() {
		return adId;
	}
	public void setAdId(String adId) {
		this.adId = adId;
	}
	public String getAdPassword() {
		return adPassword;
	}
	public void setAdPassword(String adPassword) {
		this.adPassword = adPassword;
	}
	public String getAdName() {
		return adName;
	}
	public void setAdName(String adName) {
		this.adName = adName;
	}
	
}
