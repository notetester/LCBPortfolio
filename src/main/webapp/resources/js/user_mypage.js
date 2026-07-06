 $("#page1").on("click","a",function(){
	   
	   event.preventDefault();
	   
	   getQnaList($(this).attr("data-pagenum"),true);
	   
   })
   
    function qnapage(pageNum){
	   
	   getQnaList(pageNum,true);
   }
   
    var qnaStrAdd;
   
   function getQnaList(pageNum,reset){
    
    
    $.getJSON("getQnaList/"+pageNum,
          function(data){                    
          console.log(data);
          var total = data.total;
          var list = data.list;
          var page = data.pageVO;
          
          
         
          if(reset == true){ 
        	  qnaStrAdd="";              
          }
          
          if(list.length <1){
          	$(".q").html(qnaStrAdd);
			$(".q li").fadeIn(500);
            return;
          }
          
          for(var i=0; i<list.length; i++){
        	  qnaStrAdd+="<li style='display:none;'>"+"<dl>"+"<dt><em>"+timestamp2(list[i].qna_regdate)+"</em></dt>"+
          "<dd><a href='../board/QNADetail?bno="+list[i].qna_number+"&MEMBERS_ID="+list[i].members_id+"'>"+list[i].qna_title+"</a></dd></dl></li>";
          
          }
          
          qnaStrAdd+="<li class='text-center' style='border:0px; display:none;'><br><br> <ul class='pagination pagination-sm' id='page1' style='position: absolute; bottom: -10px;'>"+
                 "<li id='prev1' style='border: 0px; padding: 0px;'><a href='javascript:void(0);' onclick='qnapage("+(page.startPage-1)+")' data-pagenum='"+(page.startPage-1)+"'>이전</a></li>";
          
 		  for(var i=page.startPage; i<=page.endPage;i++){
 			 qnaStrAdd+="<li class='"+(i==page.pageNum? 'active':'')+"' style='border: 0px; padding: 0px;' ><a href='javascript:void(0);' onclick='qnapage("+i+")' data-pagenum='"+i+"'>"+i+"</a></li>";
          }
          
 		 qnaStrAdd+="<li id='next1' style='border: 0px; padding: 0px;'><a href='javascript:void(0);' onclick='qnapage("+(page.endPage+1)+")' data-pagenum='"+(page.endPage+1)+"'>다음</a></li></ul></li>";
          
          
          $(".q").html(qnaStrAdd);
          //reply 화면에 그릴때 reply-wrap을 display none으로 선언하고 제이쿼리 fadeIn함수로 서서히 보이게 처리
          $(".q li").fadeIn(500); 
          
          if(page.next){ //페이지 번호 * amount가 전체 게시글 보다 크면 더보기를 삭제
             	$("#next1").css("display","inline");
            }else{
          	$("#next1").css("display","none");
            }
            
          if(page.prev){ //페이지 번호 * amount가 전체 게시글 보다 크면 더보기를 삭제
               	$("#prev1").css("display","inline");
            }else{
            	$("#prev1").css("display","none");
            }            
       })
 }
   
   
   
   $("#page2").on("click","a",function(){
	   
	   event.preventDefault();
	   getMissList($(this).attr("data-pagenum"),true);
	   
   })
   function misspage(pageNum){
	   
	   getMissList(pageNum,true);
   }
   
   
   var missStrAdd;
   
   function getMissList(pageNum,reset){
    
    
    $.getJSON("getMissList/"+pageNum,
          function(data){                    
          console.log(data);
          var total = data.total;
          var list = data.list;
          var page = data.pageVO;
          
          
         
          if(reset == true){ 
        	  missStrAdd="";              
          }
          
          if(list.length <1){
          	$(".m").html(missStrAdd);
			$(".m li").fadeIn(500);
            return;
          }
          
          for(var i=0; i<list.length; i++){
          missStrAdd+=	"<li style='display:none;'>"+"<dl>"+"<dt><em>"+timestamp2(list[i].found_regdate)+"</em></dt>"+
          "<dd><a href='../missboard/MissingDetail?found_number="+list[i].found_number+"&MEMBERS_ID="+list[i].members_id+"'>"+list[i].found_title+"</a></dd></dl></li>";
          
          }
          
          missStrAdd+="<li class='text-center' style='border:0px; display:none;'><br><br> <ul class='pagination pagination-sm' id='page2' style='position: absolute; bottom: -10px;'>"+
                 "<li id='prev2' style='border: 0px; padding: 0px;'><a href='javascript:void(0);' onclick='misspage("+(page.startPage-1)+")' data-pagenum='"+(page.startPage-1)+"'>이전</a></li>";
          
 		  for(var i=page.startPage; i<=page.endPage;i++){
        	 missStrAdd+="<li class='"+(i==page.pageNum? 'active':'')+"' style='border: 0px; padding: 0px;' ><a href='javascript:void(0);' onclick='misspage("+i+")' data-pagenum='"+i+"'>"+i+"</a></li>";
          }
          
 		  missStrAdd+="<li id='next2' style='border: 0px; padding: 0px;'><a href='javascript:void(0);' onclick='misspage("+(page.endPage+1)+")' data-pagenum='"+(page.endPage+1)+"'>다음</a></li></ul></li>";
          
          
          $(".m").html(missStrAdd);
          //reply 화면에 그릴때 reply-wrap을 display none으로 선언하고 제이쿼리 fadeIn함수로 서서히 보이게 처리
          $(".m li").fadeIn(500); 
          
          if(page.next){ //페이지 번호 * amount가 전체 게시글 보다 크면 더보기를 삭제
             	$("#next2").css("display","inline");
            }else{
          	$("#next2").css("display","none");
            }
            
          if(page.prev){ //페이지 번호 * amount가 전체 게시글 보다 크면 더보기를 삭제
               	$("#prev2").css("display","inline");
            }else{
            	$("#prev2").css("display","none");
            }            
       })
 }
   
   
   $(document).ready(function(){
	   
	   		   
	   	getList(1,true);
	   
   })
   
   var cnt=1;
   
   $("#moreList").click(function(){
       cnt++;                 
       getList(cnt,true);
       $("#beforeList").css("display","block");
    });
   
   $("#beforeList").click(function(){
	   cnt--;                 
       getList(cnt,true);
       $("#moreList").css("display","block");
   })
   
 var strAdd="";
 function getList(pageNum,reset){
    
    
    $.getJSON("getList/"+pageNum,
          function(data){                    
          console.log(data);
          var total = data.total;
          var list = data.list;
          
          if(cnt*5 >= total){ //페이지 번호 * amount가 전체 게시글 보다 크면 더보기를 삭제
           $("#moreList").css("display","none");
          }
          
          if(reset == true){ 
              strAdd="";              
           }
          
          if(cnt<2){
           $("#beforeList").css("display","none");	  
          }
          
          if(list.length <1){
          	$("#p_history").html(strAdd);
			$("#p_history li").fadeIn(500);
            return;
          }
          
          for(var i=0; i<list.length; i++){
          strAdd+=	"<li style='display:none;'>"+"<span>"+list[i].movie_name+"&nbsp;&nbsp;&nbsp;</span>"+
          			"<span>"+list[i].reservation_row+list[i].reservation_seat+"&nbsp;&nbsp;&nbsp;</span></li><li>"+                            
      				"<em> "+timestamp(list[i].start_time)+" ~ "+timestamp(list[i].end_time)+"</em>"+
      				"</li>";
          }
          
          $("#p_history").html(strAdd);
          //reply 화면에 그릴때 reply-wrap을 display none으로 선언하고 제이쿼리 fadeIn함수로 서서히 보이게 처리
          $("#p_history li").fadeIn(500); 
       })
 }
 
 function timestamp(millis){             
    
       var time;
    
       var today = new Date(millis);
       
       var year = today.getFullYear();//년
       var month = today.getMonth()+1;//월
       var day = today.getDate();//일
       
       var hour = today.getHours();//시
       var minute = today.getMinutes();//분
       var second = today.getSeconds();//초
       time = year+"-"+(month<10 ? "0"+month : month)+"-"+(day<10 ? "0"+day : day )+" "+(hour<10 ? "0"+hour : hour )+":"+(minute<10 ? "0"+minute : minute);
    
    return time;
 }
 
 function timestamp2(millis){             
	    
     var time;
  
     var today = new Date(millis);
     
     var year = today.getFullYear();//년
     var month = today.getMonth()+1;//월
     var day = today.getDate();//일
     
     var hour = today.getHours();//시
     var minute = today.getMinutes();//분
     var second = today.getSeconds();//초
     time = year+"-"+(month<10 ? "0"+month : month)+"-"+(day<10 ? "0"+day : day )+" "+(hour<10 ? "0"+hour : hour )+":"+(minute<10 ? "0"+minute : minute)+":"+(second<10 ? "0"+second : second);
  
  return time;
}
   
   
   
   
   var lcbKakaoJavaScriptKey = "";
   if (window.Kakao && lcbKakaoJavaScriptKey) {
      Kakao.init(lcbKakaoJavaScriptKey);
   }
   function sendTo() {
         if (!window.Kakao || !lcbKakaoJavaScriptKey) {
             alert('카카오 JavaScript 키가 설정되지 않았습니다.');
             return;
         }
         Kakao.Auth.login({
             scope: 'PROFILE,TALK_MESSAGE',
             success: function (response) {
                 Kakao.API.request({
               	  url: '/v2/api/talk/memo/default/send',
               	  data: {
               	    template_object: {
               	      object_type: 'feed',
               	      content: {
               	        title: '구매내역',
               	        description: '총 티켓: ${ticket}장',
               	        
               	        image_url: 'https://img.megabox.co.kr/SharedImg/store/2020/07/09/o9qHmEvE7s13Ha2Q9hUhGgZFyZej5JjN_280.jpg'
               	          ,
               	        link: {
               	          web_url: 'http://dev.kakao.com',
               	          mobile_web_url: 'http://dev.kakao.com',
               	        },
               	      },
               	      social: {
               	        like_count: 100,
               	        comment_count: 200,
               	      },
               	      button_title: '바로 확인',
               	    }, 
                     },
                     success: function(res) {                   	  
                   	  alert('구매내역 전송 성공');
                     },
                     fail: function(err) {
                       alert('error: ' + JSON.stringify(err));
                     },
                   })
                 
             },
             fail: function (err) {
                 alert('failed to login: ' + JSON.stringify(err));
             },
         })
     }   
