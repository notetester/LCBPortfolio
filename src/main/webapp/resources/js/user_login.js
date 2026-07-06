	$(document).ready(function(){
	    (function(){
	        if(history.state ===''){
	            return;
	        }
	        var msg=$("#msg").val();
	        if(msg!=''){
	            alert(msg);
	            history.replaceState('',null,null); 
	        }
	    })();
	})

   	let MEMBERS_ID = $('#MEMBERS_ID');
    let MEMBERS_PW = $('#MEMBERS_PW');
    let btn = $('#btn');

    $(btn).on('click', function(){
        if($(id).val() == ""){
            $(id).next('label').addClass('warning');
            setTimeout(function(){
                $('label').removeClass('warning');
            },1500);
        }
        else if($(pw).val()== ""){
            $(id).next('label').addClass('warning');
            setTimeout(function(){
                $('label').removeClass('warning');
            },1500);
        }
    }); 
    
    var lcbKakaoJavaScriptKey = "";
    if (window.Kakao && lcbKakaoJavaScriptKey) {
        Kakao.init(lcbKakaoJavaScriptKey);
    }
   
    
    function loginFormWithKakao() {
        if (!window.Kakao || !lcbKakaoJavaScriptKey) {
            alert('카카오 JavaScript 키가 설정되지 않았습니다.');
            return;
        }
        Kakao.Auth.loginForm({
          success: function(authObj) {
              getInfo();
          },
          fail: function(err) {
            showResult(JSON.stringify(err))
          },
        })
      }
    function getInfo() {
        Kakao.API.request({
            url: '/v2/user/me',
            success: function (res) {
                console.log(res)
                
                var id = res.id;
                var email = res.kakao_account.email;
                var name = res.kakao_account.profile.nickname;
                var profile_img = res.kakao_account.profile.profile_image_url;
                console.log(id, email, name, profile_img)
                
                document.kakaoLogin.Kakao_ID.value = id;
                document.kakaoLogin.Kakao_Email.value = email;
                document.kakaoLogin.Kakao_NickName.value = name;
                document.kakaoLogin.submit();
            },
            fail: function (error) {
                alert("사용자 요청 정보에 실패했습니다. 동의 항목을 확인하세요.");
            },
        })
    }
    if (window.Kakao && lcbKakaoJavaScriptKey) {
        Kakao.Link.createScrapButton({
            container: '#kakao-link-btn',
            requestUrl: 'https://developers.kakao.com'
        });
    }
