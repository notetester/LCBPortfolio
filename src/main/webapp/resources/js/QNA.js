$(function() {
    $('#textarea').keyup(function (e){
        var textarea = $(this).val();
        $(this).height(((textarea.split('\n').length + 1) * 1.5) + 'em');
        $('#textareaCnt').html(textarea.length + '/300');
    });
    $('#textarea').keyup();
});

var QNAregistBtn = document.getElementById("QNAregistBtn");

QNAregistBtn.onclick=function(){
	
	
	if($("#qna_place option:selected").val() === '극장선택'){
		alert("극장을 선택해주세여");
		return;

	}
	else if(document.QNARegistForm.qna_hpnum1.value ===''){
		alert("번호를 적어주세요");
		return;
	}else if(document.QNARegistForm.qna_hpnum2.value ===''){
		alert("번호를 적어주세요");
		return;
	}else if(document.QNARegistForm.qna_hpnum3.value ===''){
		alert("번호를 적어주세요");
		return;
	}else if(document.QNARegistForm.qna_email.value === ''){
			alert("이메일을 적어주세요");
	}else if(document.QNARegistForm.qna_title.value === ''){
			alert("제목을 적어주세요");		
	}else if(document.QNARegistForm.qna_content.value === ''){
			alert("내용을 적어주세요");
	}else{
		document.QNARegistForm.submit();
	
	}
	
}
