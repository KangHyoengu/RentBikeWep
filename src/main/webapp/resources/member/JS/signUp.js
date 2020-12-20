$('input:button[name=emailChk]').focus(() => {
	$(event.target).blur();
});


$("input:text[name=mid]").on("propertychange change keyup paste input",() => {
	if(parseInt($("input:button[name=idChk]").attr("data-chk")) != 0){
		$("input:button[name=idChk]").attr("data-chk", 0);
	}
});

$('input:button[name=idChk]').click(() => {
	const id = $("input:text[name=mid]").val().trim();
	
	$.ajax({
		url: "./idOk?id=" + id,
		type: "GET",
		cache: false,
		success: function(data, status) {
			if(status == "success"){
				if(data.status == "OK"){
					if(data.count == 0){
						alert('사용 가능한 아이디입니다.');
						$("input:button[name=idChk]").attr("data-chk", 1);
					} else {
						alert('이미 사용중인 아이디입니다.');
					}
				} else {
					alert("아이디를 다시 입력해 주세요.");
				}
			}
		}
	});
});

function submitChk() {
	const username = $("input:text[name=mid]").val().trim();
	const password = $("input:password[name=mpw]").val().trim();
	const passwordChk = $("input:password[name=passwordChk]").val().trim();
	const email = $("input:text[name=memail]").val().trim();
	const name = $("input:text[name=mname]").val().trim();
	const birth = $("input:text[name=mbirth]").val().trim();
	const phone = $("input:text[name=mphone]").val().trim();
	
	const regUsername = /^[a-zA-Z0-9]*$/;
	const regPassword = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/;
	const regKor = /^[가-힣]*$/;
	const regNum = /^[0-9]*$/;
	const regBirth = /^[0-9]{8}$/;
	const regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	if(username == "" || username == null || 
			password == "" || password == null || 
			email == "" || email == null || 
			name == "" || name == null || 
			birth == "" || birth == null || 
			phone == "" || phone == null){
		
		alert("빈칸없이 작성해 주세요.");
		return false;
	}
	
	if(!regUsername.test(username)){
		alert("아이디는 영문 + 숫자 조합(8~10자리)으로 작성해 주세요.");
		$("input:text[name=mid]").focus();
		return false;
	}
	
	if(parseInt($("input:button[name=idChk]").attr("data-chk")) == 0){
		alert('아이디 중복확인을 해주세요.');
		return false;
	}
	
	if(!regPassword.test(password)){
		alert("비밀번호는 영문 + 숫자 조합으로 작성해 주세요.");
		$("input:password[name=mpw]").focus();
		return false;
	}
	
	if(passwordChk != password){
		alert("비밀번호 확인이 비밀번호와 같지 않습니다.");
		$("input:password[name=passwordChk]").focus();
		return false;
	}
	
	if(!regEmail.test(email)){
		alert("이메일 형식에 맞게 작성해 주세요.");
		$("input:text[name=memail]").focus();
		return false;
	}
	
	if(!regKor.test(name)){
		alert("이름은 한글만 가능합니다.");
		$("input:password[name=mname]").focus();
		return false;
	}
	
	if(!regBirth.test(birth)){
		alert("생년월일 형식에 맞게 작성해 주세요.");
		$("input:text[name=mbirth]").focus();
		return false;
	}
	
	if(!regNum.test(phone)){
		alert("전화번호는 숫자만 가능합니다.");
		$("input:text[name=mphone]").focus();
		return false;
	}
	
	return true;
}