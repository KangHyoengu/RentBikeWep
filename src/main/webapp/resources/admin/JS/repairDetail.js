const category = ["타이어","핸들","체인","브레이크","안장","기타"];
const _csrf = $('input:hidden[name=_csrf]').val();

$(document).on('click', '#tbody tr', () => {
	const repairno = $(event.target).parent().attr('data-no');
	
	$.ajax({
		url: "./detail?repairno=" + repairno,
		type: "GET",
		cache: false,
		success: function(data, status) {
			if(status == "success") {
				loadDetail(data);
			}
		}
	});
});

$('.modal-footer button').click(() => {
	const repairno = $('#repair-detail').attr('data-no');
	
	$.ajax({
		url: "./status?repairno=" + repairno,
		type: "PUT",
		headers: { "X-CSRF-TOKEN": _csrf },
		cache: false,
		success: function(data, status) {
			if(status == "success") {
				if(data.status == "OK") {
					alert('수리 완료');
					$('.modal-footer').addClass('hidden');
					$('#tbody tr[data-no='+repairno+']').children('td:first-of-type').addClass("finish");
				} else {
					alert('다시 시도해주세요.');
				}
			} else {
				alert('다시 시도해주세요.');
			}
		}
	});
});

function loadDetail(jsonObj) {
	const data = jsonObj.data[0];
	
	$('#repair-detail').attr('data-no', data.repairno);
	$('.modal-title').text(data.rtitle);
	if(data.rimg != null) {
		$('.repairImg img').attr('src', getContextPath()+"/upload/apply/"+data.rimg);
	} else {
		$('.repairImg img').attr('src', getContextPath()+"/resources/images/unnamed.gif");
	}
	$('.applyUser').text(data.mid);
	$('.bikeno').text(data.bikeno);
	$('.rcategory').text(category[data.rcategory]);
	$('.rcontent').text(data.rcontent);
	
	if(data.rstatus == 1) {
		$('.modal-footer').addClass('hidden');
	} else {
		$('.modal-footer').removeClass('hidden');
	}
}

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}