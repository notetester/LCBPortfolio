<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LCB 영화 상세보기</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
   
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
   
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/movieDetail.css">

</head>
<body>

    
<%@ include file = "../include/header.jsp" %>
    <br>
    <br>
    <br>
    <section class="prod">
        <div class="container">
            <h2 id= "tit"></h2>
            <hr>
            <div class="row">
                <div class="col-xs-12 col-md-6">
                    <img style = "width:350px; height:510px;"
                     id="MOVIE_IMAGE">
                </div>
                <div class="col-xs-12 col-md-6">
                    <div class="info">
                        <p class="title" id ="person"></p>
                        
                        <p class="price" id ="reserve_Rate"> </p>
                           <h4 id = "stack_count"></h4>
                        
                        <p class="price"> <strong>★ 영화정보 ★</strong></p>  <br> 
                         <p id="MOVIE_CONTENT1"><strong></strong></p>
                            <hr>
                            <p class="delivery" id ="MOVIE_CONTENT2">     </p>
                            
                           
                      
                    </div>
                    <div class="control">
                        <div class="price">
                            <p class="right">관람 선호도</p>
                            <p class="left" id ="MOVIE_preference"><strong>
                           </strong>
                           </p>
                        </div>
                        <div class="order">
                            <button onclick="clickCounter()" type="button" class="left btn btn-default" >좋아요♡<br><em id="result"></em></button>
                            <button type="button" id="reserveBtn" class="right btn purple">예매하기</button>
                        </div>
                    </div>
                </div>
            </div>   
            <div class="share" style="text-align: right;">
               <h4><b>공유하기 >>></b></h4><br> 
               
               <a id="kakao-link-btn"   href="javascript:kakaoLink()">
               <img src="${pageContext.request.contextPath}/resources/img/kakao.png"   alt="카카오톡 공유" width="30px" height="30px"></a>
                
               <a   id="kakao-story-btn" href="javascript:kakaostoryLink()">
               <img src="${pageContext.request.contextPath}/resources/img/kakaostory.png" alt="카카오스토리 공유" width="30px" height="30px"></a> 
               
               <a id="facebook-btn" href="javascript:facebookLink()">
               <img src="${pageContext.request.contextPath}/resources/img/facebook.jpg" alt="페이스북 공유" width="30px" height="30px"></a>
               
               <a id="twitter-btn" href="javascript:twitterLink()">
               <img src="${pageContext.request.contextPath}/resources/img/twitter.jpg" alt="트위터 공유" width="30px" height="30px"></a>
               
               <a class="img_url" id="URL-btn" href="javascript:URLLink()">
               <img src="${pageContext.request.contextPath}/resources/img/URL.png" alt="URL 공유" width="30px" height="30px"></a>
               
               
            </div>       
        </div>
    </section>
    
    
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
                             <input type="text" class="form-control" placeholder="평점(0~10)" id="score">
                            <input type="text" class="form-control" placeholder="이름" id="replyId">
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

    <%@ include file = "../include/footer.jsp" %>
    
    <script>
           //화면 로딩이 끝난 직후 실행되는 제이쿼리
           var like;
           var cnt=1;
           
           $(document).ready(function(){ 
        	   
        	   $("#replyRegist").click(function(){      
        		   if(0<=parseInt($("#score").val()) && parseInt($("#score").val())<=10){
         			add();
        		   }else{
        			   alert("평점은 0~10점 사이입니다.");
        		   }
              })        	   
        	
        	   console.log("mno")
              $.getJSON("${pageContext.request.contextPath}/movie/getList/${mno}",
                    function(data){   
                 console.log(data)
                 $("#tit").html(data.movie_TITLE)
                 $("#person").html("★관람객 평점:"+data.movie_person)
                 $("#reserve_Rate").html("예매율 1위: "+data.reserve_Rate+"%")
                 $("#stack_count").html("누적관객수: "+data.stack_count+"명")
                 $("#MOVIE_CONTENT1").html(data.movie_CONTENT1)
                 $("#MOVIE_CONTENT2").html(data.movie_CONTENT2)
                 $("#MOVIE_preference").html(data.movie_preference)
                 $("#MOVIE_IMAGE").attr("src","${pageContext.request.contextPath}/resources/img/"+data.movie_IMAGE)
                 like = data.movie_HIT;
                 
              })           
        
       		
       		//등록 함수
           	function add(){
       			var mno = "${mno}";
           		var reply = $("#reply").val();
           		var replyId = $("#replyId").val();
           		var replyPw = $("#replyPw").val();
           		var score = $("#score").val();           		
           		
           		if(reply === ''||replyId === ''||replyPw === ''){
           			alert("댓글 내용, 이름, 비밀번호을 입력하세요");
           			return;
           		}
           		console.log(mno);
           		$.ajax({
           			type:"POST", //요청방식
           			url:"${pageContext.request.contextPath}/mreply/movieReply",
           			//제이슨 형식으로 보낼수도 있고, 폼형식으로도 가능
           			data: JSON.stringify({"mno":mno,"reply":reply,"replyId":replyId,"replyPw":replyPw,"score":score}),//문자열형태로 변경해서 요청
           			dataType:"text", //서버로 부터 어떤 형식으로 받을 건지
           			contentType: "application/json; charset=utf-8", // 기본값은 폼형식을 지정하는데, JSON형식으로 보낼때는 반드시 타입을 명시해야함             			
           			success:function(data){ //요청성공시 돌려받을 콜백함수
           				if(data==1){
           					$("#reply").val("");
           					$("#replyId").val("");           					
           					$("#replyPw").val("");  
           					$("#score").val("");
           					
           					getList(1,true);            					
           				}else if(data==0){ //등록 실패
           					alert("비밀번호를 확인하세요");
           					$("#replyPw").val("");   
           				}else{
           					
           					$("#person").html("★관람객 평점:"+data);
           					
           					$("#reply").val("");
           					$("#replyId").val("");           					
           					$("#replyPw").val("");  
           					$("#score").val("");
           					
           					getList(1,true);  
           				}
           			},
           			error:function(status,error){ //에러 발생시 실행시킬 콜백함수
           				alert("등록에 실패했습니다. 관리자에게 문의하세요");
           				console.log(status, error);
           			}
           			
           		});
           	} //add 함수  end
           	
           	getList(cnt,true); //상세화면 진입시에 리스트 목록을 가져옴
       		
           	
       	});  //ready 함수 끝
       	
       	$("#moreList").click(function(){
       		cnt++;	        		
       		getList(cnt,false);
       	});
     	
    	   $("#reserveBtn").click(function(){
    			location.href='${pageContext.request.contextPath}/reserve/ticketSchedule?num=${mno}';   
    	   })
       	
       	/*
       	에이잭스의 실행이 다 늦게 완료가 되므로, 실제 이벤트의 선언이 먼저 실행됩니다.
       	그러면 화면에 댓글 관련 창은 아무것도 등록되지 않은 형태이므로, 일반 클릭 이벤트가 동작하지 않습니다.
       	이때 이미 존재하는 replyList에 이벤트를 자식에게 전파시켜 사용하는 제이쿼리의 이벤트 위임함수를 반드시 써야함
       	*/
       	var strAdd="";
       	function getList(pageNum, reset){
       		var mno = "${mno}";
       		
       		$.getJSON("${pageContext.request.contextPath}/mreply/getList/"+mno+"/"+pageNum,
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
			                               "<a href='"+list[i].rno+"' class='right replyModify'><span class='glyphicon glyphicon-pencil'></span>수정</a>"+
			                                "<a href='"+list[i].rno+"' class='right replyDelete'><span class='glyphicon glyphicon-remove'></span>삭제</a>"+
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
       			url:"${pageContext.request.contextPath}/mreply/replyUpdate",
       			//제이슨 형식으로 보낼수도 있고, 폼형식으로도 가능
       			data: JSON.stringify({"rno":rno,"reply":reply,"replyPw":replyPw}),//문자열형태로 변경해서 요청
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
       			url:"${pageContext.request.contextPath}/mreply/replyDelete",
       			//제이슨 형식으로 보낼수도 있고, 폼형식으로도 가능
       			data: JSON.stringify({"rno":rno,"replyPw":replyPw}),//문자열형태로 변경해서 요청
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
               
              
              
           
              var lcbKakaoJavaScriptKey = "";
              if (window.Kakao && lcbKakaoJavaScriptKey) {
                  Kakao.init(lcbKakaoJavaScriptKey);
              }
               function kakaoLink() {
                   if (!window.Kakao || !lcbKakaoJavaScriptKey) {
                       alert("카카오 JavaScript 키가 설정되지 않았습니다.");
                       return;
                   }
                   Kakao.Link.sendDefault({
                       objectType: 'feed',
                       content: {
                           title: "${vo.title}",
                           description: "${vo.content}",
                           imageUrl: document.images[0].src,
                           link: {
                               mobileWebUrl: document.location.href,
                               webUrl: document.location.href,
                           },
                       },
                       buttons: [{
                           title: '웹으로 보기',
                           link: {
                               mobileWebUrl: document.location.href,
                               webUrl: document.location.href,
                           }
                       }]
                   });
               }
               function kakaostoryLink(){
                   if (!window.Kakao || !lcbKakaoJavaScriptKey) {
                       alert("카카오 JavaScript 키가 설정되지 않았습니다.");
                       return;
                   }
                   Kakao.Story.share({
                       url: document.location.href,
                       text: "${vo.content}",
                   });
               }
               function facebookLink(){
                   var sharer = "https://www.facebook.com/sharer/sharer.php?u=";
                var content_url = encodeURIComponent(document.location.href);
                   window.open(sharer + content_url, 'facebook_share_dialog', 'width=626,height=436');
               }
               function twitterLink(){
                   window.open("https://twitter.com/intent/tweet?text="+"${vo.content}"+"&url="+document.location.href);
               }
               function URLLink(){
                   alert_content = "해당 글의 주소입니다.\nCtrl+C를 눌러 클립보드로 복사하세요.";
                temp = prompt(alert_content, document.location.href);
               }
               
               
              
              //like count click
             function clickCounter() {            	 
            	  if("${sessionScope.MEMBERS_ID}" == ''|| "${sessionScope.MEMBERS_ID}" == null){
                   alert("로그인시 이용가능합니다.")
                   location.href='${pageContext.request.contextPath}/user/user_login';
                   return;
                }
                
                 like++;                 
                 
              $.ajax({
                 type:"POST",
                 url:"${pageContext.request.contextPath}/movie/movieLike",
                 data:JSON.stringify({"movie_CODE":"${mno}","movie_HIT":like}),
                 dataType:"text",
                 contentType:"application/json; charset=utf-8",
                 success:function(data){ //요청성공시 돌려받을 콜백함수  
                    if(data==1){
                        console.log("성공")  
                        document.getElementById("result").innerHTML = like + "개"
                        return;
                    }else if(data==0){  //등록 실패
                       alert("등록에 실패했습니다. 잠시후에 다시 시도하세요");
                    	
                    	return;
                    }else{
                    	alert("이미 누르셨습니다.")
                    	
                    	return;
                    }
                 },
                 error:function(status,error){ //에러 발생시 실행시킬 콜백함수
                    alert("등록에 실패했습니다. 관리자에게 문의하세요");
                    console.log(status, error);
                 }
              })
              

            
          }
           
        </script>
               
</body>
</html>
