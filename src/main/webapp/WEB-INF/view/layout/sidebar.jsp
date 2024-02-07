<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/css/sidebar.css">
<div class="container" style="margin-top: 30px; margin-bottom: 40px">
	<div class="row">
		<div class="col-sm-3">
			<h6>
				<c:choose>
					<c:when test="${principal != null}">
						<div class="alert alert-secondary" style="text-align: center;">
							안녕하세요, ${principal.username}님! </br>
						</div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</h6>

			<!-- 로그인 여부에 따라 코드 추가하기 -->
			<c:choose>
				<c:when test="${principal != null}">
					<img class="m--profile" alt="" src="${principal.setupUserImage()}"
						style="border-radius: 5px; margin-bottom: 30px;">
				</c:when>
				<c:otherwise>
					<div class="m--profile"></div>
				</c:otherwise>
			</c:choose>
			<!-- The sidebar -->
			<div class="sidebar">
				<a class="nav-link" href="/account/save">계좌 생성</a> <a
					class="nav-link" href="/account/list">계좌 목록</a> <a class="nav-link"
					href="/account/withdraw">출금</a> <a class="nav-link"
					href="/account/deposit">입금</a> <a class="nav-link"
					href="/account/transfer">이체</a>
			</div>


		</div>