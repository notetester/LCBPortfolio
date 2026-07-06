	
	var joinBtn = document.getElementById("joinBtn");
	joinBtn.onclick = function(){
		if($("#MEMBERS_NAME").val()==''){
			alert("이름을 입력해주세요");
		}else if($("#MEMBERS_PHONE").val()==''){
			alert("번호를 입력해주세요");
		}else if($("#addrZipNum").val()==''){
			alert("주소를 입력해주세요.");
		}else{		
			document.KakaoJoinForm.action="KakaoJoinForm";
			document.KakaoJoinForm.submit();
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