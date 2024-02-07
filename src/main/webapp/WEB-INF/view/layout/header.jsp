<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>My Bank :: 차세대 은행관리페이지</title>
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

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>



<link href="/css/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- 외부 스타일 시트 가져오기 -->
<link rel="stylesheet" href="/css/styles.css">

<style>
</style>
</head>
<body>
	<!-- ======= Header ======= -->
  <header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="/home">GREEN Bank</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar">
        
       <ul>
					<li><a class="nav-link scrollto" href="/home">Home</a></li>
					<li><a class="nav-link scrollto" href="/qna">QNA</a></li>
					<li class="dropdown"><a href="#"><span>Service</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="/account/save">계좌 생성</a></li>
							<li><a href="/account/list">계좌 목록</a></li>
							<li><a href="/account/withdraw">출금</a></li>
							<li><a href="/account/deposit">입금</a></li>
							<li><a href="/account/transfer">이체</a></li>
						</ul></li>
					<div style="margin-left: 300px">
						<ul class="navbar">
							<c:choose>
								<c:when test="${principal != null}">

									<li><a class="getstarted scrollto" href="/user/logout">로그아웃</a></li>
								</c:when>
								<c:otherwise>
									<li><a class="getstarted scrollto" href="/user/sign-in">로그인</a></li>
									<li><a class="getstarted scrollto" href="/user/sign-up">회원가입</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>

				</ul>
				<i class="bi bi-list mobile-nav-toggle" style="margin-left: 150px;"></i>


			</nav>
			<!-- .navbar -->




		</div>
	</header>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->


	<!-- End Header -->