<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LCB 1:1 문의 상세보기</title>
<script src = "${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
	
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
    	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/QNADetail.css">
</head>
<body>
<%@ include file = "../include/header.jsp" %>

<br><br><Br>
<div class ="all">

<h4 class="tit">1:1 문의</h4>

<li>1:1 문의글 답변 운영시간 09:00 ~ 21:00</li>
<br>	
<div class="table-wrap mt10">
 <form action="QNAModify" method="post">
				
						<table class="board-form va-m" >
							<colgroup>
								<col style="width:150px;">
								<col>
								<col style="width:150px;">
								<col>
							</colgroup>
								<tbody>
									
									<tr>
										<th scope="row"><label for="place">글번호</label> <em class="font-orange">*</em></th>
										<td colspan="3">
											<input class="form-control" name="qna_number" value="${QNABoardVO.qna_number}" readonly>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="placename">지점명</label> <em class="font-orange">*</em></th>
										<td colspan="3">
											<input class="form-control" name="qna_place" value="${QNABoardVO.qna_place}" readonly >
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="ID">ID</label> <em class="font-orange">*</em></th>
										<td colspan="3"><input type="text" name="members_id" id="members_id" class="input-text w150px" maxlength="15" value="${QNABoardVO.members_id}" readonly></td>
									</tr>
									
									<tr>
										<th scope="row"><label for="title">제목</label> <em class="font-orange">*</em></th>
										<td colspan="3"><input type="text" name="qna_title" id="qna_title" class="input-text" maxlength="100" value="${QNABoardVO.qna_title}" readonly></td>
									</tr>
									<tr>
										<th scope="row"><label for="textarea">내용</label> <em class="font-orange">*</em></th>
										<td colspan="3">
											<div class="textarea">
											<textarea id="qna_content" style="resize: none" name="qna_content"
                           rows="10" cols="83" title="내용입력"
                           
                           class="input-textarea" readonly>${QNABoardVO.qna_content}</textarea>
											<div class="util">
												<p class="count">
													<span id="textareaCnt">0</span> / 2000
												</p>
											</div>
										</div>
										</td>
									</tr>									
									
								</tbody>
							</table>
							<div class="btn-group pt40">
							<button type="submit" class="button purple large" id="modifyBtn">변경</button>
							<button type="button" class="button purple large" onclick="location.href='QNAList'">목록</button>
					</div>
							</form>
						</div>
						
					</div>
					
					
					<section>
    	<div class="container">
    		<form class="reply-wrap col-md-12 col-xs-12" style="margin-top: 80px;" >
                    <div class="reply-image">
                        <img src="${pageContext.request.contextPath}/resources/img/profile.png">
                    </div>
                    <!--form-control은 부트스트랩의 클래스입니다-->
                    <div class="reply-content">                            
                        <textarea class="form-control" rows="3" id="reply"></textarea>
                        <!--여기에-->
                        <div class="reply-group ">
                            <div class="left reply-input">
                            <input type="text" class="form-control" placeholder="아이디" id="replyId">
                            <input type="password" class="form-control" placeholder="비밀번호" id="replyPw">
                            </div>
                            <button type="button" id="replyRegist" class="right btn purple">등록하기</button>
                        </div>                            
                    </div>
                </form>                
                  <!--여기에접근 반복-->
                  	<div class="posi">
                        <div id="replyList">
                        
                        <!-- <div class='reply-wrap'>
                            <div class='reply-image'>
                                <img src='../resources/img/profile.png'>
                            </div>      
                            <div class='reply-content'>
                                <div class='reply-group'>
                                    <strong class='left'>honggildong</strong> 
                                    <small class='left'>2019/12/10</small>
                                    <a href='#' class='right'><span class='glyphicon glyphicon-pencil'></span>수정</a>
                                    <a href='#' class='right'><span class='glyphicon glyphicon-remove'></span>삭제</a>
                                </div>
                                <p class='clearfix'>여기는 댓글영역</p>
                            </div>
                        </div>  -->                     
                        
                        </div>
                        </div>
           				<button class="form-control" id="moreList">더보기(페이징)</button>
                    </div>     
    	
    	</div>    
    </section>
    
    
    <br>
    <br>
    <br>
    
    <!-- 모달 -->
	<div class="modal fade" id="replyModal" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn btn-default pull-right" data-dismiss="modal">닫기</button>
					<h4 class="modal-title">댓글 수정</h4>
				</div>
				<div class="modal-body">
					<!-- 수정폼 id값을 확인하세요-->
					<div class="reply-content">
					<textarea class="form-control" rows="4" id="modalReply" placeholder="내용입력"></textarea>
					<div class="reply-group">
						<div class="reply-input">
						    <input type="hidden" id="modalRno">
							<input type="password" class="form-control" placeholder="비밀번호" id="modalPw">
						</div>
						<button class="right btn btn-info" id="modalModBtn">수정하기</button>
						<button class="right btn btn-info" id="modalDelBtn">삭제하기</button>
					</div>
					</div>
					<!-- 수정폼끝 -->
				</div>
			</div>
		</div>
	</div>
	
