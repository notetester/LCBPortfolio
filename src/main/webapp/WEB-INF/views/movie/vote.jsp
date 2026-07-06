<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LCB 투표하기</title>


	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
     <!-- 부트 스트랩 디자인 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<!-- <script  src="https://code.jquery.com/jquery-3.5.1.js"  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="  crossorigin="anonymous"></script> -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/includebootstrap.css" rel="stylesheet">
    
   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/vote.css">
</head>
<body>
    <%@ include file = "../include/header.jsp" %>

<br><br><Br>

    <section class="prod">
        <div class="container">
            <h2>다시 보고싶은 영화 리스트</h2>            
            <div class="row ">
            	<c:forEach var="vo" items="${list}">
                <div class="col-xs-12 col-md-3 col-sm-6">                
                    <div class="niky-inner">
                        <a href="${vo.vote_num}">
                            <img class="poster${vo.vote_num}" src="${pageContext.request.contextPath}/resources/img/${vo.vote_img}" alt="vote">
                        </a>
                        
                        <div class="prod-content">
                            <div class="info">
                                <span>${vo.vote_name}</span><br>
                                <span>좋아요</span>                                
                            </div>
                            <div class="price">
                                <button type="button" id="Btn${vo.vote_num}">투표하기</button>
                                <br>
                                <span id="cnt${vo.vote_num}">${vo.vote_cnt}</span>  
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                
                
                
                <%-- <div class="col-xs-12 col-md-3 col-sm-6">
                    <div class="niky-inner">
                        <a href="">
                            <img src="${pageContext.request.contextPath}/resources/img/다크나이트.jpg" alt="vote">
                        </a>
                        <div class="prod-content">
                            <div class="info">
                                <span></span>
                                <span>좋아요</span>                                
                            </div>
                            <div class="price">
                                <button type="button" id="Btn2">투표하기</button>
                                <br>
                                <span></span>  
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-xs-12 col-md-3 col-sm-6">
                    <div class="niky-inner">
                        <a href="">
                            <img src="${pageContext.request.contextPath}/resources/img/도리.png" alt="vote">
                        </a>
                        <div class="prod-content">
                            <div class="info">
                                <span></span>
                                <span>좋아요</span>                                
                            </div>
                            <div class="price">
                                <button type="button" id="Btn3">투표하기</button>
                                <br>
                                <span></span>  
                            </div>
                        </div>                        
                    </div>
                </div>
                
                
                
                <div class="col-xs-12 col-md-3 col-sm-6">
                    <div class="niky-inner">
                        <a href="">
                            <img src="${pageContext.request.contextPath}/resources/img/죽은시인의 사회.jpg" alt="vote">
                        </a>
                        <div class="prod-content">
                            <div class="info">
                                <span></span>
                                <span>좋아요</span>                                
                            </div>
                            <div class="price">
                                <button type="button" id="Btn4">투표하기</button>
                                <br>
                                <span></span>  
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-xs-12 col-md-3 col-sm-6">
                    <div class="niky-inner">
                        <a href="">
                            <img src="${pageContext.request.contextPath}/resources/img/식스센스.jpg" alt="vote">
                        </a>
                        <div class="prod-content">
                            <div class="info">
                                <span></span>
                                <span>좋아요</span>                                
                            </div>
                            <div class="price">
                                <button type="button" id="Btn5">투표하기</button>
                                <br>
                                <span></span>  
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
                
                <div class="col-xs-12 col-md-3 col-sm-6">
                    <div class="niky-inner">
                        <a href="">
                            <img src="${pageContext.request.contextPath}/resources/img/타이타닉.jpg" alt="vote">
                        </a>
                        <div class="prod-content">
                            <div class="info">
                                <span></span>
                                <span>좋아요</span>                                
                            </div>
                            <div class="price">
                                <button type="button" id="Btn6">투표하기</button>
                                <br>
                                <span></span>  
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-xs-12 col-md-3 col-sm-6">
                    <div class="niky-inner">
                        <a href="">
                            <img src="${pageContext.request.contextPath}/resources/img/완득이.jpg" alt="vote">
                        </a>
                        <div class="prod-content">
                            <div class="info">
                                <span></span>
                                <span>좋아요</span>                                
                            </div>
                            <div class="price">
                                <button type="button" id="Btn7">투표하기</button>
                                <br>
                                <span></span>  
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
                <div class="col-xs-12 col-md-3 col-sm-6">
                    <div class="niky-inner">
                        <a href="">
                            <img src="${pageContext.request.contextPath}/resources/img/어벤져스.jpg" alt="vote">
                        </a>
                       <div class="prod-content">
                            <div class="info">
                                <span></span>
                                <span>좋아요</span>                                
                            </div>
                            <div class="price">
                                <button type="button" id="Btn8">투표하기</button>
                                <br>
                                <span></span>  
                            </div>
                        </div>        
                    </div>
                </div> --%>

                
            </div>
        </div>
    </section>

