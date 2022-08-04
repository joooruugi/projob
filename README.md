

# PROJOB
KH_정보교육원 파이널 프로젝트

![image](https://user-images.githubusercontent.com/92707182/181875397-36a54d8c-361e-4533-8ecf-feb44a7baaad.png)

### 0️⃣ 개발 주제 / 목표


#### 📖다양한 프로젝트와 유능한 프리랜서를 이어주는 플랫폼 서비스

- "직접고용보다 외주로 전환" 고정비 부담으로 우수개발자 옥석 가리기
- 프로젝트당 근무가 가능한 직군인 "개발자"에 초점
- 독창성과 차별점을 가진 개발자만의 구인·구직 홈페이지를 만들자 ! 



![image](https://user-images.githubusercontent.com/92707182/181875443-e9c4172a-8042-4e2b-b31d-b5eee6b05a81.png)



### 1️⃣ 팀소개 / 개발 주안점
![image](https://user-images.githubusercontent.com/92707182/181875432-49ba300d-6020-4341-8535-7695292d28cd.png)
![image](https://user-images.githubusercontent.com/92707182/181875458-621c6f5e-92d6-41cf-89a4-3d7794e63712.png)
![image](https://user-images.githubusercontent.com/92707182/181875462-d2eaca6a-fa37-4dfd-8736-96ecdfc1d9aa.png)


#### 🔎개발 주안점

1. **최소한의 오류**

   주기적인 상황 공유와 다회의 테스트를 통해 나타날 수 있는 오류를 최소화함

2. **독창성과 차별점**

   기존 구인·구직 사이트와 차별점을 두기 위해 협업툴 구현, 이로 인해 독창성을 가진 홈페이지로 발전

3. **사용자 편의성**

   홈페이지의 흐름을 생각하여 상세한 시나리오 작성, 사용자 이용에 불편함이 없도록 구현

   

## 2️⃣ 개발 환경 / 사용 기술 / ERD

![image](https://user-images.githubusercontent.com/92707182/181875470-8c9507b4-28d8-4c50-bf59-6f31f325b428.png)


![Projob erd_cloud](https://user-images.githubusercontent.com/92707182/181875815-7795b9e3-f1fc-4c37-bd15-421245d170cb.png)



## 3️⃣ 주요 기능 / 화면

<details>
<summary><h3>서언주</h3></summary>
<details>
	<summary><h4>𝐌𝐚𝐢𝐧</h4></summary>
	<div markdown="1">
	<p>𝐌𝐚𝐢𝐧</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916709-3a0e3bd7-ed25-4c55-a583-a611c45ffbb0.gif">
	<br>
	
```html
✅ 𝑫𝒆𝒔𝒄𝒓𝒊𝒑𝒕𝒊𝒐𝒏 
▸ 배너를 크게 두어 홈페이지 구성이 풍부해보이도록
▸ 가장 하단에는 서비스를 이용한 고객들의 경험을 이미지로 나열하여 친근한 느낌 부여
```
<br>
<p>𝐌𝐚𝐢𝐧 - 𝚖𝚎𝚗𝚞</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916760-5225deea-024e-4f4b-945b-7a46cc5e27e9.gif">
	<br>
	
```html
✅ 𝑫𝒆𝒔𝒄𝒓𝒊𝒑𝒕𝒊𝒐𝒏 
▸ 로그인 여부를 판별하여 서비스 이동 가능여부 결정
▸ 프로젝트 목록만 비회원으로 조회 가능
```
</details>
<br>
<details>
<summary><h4>𝐉𝐎𝐈𝐍</h4></summary>
<p>𝐉𝐎𝐈𝐍</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916734-46d51f3f-f14a-44c5-a53f-8b5756ae9114.gif">
	<br>
	
```html
✅ 𝑫𝒆𝒔𝒄𝒓𝒊𝒑𝒕𝒊𝒐𝒏 
▸ 필요 정보를 입력받을 수 있는 화면
▸ 아이디와 이메일은 중복확인을 거쳐야 함
▸ 비밀번호의 경우 javascript를 사용해서 동일했을 때 "일치합니다"가 출력되도록 구현
▸ 담당자 이름, 연락처, 이메일의 경우 기업 회원을 위한 항목
```
<details><summary><h5>𝑪𝒐𝒅𝒆</h5></summary>

```javascript
✅ 𝑪𝒐𝒅𝒆
//아이디 중복확인
<script>
$(function() {
	$(".idchk1").hide();
	$(".idchk2").hide();
	$('#checkid').click(function() {
		var us_id=$("#us_id").val();
		if (us_id != '') {
			$.ajax({
			type : 'post',
			url :'/projob/idchk',
			data : {us_id :us_id},
			success : 
				function(result) {
					if (result == '0') {
						$(".idchk1").show();
						$(".idchk2").hide();
					} else{
						$(".idchk2").show();
						$(".idchk1").hide();
					}
					},error : function(a, b, c) {
						console.log(a, b, c);}
			});
		} else { 
		alert('아이디를 입력해주세요.');
		$('#us_id').focus();
		}
	});
});
</script>
```
</details>
</details>
<details>
<summary><h4>𝐋𝐎𝐆𝐈𝐍</h4></summary>
<br>
<p>𝐋𝐎𝐆𝐈𝐍 - 𝚊𝚙𝚙𝚛𝚘𝚟𝚎𝚍 𝚞𝚜𝚎𝚛</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916748-81c10960-2403-4b6e-a5f0-54ba987df8de.gif">
<p>𝐋𝐎𝐆𝐈𝐍 - 𝚞𝚗𝚊𝚙𝚙𝚛𝚘𝚟𝚎𝚍 𝚞𝚜𝚎𝚛</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916751-07065bae-b14f-4605-8974-706246b2a94f.gif">
<p>𝐋𝐎𝐆𝐈𝐍 - 𝚏𝚒𝚗𝚍 𝙸𝙳</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916741-e39716fa-0faa-42c0-816f-1853accb5522.gif">
<p>𝐋𝐎𝐆𝐈𝐍 - 𝚏𝚒𝚗𝚍 𝙿𝚊𝚜𝚜𝚠𝚘𝚛𝚍</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916744-ef2056fe-2c72-4f8e-a110-a257f032ef1f.gif">
</details>
<details>
<summary><h4>𝐌𝐘 𝐏𝐀𝐆𝐄</h4></summary>
	<p>𝐌𝐘 𝐏𝐀𝐆𝐄 - 𝙲𝚑𝚊𝚗𝚐𝚒𝚗𝚐 𝚒𝚗𝚏𝚘𝚛𝚖𝚊𝚝𝚒𝚘𝚗</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916769-dd4a3c35-235a-480d-bbef-16397184e547.gif">
	<p>𝐌𝐘 𝐏𝐀𝐆𝐄 - 𝚠𝚛𝚒𝚝𝚎 𝚛𝚎𝚜𝚞𝚖𝚎</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916778-37bbc50d-1d41-4998-bef0-6b96871978cb.gif">
	<br>
	<img src="https://user-images.githubusercontent.com/92707182/181916782-0de4e363-07be-40f3-9ac4-582e6f1986b5.gif">
	<p>𝐌𝐘 𝐏𝐀𝐆𝐄 - 𝚎𝚍𝚒𝚝 𝚛𝚎𝚜𝚞𝚖𝚎</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916786-0c8f3d2c-f7bf-4fda-9ec3-1017dbd3faa8.gif">
	<p>𝐌𝐘 𝐏𝐀𝐆𝐄 - 𝚍𝚎𝚕𝚎𝚝𝚎 𝚛𝚎𝚜𝚞𝚖𝚎</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916790-972158f3-6a70-41ff-9a92-332f48bb8a9c.gif">
</details>
<details>
<summary><h4>𝐏𝐑𝐎𝐉𝐄𝐂𝐓</h4></summary>
	<p>𝐏𝐑𝐎𝐉𝐄𝐂𝐓 - 𝚙𝚛𝚘𝚓𝚎𝚌𝚝 𝚛𝚎𝚐𝚒𝚜𝚝𝚛𝚊𝚝𝚒𝚘𝚗</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916798-1f194c1a-6fca-4554-a296-271dc86238da.gif">
	<p>𝐏𝐑𝐎𝐉𝐄𝐂𝐓 - 𝚍𝚎𝚕𝚎𝚝𝚎  𝚙𝚛𝚘𝚓𝚎𝚌𝚝</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916804-3227ccde-42b0-4217-9c57-556601c16312.gif">
	<p>𝐏𝐑𝐎𝐉𝐄𝐂𝐓 - 𝚙𝚛𝚘𝚓𝚎𝚌𝚝 𝚊𝚙𝚙𝚕𝚒𝚌𝚊𝚝𝚒𝚘𝚗</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916838-389427b8-2556-44f5-ac7b-67e4cc150514.gif">
	<p>𝐏𝐑𝐎𝐉𝐄𝐂𝐓 - 𝚏𝚛𝚎𝚎𝚕𝚊𝚗𝚌𝚎𝚛 𝚜𝚎𝚕𝚎𝚌𝚝𝚒𝚘𝚗</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916808-7f7c898d-85fc-4d3c-be9e-90668e6d5dcd.gif">
</details>
<details>
<summary><h4>𝐀𝐃𝐌𝐈𝐍</h4></summary>
	<p>𝐀𝐃𝐌𝐈𝐍 - 𝚕𝚘𝚐𝚒𝚗 & 𝚖𝚊𝚒𝚗</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916817-9a8a6a81-eab1-4047-8b26-73b9b6bd9689.gif">
	<p>𝐀𝐃𝐌𝐈𝐍 - 𝚊𝚙𝚙𝚛𝚘𝚟𝚎 𝚞𝚜𝚎𝚛</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916820-b1b1f629-ead9-40e5-b880-82c8628ece60.gif">
	<p>𝐀𝐃𝐌𝐈𝐍 - 𝚊𝚙𝚙𝚛𝚘𝚟𝚎 𝚙𝚛𝚘𝚓𝚎𝚌𝚝</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916824-c95ba6d4-89a1-41e3-86da-4aba924649b9.gif">
	<p>𝐀𝐃𝐌𝐈𝐍 - 𝚜𝚎𝚊𝚛𝚌𝚑 𝚞𝚜𝚎𝚛</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916827-4bc089ed-5303-488c-ab65-4b27825d3017.gif">
</div>
</details>
</details>

<details>
	<summary><h3>재우</h3></summary>
		<p>메인</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916709-3a0e3bd7-ed25-4c55-a583-a611c45ffbb0.gif">
	<p>메인-메뉴클릭</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916760-5225deea-024e-4f4b-945b-7a46cc5e27e9.gif">
	<div markdown="1">
	<p>메신저 메인페이지</p>
	<img src="https://user-images.githubusercontent.com/95215865/182032197-398c8640-f171-4d7b-9e61-6b15cef54727.gif">
	<p>메신저 메세지 수신/발신</p>
	<img src="https://user-images.githubusercontent.com/95215865/182032381-03b7d983-59cf-4082-b5b9-e1ad50b5ebd9.gif">
	<p>메신저 대화방 생성</p>
	<img src="https://user-images.githubusercontent.com/95215865/182032402-0b3e665f-7417-4587-b53c-e255a01da86b.gif">
	<p>메신저 대화방 초대</p>
	<img src="https://user-images.githubusercontent.com/95215865/182032428-789c191a-eb0f-4a1d-9786-b3b533c8100f.gif">
	<p>메신저 대화방 나가기</p>
	<img src="https://user-images.githubusercontent.com/95215865/182032443-283cec38-f06f-4d85-9022-0c03b7602043.gif">
	<p>메신저 대화방 참가자 목록</p>
	<img src="https://user-images.githubusercontent.com/95215865/182032458-3ca7e43a-787a-4850-9237-1df237128b2a.gif">
	<p>파일공유 메인페이지</p>
	<img src="https://user-images.githubusercontent.com/95215865/182032475-cb591e8d-6841-42d4-ae5d-4e557fc74fc6.gif">
	<p>파일공유 파일등록</p>
	<img src="https://user-images.githubusercontent.com/95215865/182032490-3077b664-fa7e-426b-a793-1de5c3d22133.gif">
	<p>파일공유 리스트 삭제</p>
	<img src="https://user-images.githubusercontent.com/95215865/182032499-87500cd5-aa84-4215-91b2-63af8d68170a.gif">
	<p>파일공유 리스트 검색</p>
	<img src="https://user-images.githubusercontent.com/95215865/182032508-ca245702-67c2-48f2-9a9c-d47d65027f85.gif">
	<p>파일공유 파일 다운로드</p>
	<img src="https://user-images.githubusercontent.com/95215865/182032520-16b92ddb-e23f-4438-a884-b88f3eb65b17.gif">
</div>
</details>


## 4️⃣  관련 산출물

```html
0.1팀
	1팀_의견취합.xlsx
	1팀_일정관리.xlsx
	1팀_History.xlsx

1. 명세서
	1팀_시퀀스 다이어그램
		메신저 시퀀스.mdj
		시퀀스_프리랜서 회원가입.mdj
	1팀_요구사항명세서.xlsx
	기능취합.xlsx

2. DB
	1팀_테이블기술서.xlsx
	Projob erd_cloud.png

3. UX/UI
	1팀_메뉴트리
		프로젝트 공고.pptx
		협업툴 메뉴트리.pptx
		회원가입/로그인/마이페이지.pptx
	FINAL-WIREFRAME.pptx

4. 기획/설계발표
	1팀_프로젝트정보.docx
	PROJOB-기획발표.pptx

5. 구현/테스트
	1팀_ClassMapping.xlsx
	1팀_TestCase.xlsx

6. 최종산출물
	PROJOB_최종발표.pptx
```

##### 💾구글 드라이브 링크

https://drive.google.com/drive/folders/1Wn3cMSlJPOyGQO8V3o05br86vCeNwl7e?usp=sharing


## 5️⃣ 개발 일정
![image](https://user-images.githubusercontent.com/92707182/181875548-6feb856a-3624-45af-80da-b0128368cc53.png)



