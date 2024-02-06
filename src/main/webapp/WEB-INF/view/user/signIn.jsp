<%@page import="java.math.BigInteger"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.security.SecureRandom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- haeder.jsp -->
    <%@ include file="/WEB-INF/view/layout/header.jsp" %>
    
    
    
<div class="container p-5 col-sm-8">
<div class= "bg-light p-md-5">
<h2>로그인</h2>
	<h5>어서오세요, 환영합니다.</h5>
	<!-- 로그인만 예외로 post -->
	<form action="/user/sign-in" method="post">
  <div class="form-group">
    <label for="username">username:</label>
    <input type="text" name="username" class="form-control" placeholder="Enter username" id="username" value="주녘">
  </div>
  <div class="form-group">
    <label for="pwd">password:</label>
    <input type="password" name="password" class="form-control" placeholder="Enter password" id="pwd" value="1234">
  </div>
  <!-- 과제 : 이벤트 전파 속성 - 버블링 뭔가? 캡처링 이란? -->
  <button type="submit" class="btn btn-outline-secondary">로그인</button>
  <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=2c617de944e126184f4c77cab2d22c93&redirect_uri=http://localhost/user/kakao-callback">
  	<img alt="" src="/images/kakao_login_small.png" width="75" height="38">
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
        <a href="<%=apiURL%>"><img height="50"
            src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
</form>
</div>
	
</div>

</br>
</div>
</div>
    
    
<!-- footer.jsp -->
    <%@ include file="/WEB-INF/view/layout/footer.jsp" %>