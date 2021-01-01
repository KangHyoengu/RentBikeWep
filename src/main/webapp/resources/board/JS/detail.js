let commentHeight = 0;
let imgLength = 0;

$('.comment-btn').click(() => {
	if(commentHeight == 0){
		commentHeight = $('.comments').height();
	}
	if($('.comments-input').attr('data-status') == 0){
		$('.comments-input').attr('data-status', 1);
		$('.comments').css('height', (commentHeight - 140) + 'px');
		$('.comments-input').css('height', '140px');
	} else {
		$('.comments-input').attr('data-status', 0);
		$('.comments-input').css('height', '0');
		
		setTimeout(function(){
			$('.comments').css('height', commentHeight + 'px');
		}, 500);
	}
});

$('.x-btn').click(() => {
	$('.comments-input').attr('data-status', 0);
	$('.comments-input').css('height', '0');
});

$('.comment-write').click(() => {
	const username = $('.userName').text();
	const ccontent = $('.t-area').val().trim();
	const bno = $('.contents').attr('data-bno');
	const _csrf = $('input:hidden[name=_csrf]').val();
	
	if(ccontent == ""){
		alert('댓글을 작성해 주세요.');
		return ;
	}
	
	let comments = "";
	$.ajax({
		url: "./board/comment?bno=" + bno + "&mid=" + username + "&ccontent=" + ccontent + "&_csrf=" + _csrf,
		type: "POST",
		cache: false,
		success: function(data, status) {
			if(status == "success"){
				if(data.status == "OK"){
					const mili = 1000;
					const time = data.data[0].regdate;
					
					comments += '<div class="comment"><div class="mid" data-cno="'+data.data[0].cno+'">';
					comments += data.data[0].mid + '</div>';
					if(time < 60 * mili){
						comments += '<div class="cregdate second">'+parseInt(time / mili)+'</div>';
					} else if(time < 3600 * mili){
						comments += '<div class="cregdate minute">'+parseInt(time / (60 * mili))+'</div>';
					} else if(time < 86400 * mili){
						comments += '<div class="cregdate hour">'+parseInt(time / (3600 * mili))+'</div>';
					} else if(time < 604800 * mili){
						comments += '<div class="cregdate day">'+parseInt(time / (86400 * mili))+'</div>';
					} else if(time < 2592000 * mili){
						comments += '<div class="cregdate week">'+parseInt(time / (604800 * mili))+'</div>';
					} else if(time < 31536000 * mili){
						comments += '<div class="cregdate month">'+parseInt(time / (2592000 * mili))+'</div>';
					} else {
						comments += '<div class="cregdate year">'+parseInt(time / (31536000 * mili))+'</div>';
					}
					comments += '<div class="ccomment">' + data.data[0].ccontent + '</div></div>';
					
					if(document.getElementsByClassName('comment-none').length == 1){
						$('.comment-none').remove();
					}
					$('.t-area').val("");
					$('.comments').html(comments + $('.comments').html());
				} else {
					alert('댓글을 다시 작성해 주세요.');
				}
			} else {
				alert('댓글을 다시 작성해 주세요.');
			}
		}
	});
});

function dot(){
	$('.dot').attr('class', 'fas fa-circle dot');
	$(event.target).addClass('gray');
	
	const num = parseInt($(event.target).attr('data-num'));
	const width = $('.image-wrap').width();
	console.log(width);
	$('.images').css('margin-left', -1 * width * num + 'px');
}

// 마우스 클릭 이벤트
let x = 0;
$(document).on('mousedown', '.glass', function() {
	x = event.screenX;
});

$(document).on('mouseup', '.glass', function() {
	const num = parseInt($('.gray').attr('data-num'));
	
	if(x > event.screenX) {
		if(num < imgLength-1){
			$('.dot').attr('class', 'fas fa-circle dot');
			$('.dot[data-num=' + (num + 1) + ']').addClass('gray');
			$('.images').css('margin-left', -1 * $('.image-wrap').width() * (num + 1) + 'px');
		}
	} else {
		if(num > 0){
			$('.dot').attr('class', 'fas fa-circle dot');
			$('.dot[data-num=' + (num - 1) + ']').addClass('gray');
			$('.images').css('margin-left', -1 * $('.image-wrap').width() * (num - 1) + 'px');
		}
	}
});

