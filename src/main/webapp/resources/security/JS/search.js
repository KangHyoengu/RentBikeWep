const _csrf = $('input:hidden[name=_csrf]').val();

$('input:button[name=search-btn]').click(() => {
	$('.wrap').css('margin-top', -1 * $('.login-wrap').height() - 10 + 'px');
});

$('input:button[name=go-login]').click(() => {
	$('.wrap').css('margin-top', 0);
});

$('button[name=code-send-btn]').click(() => {
	const mid = $('input:text[name=mid]').val().trim();
	const memail = $('input:text[name=email]').val().trim();
	
	if(mid == "" || memail == "") {
		alert('아이디와 이메일 모두 입력해 주세요.');
		return;
	}
	
	$.ajax({
		url: "./find",
		type: "POST",
		data: {
			'mid': mid,
			'memail': memail,
			'_csrf': _csrf
		},
		cache: false,
		success: function(data, status) {
			if(status == "success") {
				if(data.status == "OK") {
					if(data.count != 0) {
						alert('메일을 확인해 주세요.');
						
						$('.auth').removeClass('hidden');
						$('#search').removeAttr('disabled');
						$('input:text[name=email]').attr('readonly', true);
						$('input:text[name=mid]').attr('readonly', true);
					} else {
						alert('아이디 또는 이메일을 확인해 주세요.');
					}
				} else {
					alert('다시 시도해 주세요.');
				}
			} else {
				alert('다시 시도해 주세요.');
			}
		}
	});
});

$('input:text[name=code]').keydown(() => {
	if(event.keyCode == 13) {
		search();
	}
});

$('input:button[name=search]').click(() => {
	search();
});

function search() {
	const code = $('input:text[name=code]').val().trim();
	const memail = $('input:text[name=email]').val().trim();
	
	$.ajax({
		url: "./check",
		type: "GET",
		data: { 
			'code': code,
			'memail': memail
		},
		cache: false,
		success: function(data, status) {
			if(status == "success") {
				if(data.status == "OK") {
					if(data.count == 1) {
						$('input:hidden[name=mid]').val($('input:text[name=mid]').val());
						$('form[name=passwordChange]').submit();
					} else {
						alert('인증번호가 일치하지 않습니다.');
					}
				} else {
					alert('다시 시도해 주세요.');
				}
			} else {
				alert('다시 시도해 주세요.');
			}
		}
	});
}

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}