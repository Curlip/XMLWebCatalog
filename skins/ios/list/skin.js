$(document).ready(function(){
	$(".link").remove();
	$(".quant").remove();
});

$(document).on("click", ".itemrow", function(){
	$(this).addClass('selected').siblings().removeClass("selected");
});

$(document).on("touchstart", ".itemrow", function(){
	window.location = $(this).attr("ref"); 
  	return false;
});

$(document).on("click touchstart", ".itemrow.selected", function(){
  	window.location = "d/" + $(this).attr("ref") + ".xml"; 

	$(this).removeClass("selected");

  	return false;
});
