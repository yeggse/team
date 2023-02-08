var isVisible = false;

$(window).on('scroll', function(){
	if(checkVisible($('foods'))&&!isVisible){
		alert("dddddd");
		isVisible=true;
	}
});

function checkVisible(elm, eval){
	eval = eval || "object visible";
	var viewportHeight = $(window).height(),
	scrolltop = $(window).scrollTop(),
	y = $(elm).offset().top,
	elementHeight = $(elm).height();
	
	if(eval == "object visible")
		return ((y < (viewportHeight + scrolltop)) && (y > (scrolltop - elementHeight)));
	if(eval == "above")
		return((y>(viewportHeight + scrolltop)));
}