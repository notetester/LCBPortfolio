$(function() {
    $('#textarea').keyup(function (e){
        var textarea = $(this).val();
        $(this).height(((textarea.split('\n').length + 1) * 1.5) + 'em');
        $('#textareaCnt').html(textarea.length + '/2000');
    });
    $('#textarea').keyup();
});

$("#regist").click(function(){
	if($("#title").val() == ''){
		alert("제목을 입력해주세요")
	}else if($("#textarea").val() == ''){
		alert("내용을 입력해주세요")
	}else{
		document.RegistForm.submit();
	}
})