<br>
<br>
<br>
<%@ include file = "../include/footer.jsp" %>
<script>

$(function() {
    $('#qna_content').keyup(function (e){
        var textarea = $(this).val();
        $(this).height(((textarea.split('\n').length + 1) * 1.5) + 'em');
        $('#textareaCnt').html(textarea.length );
    });
    $('#qna_content').keyup();
});

//화면 로딩이 끝난 직후 실행되는 제이쿼리
var cnt=1;
$(document).ready(function(){
	
	$("#replyRegist").click(function(){        			
		add();        			
	});
	
	//등록 함수
	function add(){
		var qno = 1;
		var reply = $("#reply").val();
		var replyId = $("#replyId").val();
		var replyPw = $("#replyPw").val();
		
		if(reply === ''||replyId === ''||replyPw === ''){
			alert("댓글 내용, 이름, 비밀번호을 입력하세요");
			return;
		}
		
		$.ajax({
			type:"POST", //요청방식
			url:"${pageContext.request.contextPath}/qreply/QNAReply",
			//제이슨 형식으로 보낼수도 있고, 폼형식으로도 가능
			data: JSON.stringify({"qno":qno,"reply":reply,"replyId":replyId,"replyPw":replyPw}),//문자열형태로 변경해서 요청
			dataType:"text", //서버로 부터 어떤 형식으로 받을 건지
			contentType: "application/json; charset=utf-8", // 기본값은 폼형식을 지정하는데, JSON형식으로 보낼때는 반드시 타입을 명시해야함             			
			success:function(data){ //요청성공시 돌려받을 콜백함수
				if(data==1){
					$("#reply").val("");
					$("#replyId").val("");
					$("#replyPw").val("");  
					
					getList(1,true);            					
				}else{ //등록 실패
					alert("비밀번호를 확인하세요");
					$("#replyPw").val("");   
				}
			},
			error:function(status,error){ //에러 발생시 실행시킬 콜백함수
				alert("등록에 실패했습니다. 관리자에게 문의하세요");
				console.log(status, error);
			}
			
		});
	} //add 함수  end
	
	getList(cnt,true); //상세화면 진입시에 리스트 목록을 가져옴
	
	
})  //ready 함수 끝

	$("#moreList").click(function(){
		cnt++;	        		
		getList(cnt,false);
	});

/*
에이잭스의 실행이 다 늦게 완료가 되므로, 실제 이벤트의 선언이 먼저 실행됩니다.
그러면 화면에 댓글 관련 창은 아무것도 등록되지 않은 형태이므로, 일반 클릭 이벤트가 동작하지 않습니다.
이때 이미 존재하는 replyList에 이벤트를 자식에게 전파시켜 사용하는 제이쿼리의 이벤트 위임함수를 반드시 써야함
*/
var strAdd="";
function getList(pageNum, reset){
	var qno = 1;
	
	$.getJSON("${pageContext.request.contextPath}/qreply/getList/"+qno+"/"+pageNum,
			function(data){        				
			console.log(data);
			var total = data.total;
			var list = data.list;
			
			if(reset == true){ //insert, delete, update 다음에는 reset을 해줘야한다.
				strAdd="";
				cnt=1;
			}
			
			if(cnt*20 >= total){ //페이지 번호 * amount가 전체 게시글 보다 크면 더보기를 삭제
				$("#moreList").css("display","none");
			} 
			
			if(list.length <1){
				$("#replyList").html(strAdd);
				$(".reply-wrap").fadeIn(500);
				return;
			}
			for(var i=0; i<list.length; i++){
			console.log(list[i].replyDate);
				
				strAdd+="<div class='reply-wrap' style='display:none; clear: both;'>"+
                         "<div class='reply-image'>"+
                            "<img src='${pageContext.request.contextPath}/resources/img/profile.png'>"+
                        "</div>"+      
                       " <div class='reply-content' style='clear: both;'>"+
                            "<div class='reply-group'>"+
                                "<strong class='left'>"+list[i].replyId+"</strong>"+ 
                                "<small class='left'>"+timestamp(list[i].replyDate)+"</small>"+
                               "<a href='"+list[i].qrno+"' class='right replyModify'><span class='glyphicon glyphicon-pencil'></span>수정</a>"+
                                "<a href='"+list[i].qrno+"' class='right replyDelete'><span class='glyphicon glyphicon-remove'></span>삭제</a>"+
                            "</div>"+
                            "<p class='clearfix'>"+list[i].reply+"</p>"+
                        "</div>"+
                    "</div> " 
			}
			
			$("#replyList").html(strAdd);
			//reply 화면에 그릴때 reply-wrap을 display none으로 선언하고 제이쿼리 fadeIn함수로 서서히 보이게 처리
			$(".reply-wrap").fadeIn(500); 
		})
}

