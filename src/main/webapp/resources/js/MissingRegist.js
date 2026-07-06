$(function() {
    $('#textarea').keyup(function (e){
        var textarea = $(this).val();
        $(this).height(((textarea.split('\n').length + 1) * 1.5) + 'em');
        $('#textareaCnt').html(textarea.length);
    });
    $('#textarea').keyup();
});

var MissingregistBtn = document.getElementById("MissingregistBtn");

MissingregistBtn.onclick=function(){
	
	
	if($("#theater02 option:selected").val() === '극장선택'){
		alert("극장을 선택해주세여");
		return;

	}
	else if(document.MissingRegistForm.found_hpnum1.value ===''){
		alert("번호를 적어주세요");
		return;
	}else if(document.MissingRegistForm.found_hpnum2.value ===''){
		alert("번호를 적어주세요");
		return;
	}else if(document.MissingRegistForm.found_hpnum3.value ===''){
		alert("번호를 적어주세요");
		return;
	}else if(document.MissingRegistForm.found_email.value === ''){
			alert("이메일을 적어주세요");
	}else if(document.MissingRegistForm.found_title.value === ''){
			alert("제목을 적어주세요");		
	}else if(document.MissingRegistForm.found_content.value === ''){
			alert("내용을 적어주세요");
	}else{
		document.MissingRegistForm.submit();
	
	}
	
}

//자바 스크립트 파일 미리보기 기능
function readURL(input) {

	if (input.files && input.files[0]) {
		
    	var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
    	//readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
    	reader.readAsDataURL(input.files[0]); 
    	//파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
        $(".fileDiv1").css("display", "block");
    	
    	reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
        	$('#fileImg1').attr("src", event.target.result); 
        	console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
    	}
	}if (input.files && input.files[1]) {
		
    	var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
    	//readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
    	reader.readAsDataURL(input.files[1]); 
    	//파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
        $(".fileDiv2").css("display", "block");
    	
    	reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
        	$('#fileImg2').attr("src", event.target.result); 
        	console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
    	}
	}if (input.files && input.files[2]) {
		
    	var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
    	//readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
    	reader.readAsDataURL(input.files[2]); 
    	//파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
        $(".fileDiv3").css("display", "block");
    	
    	reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
        	$('#fileImg3').attr("src", event.target.result); 
        	console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
    	}
	}if (input.files && input.files[3]) {
		
    	var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
    	//readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
    	reader.readAsDataURL(input.files[3]); 
    	//파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
        $(".fileDiv4").css("display", "block");
    	
    	reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
        	$('#fileImg4').attr("src", event.target.result); 
        	console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
    	}
	}
}




$("#file").change(function() {
    readURL(this); //this는 #file자신 태그를 의미
    
});
