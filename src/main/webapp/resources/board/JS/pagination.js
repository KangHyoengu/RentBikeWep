let nowPage = 1;
let totalPage = $('.page-wrap').attr("data-total");

chkPageIcon();

function chkPageIcon(){
	if(nowPage == 1){
		$("#previous").parent().addClass("disabled");
		$("#next").parent().removeClass("disabled");
		$("#previous").parent().attr("data-status", "0");
		$("#next").parent().attr("data-status", "1");
	} else if(nowPage == totalPage) {
		$("#previous").parent().removeClass("disabled");
		$("#next").parent().addClass("disabled");
		$("#next").parent().attr("data-status", "0");
		$("#previous").parent().attr("data-status", "1");
	} else {
		$("#next").parent().removeClass("disabled");
		$("#previous").parent().removeClass("disabled");
		$("#previous").parent().attr("data-status", "1");
		$("#next").parent().attr("data-status", "1");
	}
}



function previous() {
	const status = $("#previous").parent().attr("data-status");
	
	if(nowPage / 10 >= 1 && nowPage % 10 == 1){
		let end = nowPage - 1;
		let str = '<nav aria-label="Page navigation example">' + 
				  '<ul class="pagination justify-content-center">' + 
				  '<li class="page-item" data-status="0"><a class="page-link" id="previous" onclick="previous()"><i class="fas fa-angle-left"></i></a></li>';
		
		for (var i = (nowPage - 10); i <= end; i++) {
			if(i == end){
				str += '<li class="page-item page-bar nowPage" data-page="' + i + '"><a class="page-link" onclick="page()">' + i + '</a></li>'
			} else {
				str += '<li class="page-item page-bar" data-page="' + i + '"><a class="page-link" onclick="page()">' + i + '</a></li>'
			}
		}
		str += '<li class="page-item" data-status="1"><a class="page-link" id="next" onclick="next()"><i class="fas fa-angle-right"></i></a></li></ul></nav>';
		
		$('.page-wrap').html(str);
	}
	
	if(status == 1){
		nowPage--;
		chkPageIcon();
		
		$($('.page-bar')[nowPage % 10]).removeClass("nowPage");
		$($('.page-bar')[(nowPage - 1) % 10]).addClass("nowPage");
		
		loadData();
	}
}

function next() {
	const status = $("#next").parent().attr("data-status");
	
	if(nowPage < totalPage && nowPage % 10 == 0){
		let end = 0;
		let str = '<nav aria-label="Page navigation example">' + 
				  '<ul class="pagination justify-content-center">' + 
				  '<li class="page-item" data-status="0"><a class="page-link" id="previous" onclick="previous()"><i class="fas fa-angle-left"></i></a></li>';
		
		if((totalPage - nowPage) > 10){
			end = nowPage + 10;
		} else {
			end = totalPage;
		}
		
		for (var i = (nowPage + 1); i <= end; i++) {
			if(i == (nowPage + 1)){
				str += '<li class="page-item page-bar nowPage" data-page="' + i + '"><a class="page-link" onclick="page()">' + i + '</a></li>'
			} else {
				str += '<li class="page-item page-bar" data-page="' + i + '"><a class="page-link" onclick="page()">' + i + '</a></li>'
			}
		}
		str += '<li class="page-item" data-status="1"><a class="page-link" id="next" onclick="next()"><i class="fas fa-angle-right"></i></a></li></ul></nav>';
		
		$('.page-wrap').html(str);
	}
	
	if(status == 1){
		nowPage++;
		chkPageIcon();
		
		$($('.page-bar')[(nowPage - 2) % 10]).removeClass("nowPage");
		$($('.page-bar')[(nowPage - 1) % 10]).addClass("nowPage");
		
		loadData();
	}
}

function page() {
	const page = parseInt($(event.target).parent().attr("data-page"));
	
	nowPage = page;
	chkPageIcon();
	
	$('.page-bar').attr("class", "page-item page-bar");
	$(event.target).parent().addClass("nowPage");
	
	loadData()
}

function loadData(){
	$.ajax({
		url: "./board/page?page=" + nowPage,
		type: "GET",
		cache: false,
		success: function(data, status){
			if(status == "success"){
				if(data.status == "OK"){
					buildBoard(data);
				}
			}
		}
	});
}

function buildBoard(jsonObj){
	const data = jsonObj.data;
	let str = '<tr data-bs-toggle="modal" data-bs-target="#detail" onclick="detail()">';
	
	for (var i = 0; i < data.length; i++) {
		str += '<th scope="row">'+data[i].bno+'</th>';
		str += '<td>'+data[i].btitle+'</td>';
		str += '<td>'+data[i].mid+'</td>';
		str += '<td>'+data[i].regdate+'</td></tr>';
	}
	
	$('#tbody').html(str);
}





