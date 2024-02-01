<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>My bank</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>



<!-- 외부 스타일 시트 가져오기 -->
<link rel="stylesheet" href="/css/styles.css">
<style>
</style>
</head>
<body>
	<div class="jumbotron text-center banner--img" style="margin-bottom: 0">
		<h1>my bank</h1>
		<p>최첨단 은행 관리 시스템</p>
	</div>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<!-- Brand -->
		<a class="navbar-brand" href="/main/home">MyBank :: 최첨단 은행 관리시스템</a>


		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/main/home">홈으로</a>
			</li>


			<!-- Dropdown -->
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="/account/list"
				id="navbardrop" data-toggle="dropdown"> 은행업무 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="/account/save">계좌 생성</a> <a
						class="dropdown-item" href="/account/list">계좌 목록</a> <a
						class="dropdown-item" href="/account/withdraw">출금</a> <a
						class="dropdown-item" href="/account/deposit">입금</a> <a
						class="dropdown-item" href="/account/transfer">이체</a>
				</div></li>
		</ul>


		<div class=" collapse navbar-collapse justify-content-end"
			id="collapsibleNavbar">
			<ul class="navbar-nav">

				<c:choose>
					<c:when test="${principal != null}">
						<li class="nav-item"><a class="nav-link" href="/user/logout"><button
									type="button" class="btn btn-outline-light">로그아웃</button></a></li>
					</c:when>

					<c:otherwise>
						<li class="nav-item"><a class="nav-link" href="/user/sign-in"><button
									type="button" class="btn btn-outline-light">로그인</button></a></li>
						<li class="nav-item"><a class="nav-link" href="/user/sign-up"><button
									type="button" class="btn btn-outline-light">회원가입</button></a></li>
					</c:otherwise>

				</c:choose>

			</ul>
		</div>
	</nav>



	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-4">

				<h2>About Me</h2>
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
			<!--  end of header -->