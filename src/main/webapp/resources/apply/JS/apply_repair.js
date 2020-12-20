function submitChk(){
	let rtitle = $('input:text[name=rtitle]').val().trim();
	let bikeno = $('input:text[name=bikeno]').val().trim();
	let rcontent = $('textarea[name=rcontent]').val().trim();
	
	let regBikeno = /^#\d{8}$/;

	if(rtitle == "" || bikeno == "" || rcontent == "") {
		alert("공백 없이 입력해 주세요.");
		return false;
	}
	
	if(!regBikeno.test(bikeno)) {
		alert("자전거 일련번호를 정확히 입력해 주세요.");
		return false;
	}
	
	return true;
}