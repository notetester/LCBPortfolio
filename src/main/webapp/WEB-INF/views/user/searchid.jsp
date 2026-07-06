<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<link rel="icon" type="image/png"  href="/jmcnetplug/image/jmclogo.png"/>
	<title>LCB 비밀번호 찾기</title>
	
<style>
	

</style>
	
</head>
<body>
<%@ include file = "../include/header.jsp" %>
<br><br><br>
<br><br><br>
<section>
<h2 align="center">아이디 찾기</h2>
	<div align="center">
	<p>이메일 주소를 입력해 주세요.</p>
	<form action="sendid.do" name="pwsearch" method="post" >
		<table border="1" >		
			<tr>			
				<td>e-mail</td>
			</tr>
			<tr>			
				<td><input type="email" name="MEMBERS_EMAIL" /></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="button" value="아이디 찾기 " onclick="search()" /></td>			
			</tr>
		</table>
	
	</form>
	</div>
</section>
<br><br><br>
<br><br><br>
<br><br><br>

 <%@ include file = "../include/footer.jsp" %>
<script type="text/javascript">
		function search(){
			if(pwsearch.MEMBERS_EMAIL.value!=null){
				pwsearch.submit();
			}if(pwsearch.MEMBERS_EMAIL.value==null) {
				alert("이메일주소를 입력하세요.")
			}
		
		}
	
	</script>

</body>
</html>
