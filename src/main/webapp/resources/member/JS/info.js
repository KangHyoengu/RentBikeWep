const mid = $('.username').text();
const _csrf = $('input:hidden[name=_csrf]').val();

$('.change-button').click(() => {
	const pw = $('input:password[name=password-change]').val().trim();
	const pwChk = $('input:password[name=password-change-check]').val().trim();
	const phone = $('input:text[name=phone]').val().trim();
	const mid = $('.username').text();
	
	const regPassword = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/;
	
	if(pw == "" || pwChk == "" || phone == "") {
		alert('빈칸없이 입력해 주세요.');
		return;
	}
	
	if(pw != pwChk) {
		alert('비밀번호 확인이 일치하지 않습니다.');
		$('input:password[name=password-change-check]').focus();
		return;
	}
	
	if(!regPassword.test(pw)){
		alert("비밀번호는 영문 + 숫자 조합으로 작성해 주세요.");
		$('input:password[name=password-change]').focus();
		return;
	}
	
	$.ajax({
		url: "./infoChange",
		type: "POST",
		data: {
			'mpw': pw,
			'mphone': phone,
			'mid': mid,
			'_csrf': _csrf
		},
		success: function(data, status) {
			if(status == "success"){
				if(data.status == "OK") {
					if(data.result != 0){
						alert('회원 정보가 수정 되었습니다.');
					} else {
						alert('회원 정보를 수정하지 못했습니다.');
					}
				} else {
					alert('회원 정보를 수정하지 못했습니다.');
				}
			} else {
				alert('회원 정보를 수정하지 못했습니다.');
			}
		}
	});
});

$.ajax({
	url: "./user_info?mid=" + mid,
	type: "GET",
	cache: false,
	success: function(data, status) {
		if(status == "success"){
			if(data.status == "OK"){
				loadData(data);
			} else {
				alert('에러발생! 페이지가 뒤로 이동합니다.');
				history.back();
			}
		} else {
			alert('에러발생! 페이지가 뒤로 이동합니다.');
			history.back();
		}
	}
});

function loadData(jsonObj) {
	const data = jsonObj.data[0];
	
	$('input:text[name=user-id]').val(data.mid);
	$('input:text[name=name]').val(data.mname);
	$('input:text[name=email]').val(data.memail);
	$('input:text[name=birth]').val(data.mbirth.substr(0, 4)+"."+data.mbirth.substr(4, 2)+"."+data.mbirth.substr(6, 2));
	$('input:text[name=phone]').val(data.mphone);
}