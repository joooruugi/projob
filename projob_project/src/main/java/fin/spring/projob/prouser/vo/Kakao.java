package fin.spring.projob.prouser.vo;

public class Kakao {
	
	private int kakao_num;
	private String kakao_name;
	private String kakao_email;
	@Override
	public String toString() {
		return "Kakao [kakao_num=" + kakao_num + ", kakao_name=" + kakao_name + ", kakao_email=" + kakao_email + "]";
	}
	public int getKakao_num() {
		return kakao_num;
	}
	public void setKakao_num(int kakao_num) {
		this.kakao_num = kakao_num;
	}
	public String getKakao_name() {
		return kakao_name;
	}
	public void setKakao_name(String kakao_name) {
		this.kakao_name = kakao_name;
	}
	public String getKakao_email() {
		return kakao_email;
	}
	public void setKakao_email(String kakao_email) {
		this.kakao_email = kakao_email;
	}

}
