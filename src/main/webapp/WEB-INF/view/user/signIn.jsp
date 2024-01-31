<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- haeder.jsp -->
    <%@ include file="/WEB-INF/view/layout/header.jsp" %>
    
<div class="col-sm-8">
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
  <button type="submit" class="btn btn-primary">로그인</button>
</form>
</div>
	
</div>

</br>
</div>
</div>
    
    
<!-- footer.jsp -->
    <%@ include file="/WEB-INF/view/layout/footer.jsp" %>