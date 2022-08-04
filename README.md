

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
<h3>𝙐𝙎𝙀𝙍 & 𝙍𝙀𝙎𝙐𝙈𝙀 & 𝙋𝙍𝙊𝙅𝙀𝘾𝙏 & 𝘼𝘿𝙈𝙄𝙉</h3>
<summary><h3>서언주</h3></summary>
<details>
	<summary><h4>𝐌𝐚𝐢𝐧</h4></summary>
	<div markdown="1">
	<p>𝐌𝐚𝐢𝐧</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916709-3a0e3bd7-ed25-4c55-a583-a611c45ffbb0.gif">
	
```html
✅ 𝑫𝒆𝒔𝒄𝒓𝒊𝒑𝒕𝒊𝒐𝒏 
▸ 배너를 크게 두어 홈페이지 구성이 풍부해보이도록
▸ 가장 하단에는 서비스를 이용한 고객들의 경험을 이미지로 나열하여 친근한 느낌 부여
```
<p>𝐌𝐚𝐢𝐧 - 𝚖𝚎𝚗𝚞</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916760-5225deea-024e-4f4b-945b-7a46cc5e27e9.gif">
	<br>
	
```html
✅ 𝑫𝒆𝒔𝒄𝒓𝒊𝒑𝒕𝒊𝒐𝒏 
▸ 로그인 여부를 판별하여 서비스 이동 가능여부 결정
▸ 프로젝트 목록만 비회원으로 조회 가능
```
</details>
<details>
<summary><h4>𝐉𝐎𝐈𝐍</h4></summary>
<p>𝐉𝐎𝐈𝐍</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916734-46d51f3f-f14a-44c5-a53f-8b5756ae9114.gif">
	
```html
✅ 𝑫𝒆𝒔𝒄𝒓𝒊𝒑𝒕𝒊𝒐𝒏 
▸ 약관 동의없이 다음단계로 진행할 수 없음
▸ 필요 정보를 입력받을 수 있는 화면
▸ 아이디와 이메일은 중복확인을 거쳐야 함(Ajax)
▸ 비밀번호의 경우 javascript를 사용해서 동일했을 때 "일치합니다"가 출력되도록 구현
▸ Daum postcode api를 사용하여 우편번호와 주소, 상세주소 등을 기입
▸ 비밀번호는 BCryptpasswordencoder를 사용하여 암호화, DB에도 암호화된 상태로 저장
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
<p>𝐋𝐎𝐆𝐈𝐍 - 𝚊𝚙𝚙𝚛𝚘𝚟𝚎𝚍 𝚞𝚜𝚎𝚛</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916748-81c10960-2403-4b6e-a5f0-54ba987df8de.gif">
<p>𝐋𝐎𝐆𝐈𝐍 - 𝚞𝚗𝚊𝚙𝚙𝚛𝚘𝚟𝚎𝚍 𝚞𝚜𝚎𝚛</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916751-07065bae-b14f-4605-8974-706246b2a94f.gif">
	
```html
✅ 𝑫𝒆𝒔𝒄𝒓𝒊𝒑𝒕𝒊𝒐𝒏 
▸ 아이디와 비밀번호 일치 여부를 반환
▸ 승인된 회원의 경우 메인홈페이지로 이동
▸ 미승인 회원은 프로젝트 공고 등록 및 신청 등이 제한됨
▸ 암호화 된 상태로 저장된 비밀번호와, 로그인 시 입력하는 비밀번호를 비교하기 위해 
 BCryptPasswordEncoder class의 matchers method를 사용해 비교 후 로그인 성공 여부 반환
```
<p>𝐋𝐎𝐆𝐈𝐍 - 𝚏𝚒𝚗𝚍 𝙸𝙳</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916741-e39716fa-0faa-42c0-816f-1853accb5522.gif">
	
```html
✅ 𝑫𝒆𝒔𝒄𝒓𝒊𝒑𝒕𝒊𝒐𝒏 
▸ 필요 정보를 모두 입력 후 해당 정보와 일치하는 회원이 있는지 조회
▸ 조회결과 alert으로 반환
```
<p>𝐋𝐎𝐆𝐈𝐍 - 𝚏𝚒𝚗𝚍 𝙿𝚊𝚜𝚜𝚠𝚘𝚛𝚍</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916744-ef2056fe-2c72-4f8e-a110-a257f032ef1f.gif">
	
```html
✅ 𝑫𝒆𝒔𝒄𝒓𝒊𝒑𝒕𝒊𝒐𝒏 
▸ 필요 정보를 모두 입력 후 해당 정보와 일치하는 회원이 있는지 조회
▸ 조회결과 일치하는 회원이 없으면 alert으로 반환
▸ 일치하는 회원이 있다면 비밀번호 재설정 페이지로 이동 후 재설정 
	(BCryptPasswordEncoder class로 암호화 후 DB 업데이트)
