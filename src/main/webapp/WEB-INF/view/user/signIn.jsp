<%@page import="java.math.BigInteger"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.security.SecureRandom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- haeder.jsp -->

<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<link rel="stylesheet" href="/css/login.css">
<div class="jumbotron text-center "
	style="margin-bottom: 0; background-color: #37517e; color: white;">


</div>



<div class="login-wrapper container">
	<h2>Login</h2>
	<form method="post" action="/user/sign-in" id="login-form">
		<input type="text" name="username" class="form-control"
			placeholder="Enter username" id="username" value="주녘"> <input
			type="password" name="password" class="form-control"
			placeholder="Enter password" id="pwd" value="1234"> <label
			for="remember-check"> <input type="checkbox"
			id="remember-check">아이디 저장하기
		</label>
		<!-- 과제 : 이벤트 전파 속성 - 버블링 뭔가? 캡처링 이란? -->
		<br/>
		<div class="d-grid gap-2 col-6 mx-auto">
 <button type="submit" class="btn btn-outline-secondary" >로그인</button>
 
</div>
		
		<br/>
		
		<div class="text-center">
		
		<a
			href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=2c617de944e126184f4c77cab2d22c93&redirect_uri=http://localhost/user/kakao-callback">
			<img alt="" src="/images/kakao_login_medium_narrow.png"
			height="38">
		</a>
	
		<%
		String clientId = "hVlPdCIutDDpu0e0tAA1";//애플리케이션 클라이언트 아이디값";
		String redirectURI = URLEncoder.encode("http://localhost/user/naver-callback", "UTF-8");
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
		String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		apiURL += "&client_id=" + clientId;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&state=" + state;
		session.setAttribute("state", state);
		%>
		<a href="<%=apiURL%>"><img height="38" width="154.53"
			src="/images/btnG_완성형.png" /></a>
			</div>
	</form>
</div>



</br>
</div>
</div>


<!-- footer.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>