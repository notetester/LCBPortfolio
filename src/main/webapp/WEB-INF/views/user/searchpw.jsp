<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<link rel="icon" type="image/png"  href="/jmcnetplug/image/jmclogo.png"/>
	<title>LCB 비밀번호 찾기</title>
	
	
</head>
<body>

<h2 align="center">비밀번호 찾기</h2>
<div align="center">
<p >아이디와 이메일 주소를 입력해 주세요.</p>
<form action="sendpw.do" name="pwsearch" method="post" >
	<table border="1" >
		
		<tr>
			<td>아이디</td>
			<td>e-mail</td>
		</tr>
		<tr>
			<td><input type="text" name="MEMBERS_ID"/></td>
			<td><input type="email" name="MEMBERS_EMAIL" /></td>
		</tr>
		<tr align="center">
			<td colspan="2"><input type="button" value="비밀번호 찾기 " onclick="search()" /></td>
			
		</tr>
	</table>

</form>
</div>

<script type="text/javascript">
		function search(){
			if((pwsearch.MEMBERS_ID.value!=null)&&(pwsearch.MEMBERS_EMAIL.value!=null)){
				pwsearch.submit();
			}else if(pwsearch.MEMBERS_ID.value==null) {
				alert("아이디를 입력하세요.")
			}else if(pwsearch.MEMBERS_EMAIL.value==null) {
				alert("이메일주소를 입력하세요.")
			}
		
		}
	
	</script>

</body>
</html>