//모바일 터치 이벤트
$(document).on('touchstart', '.glass', function() {
	x = event.touches[0].clientX;
});

$(document).on('touchend', '.glass', function() {
	const num = parseInt($('.gray').attr('data-num'));
	
	if(x > event.changedTouches[0].clientX) {
		if(num < imgLength-1 && x - event.changedTouches[0].clientX > 50){
			$('.dot').attr('class', 'fas fa-circle dot');
			$('.dot[data-num=' + (num + 1) + ']').addClass('gray');
			$('.images').css('margin-left', -1 * $('.image-wrap').width() * (num + 1) + 'px');
		}
	} else {
		if(num > 0 && event.changedTouches[0].clientX - x > 50){
			$('.dot').attr('class', 'fas fa-circle dot');
			$('.dot[data-num=' + (num - 1) + ']').addClass('gray');
			$('.images').css('margin-left', -1 * $('.image-wrap').width() * (num - 1) + 'px');
		}
	}
});

function detail(){
	const bno = $(event.target).parents("tr").attr("data-no");
	
	$.ajax({
		url: "./board/detail?bno=" + bno,
		type: "GET",
		cache: false,
		success: function(data, status){
			if(status == "success"){
				loadDetail(data, function(){
					
				});
			}
		}
	});
}

function loadDetail(jsonObj, callback){
	const data = jsonObj.data[0];
	let comments = '';
	
	$('.contents .btitle').text(data.btitle);
	$('.contents .bview').text(data.bview);
	$('.contents .bcontent').text(data.bcontent);
	$('.contents').attr('data-bno', data.bno);
	
	$('.images').html('');
	$('.dots').html('');
	
	if(data.images != null){
		imgLength = data.images.length;
		$('.images').css('width', imgLength * 100 + '%');
		$('.glass').remove();
		
		for (var i = 0; i < imgLength; i++) {
			if($(document).width() < 600){
				$('.images').append('<div class="img-wrap" style="width: '+($(document).width() * 0.8945 - 1)+'px;"><img src="'+getContextPath()+'/upload/board/'+data.images[i].image+'" data-num="' + i + '" align="center"/></div>');
			} else {
				$('.images').append('<div class="img-wrap"><img src="'+getContextPath()+'/upload/board/'+data.images[i].image+'" data-num="' + i + '" align="center"/></div>');
			}
			
			if(i == 0){
				$('.dots').append('<i class="fas fa-circle dot gray" onclick="dot()" data-num="' + i + '"></i>');
			} else {
				$('.dots').append('<i class="fas fa-circle dot" onclick="dot()" data-num="' + i + '"></i>');
			}
			
			if(i == data.images.length - 1){
				$('.image-wrap').append('<div class="glass"></div>')
			}
		}
	} else {
		imgLength = 0;
		$('.images').css('width', '100%');
	}
	
	if(data.comments == null){
		comments += '<div class="comment"><div class="comment-none"></div></div>';
	} else {
		const mili = 1000;
		
		for (var i = 0; i < data.comments.length; i++) {
			const time = data.comments[i].regdate;
			
			comments += '<div class="comment"><div class="mid" data-cno="'+data.comments[i].cno+'">';
			comments += data.comments[i].mid + '</div>';
			if(time < 60 * mili){
				comments += '<div class="cregdate second">'+parseInt(time / mili)+'</div>';
			} else if(time < 3600 * mili){
				comments += '<div class="cregdate minute">'+parseInt(time / (60 * mili))+'</div>';
			} else if(time < 86400 * mili){
				comments += '<div class="cregdate hour">'+parseInt(time / (3600 * mili))+'</div>';
			} else if(time < 604800 * mili){
				comments += '<div class="cregdate day">'+parseInt(time / (86400 * mili))+'</div>';
			} else if(time < 2592000 * mili){
				comments += '<div class="cregdate week">'+parseInt(time / (604800 * mili))+'</div>';
			} else if(time < 31536000 * mili){
				comments += '<div class="cregdate month">'+parseInt(time / (2592000 * mili))+'</div>';
			} else {
				comments += '<div class="cregdate year">'+parseInt(time / (31536000 * mili))+'</div>';
			}
			comments += '<div class="ccomment">' + data.comments[i].ccontent + '</div></div>';
		}
	}
	
	$('.comments').html(comments);
	callback();
}

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}