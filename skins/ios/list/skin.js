$(document).ready(function(){
	$(".link").remove();
	$(".quant").remove();
});

$(document).on("click", ".list tr.item", function(){
	$(this).addClass('selected').siblings().removeClass("selected");
});

$(document).on("touchstart", ".list tr.item", function(){
	window.location = $(this).attr("ref"); 
  	return false;
});

$(document).on("click touchstart", ".list tr.item.selected", function(){
  	window.location = $(this).attr("ref"); 

	$(this).addClass('selected').removeClass("selected");

  	return false;
});
