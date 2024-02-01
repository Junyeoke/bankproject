<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-4">
				<h6>
					<c:choose>
						<c:when test="${principal != null}">
							<div class="alert alert-secondary" style="text-align: center;">
								반갑습니다, ${principal.username}님! </br> 중단기 심화 - 은행 관리 시스템 예제
							</div>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</h6>

				<div class="m--profile" style="border-radius: 5px"></div>

				<div class="card mb-5 mt-3" style="width: auto;">
					<div class="card-header">바로가기</div>
					<ul class="list-group list-group-flush flex-column">
						<li class="list-group-item"><a class="nav-link"
							href="/account/save">계좌 생성</a></li>
						<li class="list-group-item"><a class="nav-link"
							href="/account/list">계좌 목록</a></li>
						<li class="list-group-item"><a class="nav-link"
							href="/account/withdraw">출금</a></li>
						<li class="list-group-item"><a class="nav-link"
							href="/account/deposit">입금</a></li>
						<li class="list-group-item"><a class="nav-link"
							href="/account/transfer">이체</a></li>
					</ul>
				</div>
				<hr class="d-sm-none">
			</div>