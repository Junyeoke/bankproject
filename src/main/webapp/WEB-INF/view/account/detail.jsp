<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<div class="jumbotron text-center " style="margin-bottom: 0; background-color: #37517e; color: white; height:200px;">
		<h1 class="mt-4">계좌상세보기</h1>
		
	</div>
<%@ include file="/WEB-INF/view/layout/sidebar.jsp"%>

<div class="col-sm-8">
	<div class="bg-light p-md-5">

		</hr>
		</br>
		<div class="bg-light mb-4">
			<div class="card rounded">
				<div class="card-body d-flex flex-column">
					<div>
						<h4>${principal.username}님의계좌</h4>
						<h6>
							<span class="badge bg-secondary"
								style="color: white; width: 5em; margin-inline-end: 10px;">계좌번호</span>${account.number}
						</h6>
						<h6>
							<span class="badge bg-secondary"
								style="color: white; width: 5em; margin-inline-end: 10px;">잔액</span>${account.formatBalance()}
						</h6>
					</div>

				</div>
			</div>
		</div>

		<div class="mt-auto d-flex justify-content-end">
			<div class="btn-group me-3" role="group">
				<a href="/account/detail/${account.id}">
					<button type="button" class="btn btn-outline-secondary mr-2">전체조회</button>
				</a> <a href="/account/detail/${account.id}?type=deposit">
					<button type="button" class="btn btn-outline-secondary mr-2">입금조회</button>
				</a> <a href="/account/detail/${account.id}?type=withdraw">
					<button type="button" class="btn btn-outline-secondary">출금조회</button>
				</a>
			</div>
		</div>

		<table class="table table-striped text-center mt-3">
			<thead class="table-dark">
				<tr>
					<th>날짜</th>
					<th>보낸이</th>
					<th>받은이</th>
					<th><c:choose>
							<c:when test="${param.type == 'deposit'}">입금금액</c:when>
							<c:when test="${param.type == 'withdraw'}">출금금액</c:when>
							<c:otherwise>입출금 금액</c:otherwise>
						</c:choose></th>
					<th>계좌 잔액</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="history" items="${historyList}">
					<tr>
						<td>${history.formatCreatedAt()}</td>
						<td>${history.sender}</td>
						<td>${history.receiver}</td>
						<td>${history.formatAmount()}</td>
						<td>${history.formatBalance()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr />
	</div>
</div>
</div>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