function timestamp(millis){
	var date = new Date();
	var gap = date.getTime() - millis; //현재날짜를 밀리초로 변환 - 등록일 밀리초 == 시간차           		
	
	var time;
	if(gap<1000*60*60*24){ //1일 미만인 경우
		if(gap<1000*60*60){
			time="방금전";            				
		}else{ //1시간 이상인 경우
			time= parseInt(gap/(1000*60*60))+"시간전";
		}
	}else{ //1일 이상인 경우
		var today = new Date(millis);
		
		var year = today.getFullYear();//년
		var month = today.getMonth()+1;//월
		var day = today.getDate();//일
		
		var hour = today.getHours();//시
		var minute = today.getMinutes();//분
		var second = today.getSeconds();//초
		time = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	}
	return time;
}

$("#replyList").on("click","a",function(){
	event.preventDefault();
	//console.log(event.target);
	console.log($(this)); //event.target 코드와 비슷합니다.
	console.log($(this).attr("href"));
	var rno = $(this).attr("href");
	$("#modalRno").val(rno);
	
	if($(this).hasClass("replyModify")){ //hasClass Class 매개값이 포함되있다면 true를 반환
		$(".modal-title").html("댓글 수정");
		$("#modalReply").css("display","inline");
		$("#modalModBtn").css("display","inline");
		$("#modalDelBtn").css("display","none");
		        			
		console.log(rno);
		$("#replyModal").modal("show");
	} else{
		$(".modal-title").html("댓글 삭제");
		$("#modalReply").css("display","none");
		$("#modalModBtn").css("display","none");
		$("#modalDelBtn").css("display","inline");        			
		
		console.log(rno);
		$("#replyModal").modal("show");
	}        		
})

$("#modalModBtn").click(function(){
	/*
	 modal창에 rno값 replyPw값을 얻습니다.
	 ajax함수를 이용해서 Post방식으로 reply/update 요청, 필요한 값은 json형식으로 처리해서 요청
	 서버에서는 요청을 받아서 비밀번호를 확인하고 비밀번호가 맞다면 업데이트를 진행
	 만약 비밀번호가 틀렷다면, 0을 반환해서 비밀번호가 틀렸습니다. 경고창을 띄우세요.
	*/
	
	var rno = $("#modalRno").val();
	var reply = $("#modalReply").val();
	var replyPw = $("#modalPw").val();
	
	$.ajax({
		type:"POST", //요청방식
		url:"${pageContext.request.contextPath}/qreply/replyUpdate",
		//제이슨 형식으로 보낼수도 있고, 폼형식으로도 가능
		data: JSON.stringify({"qrno":rno,"reply":reply,"replyPw":replyPw}),//문자열형태로 변경해서 요청
		dataType:"text", //서버로 부터 어떤 형식으로 받을 건지
		contentType: "application/json; charset=utf-8", // 기본값은 폼형식을 지정하는데, JSON형식으로 보낼때는 반드시 타입을 명시해야함             			
		success:function(data){ //요청성공시 돌려받을 콜백함수  
			if(data==1){
				
				$("#modalReply").val("");
				$("#modalPw").val("");      
				$("#replyModal").modal("hide");
				getList(1,true);
			}else{ //등록 실패
				alert("등록에 실패했습니다. 잠시후에 다시 시도하세요");
			}
		},
		error:function(status,error){ //에러 발생시 실행시킬 콜백함수
			alert("등록에 실패했습니다. 관리자에게 문의하세요");
			console.log(status, error);
		}
		
	});
});

$("#modalDelBtn").click(function(){
	var rno = $("#modalRno").val();        		
	var replyPw = $("#modalPw").val();
	
	$.ajax({
		type:"POST", //요청방식
		url:"${pageContext.request.contextPath}/qreply/replyDelete",
		//제이슨 형식으로 보낼수도 있고, 폼형식으로도 가능
		data: JSON.stringify({"qrno":rno,"replyPw":replyPw}),//문자열형태로 변경해서 요청
		dataType:"text", //서버로 부터 어떤 형식으로 받을 건지
		contentType: "application/json; charset=utf-8", // 기본값은 폼형식을 지정하는데, JSON형식으로 보낼때는 반드시 타입을 명시해야함             			
		success:function(data){ //요청성공시 돌려받을 콜백함수  
			if(data==1){
				
				$("#modalReply").val("");
				$("#modalPw").val("");      
				$("#replyModal").modal("hide");
				getList(1,true);
			}else{ //등록 실패
				alert("등록에 실패했습니다. 잠시후에 다시 시도하세요");
			}
		},
		error:function(status,error){ //에러 발생시 실행시킬 콜백함수
			alert("등록에 실패했습니다. 관리자에게 문의하세요");
			console.log(status, error);
		}
		
	});
});

</script>
</body>
</html>