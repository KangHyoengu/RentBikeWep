let nowPage = 1;
const totalPage = $('.pagination').attr('data-totalPage');

$(document).on('click', '.page-num', function(){
	nowPage = parseInt($(event.target).attr('data-page'));
	
	nowPageShow();
	pageClick();
	showPage();
});

$(document).on('click', '#previous', () => {
	const status = $('#previous').attr('data-status');
	
	if(status == 0){
		return;
	}
	
	if(nowPage % 10 == 1){
		let str = '<li class="page-item disabled" id="previous" data-status="0"><a class="page-link"><i class="fas fa-angle-left"></i></a></li>';
		
		for (var i = nowPage - 10; i <= nowPage - 1; i++) {
			if(i % 10 == 1) {
				str += '<li class="page-item"><a class="page-link page-num nowPage" data-page="' + i + '">' + i + '</a></li>';
			} else {
				str += '<li class="page-item"><a class="page-link page-num" data-page="' + i + '">' + i + '</a></li>';
			}
		}
		str += '<li class="page-item" id="next" data-status="1"><a class="page-link"><i class="fas fa-angle-right"></i></a></li>';
		
		$('.pagination').html(str);
	}
	
	nowPage--;
	nowPageShow();
	pageClick();
	showPage();
});

$(document).on('click', '#next', () => {
	const status = $('#next').attr('data-status');
	
	if(status == 0){
		return;
	}
	
	if(nowPage % 10 == 0){
		let str = '<li class="page-item disabled" id="previous" data-status="0"><a class="page-link"><i class="fas fa-angle-left"></i></a></li>';
		let end = 0;
		
		if(totalPage - nowPage > 10) {
			end = nowPage + 10;
		} else {
			end = totalPage;
		}
		
		for (var i = nowPage + 1; i <= end; i++) {
			if(i % 10 == 1) {
				str += '<li class="page-item"><a class="page-link page-num nowPage" data-page="' + i + '">' + i + '</a></li>';
			} else {
				str += '<li class="page-item"><a class="page-link page-num" data-page="' + i + '">' + i + '</a></li>';
			}
		}
		str += '<li class="page-item" id="next" data-status="1"><a class="page-link"><i class="fas fa-angle-right"></i></a></li>';
		
		$('.pagination').html(str);
	}
	
	nowPage++;
	nowPageShow();
	pageClick();
	showPage();
});

function showPage() {
	$.ajax({
		url: "./page?nowPage=" + nowPage,
		type: "GET",
		cache: false,
		success: function(data, status) {
			if(status == "success") {
				loadData(data);
			}
		}
	});
}

function loadData(jsonObj) {
	const data = jsonObj.data;
	let str = "";
	
	for (var i = 0; i < data.length; i++) {
		str += '<tr data-bs-toggle="modal" data-bs-target="#repair-detail" data-no="' + data[i].repairno + '">';
		str += '<th scope="row">' + data[i].repairno + '</th>';
		if(data[i].rstatus == 0){
			str += '<td>'+data[i].rtitle+'</td>';
		} else {
			str += '<td class="finish">'+data[i].rtitle+'</td>';
		}
		str += '<td>'+data[i].mid+'</td>';
		str += '<td>'+data[i].regdate+'</td></tr>';
	}
	
	$('#tbody').html(str);	
}

function pageClick(){
	if(nowPage == 1) {
		$('#previous').attr('class', 'page-item disabled');
		$('#next').attr('class', 'page-item');
		$('#previous').attr('data-status', 0);
		$('#next').attr('data-status', 1);
	} else if(nowPage == totalPage) {
		$('#previous').attr('class', 'page-item');
		$('#next').attr('class', 'page-item disabled');
		$('#previous').attr('data-status', 1);
		$('#next').attr('data-status', 0);
	} else {
		$('#previous').attr('class', 'page-item');
		$('#next').attr('class', 'page-item');
		$('#previous').attr('data-status', 1);
		$('#next').attr('data-status', 1);
	}
}

function nowPageShow() {
	$('.page-num').removeClass('nowPage');
	$('.page-num[data-page='+nowPage+']').addClass('nowPage');
}