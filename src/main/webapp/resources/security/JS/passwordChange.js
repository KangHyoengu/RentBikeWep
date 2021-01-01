const _csrf = $('input:hidden[name=_csrf]').val().trim();

$('button[name=change-btn]').click(() => {
	const mid = $('input:text[name=mid]').val().trim();
	const mpw = $('input:password[name=mpw]').val().trim();
	const mpwChk = $('input:password[name=mpwChk]').val().trim();
	
	const regPassword = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/;
	
	if(mpw == "" || mpwChk == "") {
		alert('빈칸없이 입력해 주세요.');
		return;
	}
	
	if(mpw != mpwChk) {
		alert('비밀번호 확인이 일치하지 않습니다.');
		$('input:password[name=mpwChk]').focus();
		return;
	}
	
	if(!regPassword.test(mpw)){
		alert("비밀번호는 영문 + 숫자 조합으로 작성해 주세요.");
		$('input:password[name=mpw]').focus();
		return;
	}
	
	$.ajax({
		url: "./pwChange",
		type: "POST",
		data: {
			'mpw': mpw,
			'mid': mid,
			'_csrf': _csrf
		},
		cache: false,
		success: function(data, status) {
			if(status == "success") {
				if(data.status == "OK" && data.count != 0){
					alert('비밀번호가 변경되었습니다.');
					location.href = getContextPath() + "/";
				} else {
					alert('다시 시도해 주세요.');
				}
			} else {
				alert('다시 시도해 주세요.');
			}
		}
	});
});

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}