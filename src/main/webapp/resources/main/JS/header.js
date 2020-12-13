/**
 * 
 */
$('#hamberger').click(() => {
	let $this = $(event.target).parents('header');
	
	if(parseInt($this.attr("data-status")) == 0){
		$('header').css("height", "340px");
		$this.attr("data-status", 1);
	} else {
		$('header').css("height", "100px");
		$this.attr("data-status", 0);
	}
});