```
</details>
<details>
<summary><h4>𝐌𝐘 𝐏𝐀𝐆𝐄</h4></summary>
	<p>𝐌𝐘 𝐏𝐀𝐆𝐄 - 𝙲𝚑𝚊𝚗𝚐𝚒𝚗𝚐 𝚒𝚗𝚏𝚘𝚛𝚖𝚊𝚝𝚒𝚘𝚗</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916769-dd4a3c35-235a-480d-bbef-16397184e547.gif">
	
```html
✅ 𝑫𝒆𝒔𝒄𝒓𝒊𝒑𝒕𝒊𝒐𝒏 
▸ 개인정보 수정 전 본인확인 절차 - 로그인 로직과 동일하게 matchers method를 사용해 일치여부 반환
▸ 이메일은 ajax를 사용해 중복확인 후 중복 이메일이 없을 경우에만 수정이 가능(회원가입과 동일)
▸ 하단 수정하기 버튼 클릭시 입력한 내용 수정 후 정보수정화면 출력
▸ 돌아가기 버튼 클릭시 마이페이지 메인으로 돌아감
```

<p>𝐌𝐘 𝐏𝐀𝐆𝐄 - 𝚠𝚛𝚒𝚝𝚎 𝚛𝚎𝚜𝚞𝚖𝚎</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916778-37bbc50d-1d41-4998-bef0-6b96871978cb.gif">
	<img src="https://user-images.githubusercontent.com/92707182/181916782-0de4e363-07be-40f3-9ac4-582e6f1986b5.gif">
	
```html
✅ 𝑫𝒆𝒔𝒄𝒓𝒊𝒑𝒕𝒊𝒐𝒏 
▸ MultipartFile (스프링 제공) 인터페이스로 이력서 사진 업로드
▸ JS를 통해 이미지 태그에 속성 부여, 미리볼 수 있도록 구현
▸ 경력사항 및 자격증은 항목 추가 및 삭제 기능
▸ 자격증명이 기재되어 있지 않으면 항목 추가가 되지 않음
▸ 이력서와 자격증, 경력사항은 테이블을 별도로 두어 이력서 하나당 최대 3개씩 입력할 수 있도록 구현
▸ 홈페이지 입력 및 공개여부 설정 후 등록 가능
▸ 공개여부에 따라 추후 이력서 수정 및 삭제가 가능 - 공개시 수정 불가, 공개 후 프로젝트 신청시 해당 이력서 삭제 불가
```

<details><summary><h5>𝑪𝒐𝒅𝒆</h5></summary>

```javascript
✅ 𝑪𝒐𝒅𝒆
//이미지 미리보기 
<script type="text/javascript">
	let fileTag = document.querySelector("input[name=f]");
	let divPreview = document.querySelector("#div-preview");
	fileTag.onchange = function() {
		if(fileTag.files.length > 0) {
		//이미지 src에 들어갈 데이터 구하기
			for (let i = 0; i<fileTag.files.length; i++) { let reader = new FileReader();
				reader.onload = function(data) {
				let src = data.target.result;
				//1. 이미지 태그 만들기
				let imgTag = document.createElement('img');
				//2. 이미지 태그 속성들 세팅하기imgTag.setAttribute('src', src);
				imgTag.setAttribute('width', '200');
				imgTag.setAttribute('height', '300');
				//3. 이미지 태그 div안에 넣기
				divPreview.appendChild(imgTag);
			}reader.readAsDataURL(fileTag.files[i]);}
		} else {divPreview.innerHTML = "";
	}}
