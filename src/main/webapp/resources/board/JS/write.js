const _csrf = $('input:hidden[name=_csrf]').val();

$('#plus').click(() => {
	let str = '<div class="input-group upload-wrap">' +
	  '<input type="file" class="form-control" id="up-file" name="upload" accept=".gif, .jpg, .png, .jpeg">' +
	  '<button class="btn btn-outline-danger" id="" type="button" name="minus" onclick="minusFN()"><i class="fas fa-minus"></i></button></div>';

	$('.up-wrap').append(str);
});

$('#minus').click(() => {
	minusFN();
});

function minusFN(){
	$(event.target).parents('.upload-wrap').remove();
}

$('.submit').click(() => {
	const title = $('input:text[name=btitle]').val().trim();
	const content = $('input:text[name=btitle]').val().trim();
	
	if(title == "" || content == "") {
		alert('빈칸없이 작성해 주세요.');
		return;
	}
	
	$('form[name=writeForm]').submit();
});
