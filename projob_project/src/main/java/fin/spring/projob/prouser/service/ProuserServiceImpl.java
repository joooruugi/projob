package fin.spring.projob.prouser.service;

import java.io.BufferedReader;


import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import fin.spring.projob.prouser.dao.ProuserDao;
import fin.spring.projob.prouser.vo.Kakao;
import fin.spring.projob.prouser.vo.Prouser;

@Service
public class ProuserServiceImpl implements ProuserService {
	
	@Autowired
	private ProuserDao pdao;
	
	//회원가입 프리랜서
	@Override
	public int insertProuserfree(Prouser puser) throws Exception {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securepw = encoder.encode(puser.getUs_pw());
		puser.setUs_pw(securepw);
		return pdao.insertProuserfree(puser);
	}
	//회원가입 기업
	@Override
	public int insertProusercomp(Prouser puser) throws Exception {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securepw = encoder.encode(puser.getUs_pw());
		puser.setUs_pw(securepw);
		return pdao.insertProusercomp(puser);
	}
	//아이디 중복확인
	@Override
	public int idchk(String us_id){
//		System.out.println(us_id);
		return pdao.idchk(us_id);
	}
	//이메일 중복확인
	@Override
	public int emailchk(String us_email) {
		return pdao.emailchk(us_email);
	}
	//로그인
	@Override
	public Prouser login(Prouser prouser) throws Exception{
		return pdao.login(prouser);
	}
	//카카오 로그인 인증키
	public String getAccessToken(String authorize_code) throws Exception {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			//POST 요청을 위해 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			//POST로 보낼 정보를 파라미터에 담기
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=3ffd958b947bf62ae145517c58a31d0a"); 
			sb.append("&redirect_uri=http://localhost:8090/projob/kakaologin");
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
			
			//결과코드가 200이 나와야 함
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			//결과코드 200까지 잘 나옴, 이후 Controller로 돌아갔을 때 받아와지지 않음. 
			
			//JSON 타입의 Response 메세지 읽어오기
			BufferedReader bf = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			
			while((line = bf.readLine()) != null) {
				result += line;
			}
			System.out.println("response body: " + result);
			
			//Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
			
			System.out.println("access_token : "+ access_Token );
			System.out.println("refresh_token : "+ refresh_Token );
			
			bf.close();
			bw.close();
			
		return access_Token;
	}
	//카카오로그인 > 사용자 정보 요청
	public Kakao prouserinfo(String access_Token) throws Exception{
		HashMap<String, Object> prouserinfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			System.out.println(url);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : "+responseCode);
			
			BufferedReader bf = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			
			while((line = bf.readLine())!=null) {
				result +=line;
			}
			System.out.println("response body: "+result);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			System.out.println("properties : "+properties);
			System.out.println(properties.getAsJsonObject().get("nickname"));
			System.out.println(properties.getAsJsonObject().get("nickname").getAsString());
			System.out.println(properties.getAsJsonObject().get("email").getAsString());
			
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			System.out.println(nickname);
			
			prouserinfo.put("nickname", nickname);
			prouserinfo.put("email", email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//정보 들어있는지 확인
		Kakao result = pdao.findkakao(prouserinfo);
		System.out.println("S: "+result);
		if(result == null) { //없으면 저장
			pdao.kakaoinsert(prouserinfo);
			return pdao.findkakao(prouserinfo);
		}else {
			return result;
		}
	}
	//아이디 찾기
	@Override
	public Prouser findid(Prouser prouser) throws Exception{
		return pdao.findid(prouser);
	}
	//비밀번호 찾기
	@Override
	public int findpw(Prouser prouser) throws Exception{
		return pdao.findpw(prouser);
	}
	//비밀번호 재설정
	@Override
	public int updatepw(Prouser puser) throws Exception{
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securepw = encoder.encode(puser.getUs_pw());
		puser.setUs_pw(securepw);
		return pdao.updatepw(puser);
	}
}
