const _csrf = $('input:hidden[name=_csrf]').val();

$('#plus').click(() => {
	let str = '<div class="input-group upload-wrap">' +
	  '<input type="file" class="form-control" id="up-file" name="upload" accept=".gif, .jpg, .png, .jpeg">' +
	  '<button class="btn btn-outline-danger" id="" type="button" name="minus" onclick="minus()"><i class="fas fa-minus"></i></button></div>';

	$('.up-wrap').append(str);
});

$('#minus').click(() => {
	minus();
});

function minus(){
	$(event.target).parents('.upload-wrap').remove();
}

$('.submit').click(() => {
	
});
