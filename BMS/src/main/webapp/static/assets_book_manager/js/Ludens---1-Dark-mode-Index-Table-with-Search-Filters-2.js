$( document ).ready(function() {
	
	$("#year").text(new Date().getFullYear());
	$("#ipi-table").css("margin-bottom", "9px");
	
	$(".even").each(function() {
		$(this).attr("style", "background-color: #262a38!important; border: #262a38;color:white;");
		$(this).attr("class", "");
	})
	$(".odd").each(function() {
		$(this).attr("style", "background-color: #212430!important; border: #212430;color:white;");
		$(this).attr("class", "");
	})
});