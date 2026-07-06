var id = document.getElementById("MEMBERS_ID");
id.onkeyup = function() {
    /*자바스크립트의 정규표현식 입니다*/
    /*test메서드를 통해 비교하며, 매칭되면 true, 아니면 false반*/
    var regex = /^[A-Za-z0-9+]{4,12}$/; 
    if(regex.test(document.getElementById("MEMBERS_ID").value )) {
        document.getElementById("MEMBERS_ID").style.borderColor = "green";
        document.getElementById("msgId").innerHTML = "아이디중복체크는 필수 입니다";

    } else {
        
        document.getElementById("MEMBERS_ID").style.borderColor = "red";
        document.getElementById("msgId").innerHTML = "";
    }
}
/*비밀번호 형식 검사 스크립트*/
var pw = document.getElementById("MEMBERS_PW");
pw.onkeyup = function(){
    var regex = /^[A-Za-z0-9+]{8,16}$/;
     if(regex.test(document.getElementById("MEMBERS_PW").value )) {
        document.getElementById("MEMBERS_PW").style.borderColor = "green";
        document.getElementById("msgPw").innerHTML = "사용가능합니다";
    } else {
        document.getElementById("MEMBERS_PW").style.borderColor = "red";
        document.getElementById("msgPw").innerHTML = "";
    }
}
/*비밀번호 확인검사*/
var pwCheck = document.getElementById("pwCheck");
pwCheck.onkeyup = function() {
    var regex = /^[A-Za-z0-9+]{8,16}$/;
    if(document.getElementById("MEMBERS_PW").value == document.getElementById("pwCheck").value ) {
        document.getElementById("pwCheck").style.borderColor = "green";
        document.getElementById("msgPwCheck").innerHTML = "비밀번호가 일치합니다";
    } else {
        document.getElementById("pwCheck").style.borderColor = "red";
        document.getElementById("msgPwCheck").innerHTML = "비밀번호 확인란을 확인하세요";
    }
}
    
     //주소 팝업창
    function goPopup(){
        var pop = window.open("../resources/popup/jusoPopup.jsp" ,"pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
        
        // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
        //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
    }


    function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
            // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
            
            document.getElementById("addrZipNum").value = zipNo;
            document.getElementById("addrBasic").value = roadAddrPart1;
            document.getElementById("addrDetail").value = addrDetail;
            
            /*
            document.form.roadAddrPart1.value = roadAddrPart1; //도로명주소
            document.form.addrDetail.value = addrDetail; //고객입력상세주소
            document.form.zipNo.value = zipNo; //우편번호
            document.form.admCd.value = admCd;
            document.form.rnMgtSn.value = rnMgtSn;
            document.form.bdMgtSn.value = bdMgtSn;
            document.form.detBdNmList.value = detBdNmList;
            document.form.bdNm.value = bdNm;
            document.form.bdKdcd.value = bdKdcd;
            document.form.siNm.value = siNm;
            document.form.sggNm.value = sggNm;
            document.form.emdNm.value = emdNm;
            document.form.liNm.value = liNm;
            document.form.rn.value = rn;
            document.form.udrtYn.value = udrtYn;
            document.form.buldMnnm.value = buldMnnm;
            document.form.buldSlno.value = buldSlno;
            document.form.mtYn.value = mtYn;
            document.form.lnbrMnnm.value = lnbrMnnm;
            document.form.lnbrSlno.value = lnbrSlno;
            document.form.emdNo.value = emdNo;
            */
    }  
    
    $("#idCheckBtn").click(function() {

        if( $("#MEMBERS_ID").val() == '' || $("#MEMBERS_ID").css("borderColor") == "rgb(255, 0, 0)"  ) {
            alert("아이디 규칙을 확인하세요");
            return;
        }
        
        
        console.log($("#MEMBERS_ID").val())
        var mid=$("#MEMBERS_ID").val();
        $.ajax({
            type: "POST",
            url: "IdCheck",
            data: mid,
            
            contentType: "application/json; charset=utf-8",
            success:function(data) {
                
                if(data == 0) { //중복이 없는 경우
                    $("#msgId").html("사용가능한 아이디 입니다");
                    $("#MEMBERS_ID").attr("readonly", true);
                    
                } else { //아이디 중복인 경우
                    $("#msgId").html("중복된 아이디 입니다");
                    $("#MEMBERS_ID").focus(); //포커스 
                }
                
            },
            error: function(status, error) {
                alert("서버에러 입니다. 다시 시도하세요.")
            }
            
        })
    })
       
    $("#joinBtn").click(function() {
        //폼 검증.. 폼을 서브밋..
        
        if( !$("#MEMBERS_ID").attr("readonly") ) {
            alert("아이디 중복체크는 필수 입니다");
            return;
        } else if( $("#MEMBERS_PW").val() == '' ) {
            alert("비밀번호는 필수 입니다");
            return;
        } else if( $("#MEMBERS_PW").css("borderColor") == "rgb(255, 0, 0)" ) {
            alert("비밀번호 규칙을 확인하세요");
            return;
        } else if( $("#MEMBERS_PW").val() != $("#pwCheck").val() ){
            alert("비밀번호 확인란을 확인하세요");
            return;
        } else if( $("#MEMBERS_NAME").val() == '' ) {
            alert("이름은 필수 입니다");
            return;
        } else if( confirm("가입하시겠습니까?") ) { //서브밋
            $("#joinForm").submit(); 
        } 
        
        
        
        
    }) 