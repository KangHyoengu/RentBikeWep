const _csrf = $('input:hidden[name=_csrf]').val();

$('.search').keydown(() => {
	if(event.keyCode == 13) {
		const search = $(event.target).val().trim();
		
		if(search == "") {
			alert("검색어를 입력해 주세요.");
			return;
		}
		
		$.ajax({
			url: "./search",
			type: "GET",
			data: {
				"search": search
			},
			success: function(data, status) {
				if(status == "success") {
					loadMemberData(data);
				}
			}
		});
	}
});

$(document).on('click', '#tbody tr', () => {
	const mno = $(event.target).parent().attr('data-no');
	
	$.ajax({
		url: "./memberDetail",
		type: "GET",
		data: { "mno": mno },
		success: function(data, status) {
			if(status == "success") {
				loadDetailData(data);
			}
		}
	});
});

$('.remove').click(() => {
	if(confirm("회원 탈퇴 시키겠습니까?")){
		const mno = $('.modal-body').attr('data-no');
		
		$.ajax({
			url: "./deleteMember?mno=" + mno,
			type: "DELETE",
			beforeSend: function(xhr) {
				xhr.setRequestHeader('X-CSRF-Token', _csrf);
			},
			cache: false,
			success: function(data, status) {
				if(status == "success") {
					if(data.status == "OK") {
						alert('삭제되었습니다.');
						$('.btn-close').trigger('click');
						$('#tbody').html("");
					} else {
						alert('삭제하지 못했습니다.');
					}
				} else {
					alert('삭제하지 못했습니다.');
				}
			}
		});
	}
});

$(document).on('click', '.update', () => {
	$(event.target).text('수정 완료');
	$(event.target).removeClass('update');
	$(event.target).addClass('update-confirm');
	
	const mname = $('.memberName').text();
	const memail = $('.memberEmail').text();
	const mphone = $('.memberTel').text();
	let phone = "";
	
	const arr = mphone.split("-");
	for (var i = 0; i < arr.length; i++) {
		phone += arr[i];
	}
	
	$('.memberName').html('<input type="text" class="form-control" name="mname" value="' + mname + '" />');
	$('.memberEmail').html('<input type="text" class="form-control" name="memail" value="' + memail + '" />');
	$('.memberTel').html('<input type="text" class="form-control" name="mphone" value="' + phone + '" />');
});

$(document).on('click', '.update-confirm', () => {
	const mno = $('.modal-body').attr('data-no');
	const mname = $('input:text[name=mname]').val().trim();
	const memail = $('input:text[name=memail]').val().trim();
	const mphone = $('input:text[name=mphone]').val().trim();
	
	const regKor = /^[가-힣]*$/;
	const regPhone = /^[0-9]{10,11}$/;
	const regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	if(mname == "" || memail == "" || mphone == "") {
		alert('빈칸없이 입력해 주세요.');
		return;
	}
	
	if(!regKor.test(mname)){
		alert("이름은 한글만 가능합니다.");
		$("input:password[name=mname]").focus();
		return;
	}
	
	if(!regEmail.test(memail)){
		alert("이메일 형식에 맞게 작성해 주세요.");
		$("input:text[name=memail]").focus();
		return;
	}
	
	if(!regPhone.test(mphone)){
		alert("전화번호를 '-'없이 정확히 입력해 주세요.");
		$("input:text[name=mphone]").focus();
		return;
	}
	
	$.ajax({
		url: "./updateMember?mname=" + mname + "&memail=" + memail + "&mphone=" + mphone + "&mno=" + mno,
		type: "PUT",
		headers: { "X-CSRF-TOKEN": _csrf },
		cache: false,
		success: function(data, status) {
			if(status == "success") {
				if(data.status == "OK") {
					$('.memberName').html(mname);
					$('.memberEmail').html(memail);
					$('.memberTel').html(mphone);
					
					$(event.target).text('회원 수정');
					$(event.target).removeClass('update-confirm');
					$(event.target).addClass('update');
				} else {
					alert('수정하지 못했습니다.');
				}
			} else {
				alert('수정하지 못했습니다.');
			}
		}
	});
});

function loadMemberData(jsonObj) {
	const data = jsonObj.data;
	
	if(data.length == 0) {
		alert(jsonObj.message);
		return;
	}
	
	let str = "";
	
	for (var i = 0; i < data.length; i++) {
		str += '<tr data-bs-toggle="modal" data-bs-target="#member-detail" data-no="'+data[i].mno+'">';
		str += '<th class="userNum" scope="row">' + data[i].mno + '</th>';
		str += '<td class="userId">' + data[i].mid + '</td>';
		str += '<td class="userEmail">' + data[i].memail + '</td>';
		str += '<td class="userTel">' + data[i].mphone + '</td></tr>';
	}
	
	$('#tbody').html(str);
}

function loadDetailData(jsonObj) {
	const data = jsonObj.data[0];
	
	$('.modal-body').attr('data-no', data.mno);
	$('.memberId').text(data.mid);
	$('.memberName').text(data.mname);
	$('.memberEmail').text(data.memail);
	$('.memberBirth').text(data.mbirth.substr(0, 4)+"."+data.mbirth.substr(4, 2)+"."+data.mbirth.substr(6, 2));
	if(data.mphone.length == 11) {
		$('.memberTel').text(data.mphone.substr(0, 3) + "-" + data.mphone.substr(3, 4) + "-" + data.mphone.substr(7, 4));
	} else if(data.mphone.length == 10) {
		$('.memberTel').text(data.mphone.substr(0, 3) + "-" + data.mphone.substr(3, 3) + "-" + data.mphone.substr(6, 4));
	}
}
