<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- haeder.jsp -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<div class="jumbotron text-center " style="margin-bottom: 0; background-color: #37517e; color: white; height:200px;">
		<h1 class="mt-4">계좌 개설하기</h1>
		
	</div>
<%@ include file="/WEB-INF/view/layout/sidebar.jsp"%>

<div class="container col-sm-8">
	<div class="bg-light p-md-5">


		<form action="/account/save" method="post">
			<div class="form-group">
				<label for="number">사용하실 계좌번호</label> <input type="text" name="number"
					class="form-control" placeholder="Enter number" id="number"
					>
			</div>
			<div class="form-group">
				<label for="pwd">사용하실 계좌비밀번호</label> <input type="password"
					name="password" class="form-control" placeholder="Enter password"
					id="pwd" >
			</div>
			<div class="form-group">
				<label for="balance">초기 입금 금액</label> <input type="text"
					name="balance" class="form-control" placeholder="Enter balance"
					id="balance" >
			</div>

			<button type="submit" class="btn btn-outline-secondary">계좌 생성하기</button>
		</form>
	</div>

</div>

</br>
</div>
</div>

<!-- footer.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>