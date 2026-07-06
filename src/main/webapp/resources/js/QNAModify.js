var updateBtn = document.getElementById("updateBtn");
updateBtn.onclick = function(){
	document.modifyForm.action="ModifyForm";
	 document.modifyForm.submit();
}


var deleteBtn = document.getElementById("deleteBtn");
deleteBtn.onclick=function(){
	//var bno = document.getElementsByName("bno")[0].value;        	
	document.modifyForm.action="QNADelete"; 
	document.modifyForm.submit();
}        
$(function() {
    $('#qna_content').keyup(function (e){
        var textarea = $(this).val();
        $(this).height(((textarea.split('\n').length + 1) * 1.5) + 'em');
        $('#textareaCnt').html(textarea.length );
    });
    $('#qna_content').keyup();
});
