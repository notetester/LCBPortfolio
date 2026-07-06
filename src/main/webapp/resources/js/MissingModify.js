var updateBtn = document.getElementById("updateBtn");
updateBtn.onclick = function(){
	document.missingmodifyForm.action="MissingModifyForm";
	 document.missingmodifyForm.submit();
}


var deleteBtn = document.getElementById("deleteBtn");
deleteBtn.onclick=function(){
	//var bno = document.getElementsByName("bno")[0].value;        	
	document.missingmodifyForm.action="MissingDelete"; 
	document.missingmodifyForm.submit();
}        
$(function() {
    $('#found_content').keyup(function (e){
        var textarea = $(this).val();
        $(this).height(((textarea.split('\n').length + 1) * 1.5) + 'em');
        $('#textareaCnt').html(textarea.length);
    });
    $('#found_content').keyup();
});