<br>
<br>
<br>
<%@ include file = "../include/footer.jsp" %>

<script>

$(".niky-inner").on("click","a", function(){
	event.preventDefault();
})



		
		
	


	var voter="${voter}";
	console.log(voter);
	
   $("#Btn1").click(function(){
            
      var cnt = $(this).next().next().html();
      var num = $(this).parents([".niky-inner"]).children("a").attr("href")
	  
      
      cnt++;
      
      if(voter!=1){
  		 $.getJSON("${pageContext.request.contextPath}/vote/getList/"+cnt+"/"+num,
  			function(data){        				
	  			if(data==2){
	  				$("#cnt1").html(cnt);
	  				location.reload();
				}else if(data==1){
  					$("#cnt1").html(cnt);  					
  					voter=1;
  					location.reload();
  				} else{
  					alert("투표를 끝내신 회원입니다.");
  					return;
  				} 			
  		}) 
      }else{
    	  alert("투표를 끝내신 회원입니다.");
    	  return;
      }
   })
   
	$("#Btn2").click(function(){
      
		 var cnt = $(this).next().next().html();
	      var num = $(this).parents([".niky-inner"]).children("a").attr("href")
		  
	      
	      cnt++;
	      
	      if(voter!=1){
	  		 $.getJSON("${pageContext.request.contextPath}/vote/getList/"+cnt+"/"+num,
	  			function(data){        				
		  			if(data==2){
		  				$("#cnt2").html(cnt);
		  				location.reload();
	  			 	}else if(data==1){
	  					$("#cnt2").html(cnt);
	  					console.log(1);
	  					voter=1;
	  					location.reload();
	  				} else{
	  					alert("투표를 끝내신 회원입니다.");
	  					console.log(0);
	  					return;
	  				} 			
	  		})  
	      }else{
	    	  alert("투표를 끝내신 회원입니다.");
	    	  return;
	      }
   })
   
	$("#Btn3").click(function(){
      
		 var cnt = $(this).next().next().html();
	      var num = $(this).parents([".niky-inner"]).children("a").attr("href")
		  
	      
	      cnt++;
	      
	      if(voter!=1){
	  		 $.getJSON("${pageContext.request.contextPath}/vote/getList/"+cnt+"/"+num,
	  			function(data){        				
		  			if(data==2){
		  				$("#cnt3").html(cnt);
		  				location.reload();
	  			 	}else if(data==1){
	  					$("#cnt3").html(cnt);
	  					voter=1;
	  					location.reload();
	  				} else{
	  					alert("투표를 끝내신 회원입니다.");
	  					return;
	  				} 			
	  		}) 
	      }else{
	    	  alert("투표를 끝내신 회원입니다.");
	    	  return;
	      }
   })
   
	$("#Btn4").click(function(){
      
		 var cnt = $(this).next().next().html();
	      var num = $(this).parents([".niky-inner"]).children("a").attr("href")
		  
	      
	      cnt++;
	      
	      if(voter!=1){
	  		 $.getJSON("${pageContext.request.contextPath}/vote/getList/"+cnt+"/"+num,
	  			function(data){        				
		  			if(data==2){
		  				$("#cnt4").html(cnt);
		  				location.reload();
	  			 	}else if(data==1){
	  					$("#cnt4").html(cnt);
	  					voter=1;
	  					location.reload();
	  				} else{
	  					alert("투표를 끝내신 회원입니다.");
	  					return;
	  				} 			
	  		})  
	      }else{
	    	  alert("투표를 끝내신 회원입니다.");
	    	  return;
	      }
   })
   
	$("#Btn5").click(function(){
      
		 var cnt = $(this).next().next().html();
	      var num = $(this).parents([".niky-inner"]).children("a").attr("href")
		  
	      
	      cnt++;
	      
	      if(voter!=1){
	  		 $.getJSON("${pageContext.request.contextPath}/vote/getList/"+cnt+"/"+num,
	  			function(data){        				
		  			if(data==2){
		  				$("#cnt5").html(cnt);
		  				location.reload();
	  			 	}else if(data==1){
	  					$("#cnt5").html(cnt);
	  					voter=1;
	  					location.reload();
	  				} else{
	  					alert("투표를 끝내신 회원입니다.");
	  					return;
	  				} 			
	  		})  
	      }else{
	    	  alert("투표를 끝내신 회원입니다.");
	    	  return;
	      }
   })
   
	$("#Btn6").click(function(){
      
		 var cnt = $(this).next().next().html();
	      var num = $(this).parents([".niky-inner"]).children("a").attr("href")
		  
	      
	      cnt++;
	      
	      if(voter!=1){
	  		 $.getJSON("${pageContext.request.contextPath}/vote/getList/"+cnt+"/"+num,
	  			function(data){        				
	  				
		  			if(data==2){
		  				$("#cnt6").html(cnt);
		  				location.reload();
	  			 		
	  			 	}else if(data==1){
	  					$("#cnt6").html(cnt);
	  					voter=1;
	  					location.reload();
	  				} else{
	  					alert("투표를 끝내신 회원입니다.");
	  					return;
	  				} 			
	  		})  
	      }else{
	    	  alert("투표를 끝내신 회원입니다.");
	    	  return;
	      }
   })
   
	$("#Btn7").click(function(){
      
		 var cnt = $(this).next().next().html();
	      var num = $(this).parents([".niky-inner"]).children("a").attr("href")
		  
	      
	      cnt++;
	      
	      if(voter!=1){
	  		 $.getJSON("${pageContext.request.contextPath}/vote/getList/"+cnt+"/"+num,
	  			function(data){        				
		  			if(data==2){
		  				$("#cnt7").html(cnt);
		  				location.reload();
	  			 		
	  			 	}else if(data==1){
	  					$("#cnt7").html(cnt);
	  					voter=1;
	  					location.reload();
	  				} else{
	  					alert("투표를 끝내신 회원입니다.");
	  					return;
	  				} 			
	  		})  
	      }else{
	    	  alert("투표를 끝내신 회원입니다.");
	    	  return;
	      }
   })
   
	$("#Btn8").click(function(){
      
		 var cnt = $(this).next().next().html();
	      var num = $(this).parents([".niky-inner"]).children("a").attr("href")
		  
	      
	      cnt++;
	      
	      if(voter!=1){
	  		 $.getJSON("${pageContext.request.contextPath}/vote/getList/"+cnt+"/"+num,
	  			function(data){
	  			 
	  			 	if(data==2){
	  			 		$("#cnt8").html(cnt);
	  			 		location.reload();
	  			 		
	  			 	}else if(data==1){
	  					$("#cnt8").html(cnt);
	  					voter=1;
	  					location.reload();
	  				} else{
	  					alert("투표를 끝내신 회원입니다.");
	  					return;
	  				} 			
	  		}) 
	      }else{
	    	  alert("투표를 끝내신 회원입니다.");
	    	  return;
	      }
		
   })
</script>

</body>
</html>