function ajaxSend(url,data) {
	$.ajax({
		url : url,
		cache : false,
		data:data,
		success : function(result) {
			return result;
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert(textStatus);
		}
	});
}
function changeDivContent(divid,url){
	var result = ajaxSend(url);
	alert(result+"   "+typeof(result));
	$("#"+divid).html();
}

function loadViewAndData(view,data){
	var result;
	result.view = ajaxSend(view);
	result.data=ajaxSend(data);
	return result;
}