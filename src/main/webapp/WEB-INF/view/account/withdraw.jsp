<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- haeder.jsp -->
    <%@ include file="/WEB-INF/view/layout/header.jsp" %>
<div class="jumbotron text-center" style="margin-bottom: 0; background-color: #37517e; color: white; height:200px;">
		<h1 class="mt-4">출금하기</h1>
		
	</div>
    <%@ include file="/WEB-INF/view/layout/sidebar.jsp"%>
    
<div class="col-sm-8">
<div class= "bg-light p-md-5">

	<form action="/account/withdraw" method="post">
  <div class="form-group">
    <label for="amount">출금금액:</label>
    <input type="text" name="amount" class="form-control" placeholder="Enter amount" id="amount" >
  </div>
    <div class="form-group">
    <label for="wAccountNumber">출금 계좌번호:</label>
    <input type="text" name="wAccountNumber" class="form-control" placeholder="출금 계좌번호 입력" id="wAccountNumber" >
  </div>
  <div class="form-group">
    <label for="wAccountPassword">출금계좌 비밀번호:</label>
    <input type="password" name="wAccountPassword" class="form-control" placeholder="출금 계좌 비밀번호 입력" id="wAccountPassword" >
  </div>
  
  <button type="submit" class="btn btn-outline-secondary">출금하기</button>
</form>
</div>
	
</div>

</br>
</div>
</div>
    
    
<!-- footer.jsp -->
    <%@ include file="/WEB-INF/view/layout/footer.jsp" %>