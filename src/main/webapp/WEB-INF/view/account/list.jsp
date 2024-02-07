<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header.jsp -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<div class="jumbotron text-center " style="margin-bottom: 0; background-color: #37517e; color: white; height:200px;">
		<h1 class="mt-4">계좌목록</h1>
		
	</div>
<%@ include file="/WEB-INF/view/layout/sidebar.jsp"%>

<div class="col-sm-8">
	<div class="bg-light p-md-5">

		
		<div class="bg-light">
			<c:choose>
				<c:when test="${accountList != null}">
					<table class="table table-striped">
						<thead class="table-dark">
							<tr>
								<th>계좌 번호</th>
								<th>잔액</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="account" items="${accountList}">
								<tr>
									<td><a href="/account/detail/${account.id}">${account.number}</a></td>
									<td>${account.formatBalance()}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<hr />

					<!-- 총 자산 표시 -->

					<h3 style="text-align: end;">
						<span class="badge bg-secondary"
							style="color: white; width: 5em; margin-inline-end: 10px;">총자산</span>${accountAssets.formatBalance()}</h6>

					</h3>



				</c:when>
				<c:otherwise>
					<p>아직 생성된 계좌가 없습니다.</p>
				</c:otherwise>
			</c:choose>

		</div>

	</div>

</div>
</div>
</div>

<!-- footer.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