<script>
```
</details>
<p>𝐌𝐘 𝐏𝐀𝐆𝐄 - 𝚎𝚍𝚒𝚝 𝚛𝚎𝚜𝚞𝚖𝚎</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916786-0c8f3d2c-f7bf-4fda-9ec3-1017dbd3faa8.gif">

```html
✅ 𝑫𝒆𝒔𝒄𝒓𝒊𝒑𝒕𝒊𝒐𝒏 
▸ 이력서 목록에서 이력서명 클릭시 해당 이력서 내용 조회 가능
▸ 비공개된 이력서인 경우에만 수정 가능
▸ 인적사항 수정 가능
▸ 수정 전 정보를 받아오기 위해 value로 저장된 값 input태그에 출력
```
<p>𝐌𝐘 𝐏𝐀𝐆𝐄 - 𝚍𝚎𝚕𝚎𝚝𝚎 𝚛𝚎𝚜𝚞𝚖𝚎</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916790-972158f3-6a70-41ff-9a92-332f48bb8a9c.gif">
	
```html
✅ 𝑫𝒆𝒔𝒄𝒓𝒊𝒑𝒕𝒊𝒐𝒏 
▸ 프로젝트 신청시 제출한 이력서는 삭제 불가
▸ 프로젝트 신청하지 않은 이력서(혹은 비공개된 이력서)는 삭제 가능
```
</details>
<details>
<summary><h4>𝐏𝐑𝐎𝐉𝐄𝐂𝐓</h4></summary>
	<p>𝐏𝐑𝐎𝐉𝐄𝐂𝐓 - 𝚙𝚛𝚘𝚓𝚎𝚌𝚝 𝚛𝚎𝚐𝚒𝚜𝚝𝚛𝚊𝚝𝚒𝚘𝚗</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916798-1f194c1a-6fca-4554-a296-271dc86238da.gif">
	
```html
✅ 𝑫𝒆𝒔𝒄𝒓𝒊𝒑𝒕𝒊𝒐𝒏 
▸ 헤더에서 project선택해 들어가면 관리자의 승인을 받은 프로젝트 목록 조회 가능
▸ 기업은 프로젝트 화면 하단에 프로젝트 등록버튼이 생성됨
▸ 클릭시 공고 내용을 입력할 수 있는 화면으로 이동
▸ 카테고리 및 제목, 내용 입력 가능
▸ 내용의 경우 ckeditor api를 사용
▸ 하단에서 작업기간, 모집인원, 예산 입력 가능(필수 입력 사항) 
▸ 첨부파일의 경우 MultipartFile을 활용하여 이력서와 동일하게 구현
▸ 미리보기 img태그의 경우 실제 프로젝트 공고 확인 때와 비슷한 크기로 출력
▸ 등록버튼 클릭 시 프로젝트 현황으로 이동하여 관리자 승인 대기중인 프로젝트 확인 가능
▸ 관리자 승인 완료된 프로젝트 또한 조회가 가능하며 해당 페이지에서 프리랜서 선정 페이지로 이동
```
<p>𝐏𝐑𝐎𝐉𝐄𝐂𝐓 - 𝚍𝚎𝚕𝚎𝚝𝚎  𝚙𝚛𝚘𝚓𝚎𝚌𝚝</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916804-3227ccde-42b0-4217-9c57-556601c16312.gif">
	
```html
✅ 𝑫𝒆𝒔𝒄𝒓𝒊𝒑𝒕𝒊𝒐𝒏 
▸ 기업의 마이페이지에서 프로젝트 현황 조회 가능
▸ 관리자 승인대기상태인 프로젝트는 삭제 가능
```
<p>𝐏𝐑𝐎𝐉𝐄𝐂𝐓 - 𝚙𝚛𝚘𝚓𝚎𝚌𝚝 𝚊𝚙𝚙𝚕𝚒𝚌𝚊𝚝𝚒𝚘𝚗</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916838-389427b8-2556-44f5-ac7b-67e4cc150514.gif">
	
```html
✅ 𝑫𝒆𝒔𝒄𝒓𝒊𝒑𝒕𝒊𝒐𝒏 
▸ 헤더에서 project선택해 들어가면 관리자의 승인을 받은 프로젝트 목록 조회 가능
▸ 프로젝트명 클릭 후 상세조회 페이지로 들어가면, 내용 조회 가능
▸ 프로젝트 신청하기 버튼 클릭시 신청페이지로 이동
▸ 로그인된 회원의 '공개된' 이력서 목록만 불러옴
▸ checkbox 체크 후 프로젝트 신청하기 클릭 시 해당 이력서와 본인 정보가 기업측에게 전달됨
▸ 신청완료 시 마이페이지 메인으로 이동
▸ 신청중인 프로젝트 건수가 증가되며, 하단 프로젝트명 클릭시 신청한 프로젝트 상세조회 화면으로 이동
▸ 선정완료 시 좌측 진행중인 프로젝트로 이동 (신청중인 프로젝트와 동일하게 조회 가능)
```
<p>𝐏𝐑𝐎𝐉𝐄𝐂𝐓 - 𝚏𝚛𝚎𝚎𝚕𝚊𝚗𝚌𝚎𝚛 𝚜𝚎𝚕𝚎𝚌𝚝𝚒𝚘𝚗</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916808-7f7c898d-85fc-4d3c-be9e-90668e6d5dcd.gif">
	
```html
✅ 𝑫𝒆𝒔𝒄𝒓𝒊𝒑𝒕𝒊𝒐𝒏 
▸ 기업 아이디로 로그인 후 마이페이지로 이동하면 진행중인 프로젝트와, 관리자의 승인을 기다리는 프로젝트 건수 및 해당 프로젝트 조회 가능
▸ 기업 정보조회(정보수정) 하단 프로젝트 관리 버튼 클릭 시 프로젝트 현황 페이지로 이동
▸ 프로젝트 현황에서 프로젝트명 클릭 시 해당 프로젝트에 신청한 프리랜서 목록 조회 가능
▸ 프로젝트 명 클릭시 해당 프로젝트를 신청한 프리랜서, 이미 선정된 프리랜서 목록 조회 가능
▸ 신청현황에 있는 이력서 제목 클릭 시 새창에서 해당 이력서 조회 가능
▸ 새창을 띄워 프로젝트에 신청한 이력서를 조회할 수 있도록 함
▸ 사진 및 인적사항, 경력사항, 자격증 모두 조회 가능하며 가장 하단 창닫기 버튼을 이용해 창 닫기 가능
▸ 신청현황에서 checkbox 클릭 후 선정하기 클릭 시 선정 완료
▸ 프로젝트 신청현황목록에서 해당 프로젝트 신청현황으로 이동하면 선정현황에 이동되어 있는 프리랜서 조회 가능
▸ 선정 완료된 프리랜서라도 이력서 조회 가능
```
</details>
<details>
<summary><h4>𝐀𝐃𝐌𝐈𝐍</h4></summary>
	<p>𝐀𝐃𝐌𝐈𝐍 - 𝚕𝚘𝚐𝚒𝚗 & 𝚖𝚊𝚒𝚗</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916817-9a8a6a81-eab1-4047-8b26-73b9b6bd9689.gif">
	
```html
✅ 𝑫𝒆𝒔𝒄𝒓𝒊𝒑𝒕𝒊𝒐𝒏 
▸ 관리자 로그인(푸터에 존재)시 헤더가 관리자 헤더로 변경됨
▸ 관리자는 회원 및 프로젝트 승인 가능
▸ 승인해야하는 건수 메인에서 조회 가능
▸ 회원 검색 및 승인 페이지로 이동 또한 메인페이지에서 가능
```
<p>𝐀𝐃𝐌𝐈𝐍 - 𝚊𝚙𝚙𝚛𝚘𝚟𝚎 𝚞𝚜𝚎𝚛</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916820-b1b1f629-ead9-40e5-b880-82c8628ece60.gif">
	
```html
✅ 𝑫𝒆𝒔𝒄𝒓𝒊𝒑𝒕𝒊𝒐𝒏 
▸ 관리자 메인페이지에서 회원승인 페이지로 이동
▸ 미승인 받은 회원 목록을 불러옴
▸ 회원 선택 checkbox 클릭 후 수락버튼 누르면 회원 승인 완료
▸ 한 번에 여러 회원을 승인할 수 없도록 JS를 이용해 2개이상 클릭할 수 없도록 구현
```
<p>𝐀𝐃𝐌𝐈𝐍 - 𝚊𝚙𝚙𝚛𝚘𝚟𝚎 𝚙𝚛𝚘𝚓𝚎𝚌𝚝</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916824-c95ba6d4-89a1-41e3-86da-4aba924649b9.gif">
	
```html
✅ 𝑫𝒆𝒔𝒄𝒓𝒊𝒑𝒕𝒊𝒐𝒏 
▸ 관리자 메인페이지에서 프로젝트 승인 페이지로 이동
▸ 미승인 받은 프로젝트 목록을 불러옴
▸ 프로젝트명 클릭 시 기업이 업로드한 공고 새창에서 상세 조회 가능
▸ 프로젝트 번호(no) checkbox 클릭 후 수락버튼 누르면 프로젝트 승인 완료
▸ 한 번에 여러 프로젝트를 승인할 수 없도록 JS를 이용해 2개이상 클릭할 수 없도록 구현
```
<p>𝐀𝐃𝐌𝐈𝐍 - 𝚜𝚎𝚊𝚛𝚌𝚑 𝚞𝚜𝚎𝚛</p>
	<img src="https://user-images.githubusercontent.com/92707182/181916827-4bc089ed-5303-488c-ab65-4b27825d3017.gif">
	
```html
✅ 𝑫𝒆𝒔𝒄𝒓𝒊𝒑𝒕𝒊𝒐𝒏 
▸ 관리자 메인페이지 우측 검색창에 회원 이름 혹은 아이디로 검색 가능
▸ 일치하는 회원이 있는 경우 회원 정보 조회 페이지로 이동
▸ 비밀번호를 제외한 정보 조회 가능
▸ 일치하는 정보가 없는 경우 없다고 정보 회신 
```

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



