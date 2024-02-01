<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- haeder.jsp -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!--  여기 아래 부분 부터 main 영역으로 사용 예정 -->
<main id="main">

	<!-- ======= Clients Section ======= -->
	<section id="clients" class="clients section-bg">
		<div class="container"></div>
	</section>
	<!-- End Cliens Section -->

	<!-- ======= About Us Section ======= -->
	<section id="about" class="about">
		<div class="container" data-aos="fade-up">

			<div class="section-title">
				<h2>My Bank :: 차세대 은행 관리 페이지</h2>
			</div>

			<div class="row content">
				<div class="col-lg-6">
					<p>차세대 은행 관리페이지에 오신것을 환영합니다!</p>
					<ul>
						<li><i class="ri-check-double-line"></i>✅ 계좌 생성 기능 구현</li>
						<li><i class="ri-check-double-line"></i>✅ 생성한 계좌로 계좌간 송금 기능
							구현</li>
						<li><i class="ri-check-double-line"></i>✅ 입금, 송금, 입출금 조회 기능
							구현</li>
					</ul>
				</div>
				<div class="col-lg-6 pt-4 pt-lg-0">
					<p>계좌를 생성하여 차세대 은행 관리 기술을 경험하세요!</p>
					<a href="/account/save" class="btn-learn-more">계좌 개설하러 가기!</a>
				</div>
			</div>

		</div>
	</section>
	<!-- End About Us Section -->


	<!-- ======= Services Section ======= -->
	<section id="services" class="services section-bg">
		<div class="container" data-aos="fade-up">

			<div class="section-title">
				<h2>은행업무 서비스</h2>
				<p>계좌를 개설하고 이체할 수 있는 서비스를 제공합니다.</p>
			</div>

			<div class="row justify-content-center">
				<div class="col-xl-3 col-md-6 d-flex align-items-stretch"
					data-aos="zoom-in" data-aos-delay="100">

					<div class="icon-box">
						<div class="icon">
							<i class="bx bxl-dribbble"></i>
						</div>
						<h4>
							<a href="/account/save">계좌 개설하기</a>
						</h4>
						<p>차세대 은행, MyBank의 계좌를 개설해보세요!</p>
					</div>

				</div>

				<div
					class="col-xl-3 col-md-6 d-flex align-items-stretch mt-4 mt-md-0"
					data-aos="zoom-in" data-aos-delay="200">
					<div class="icon-box">
						<div class="icon">
							<i class="bx bx-file"></i>
						</div>
						<h4>
							<a href="/account/list">나의 계좌보기</a>
						</h4>
						<p>나의 계좌의 잔고와 계좌들을 확인하세요!</p>
					</div>
				</div>

				<div
					class="col-xl-3 col-md-6 d-flex align-items-stretch mt-4 mt-xl-0"
					data-aos="zoom-in" data-aos-delay="300">
					<div class="icon-box">
						<div class="icon">
							<i class="bx bx-tachometer"></i>
						</div>
						<h4>
							<a href="/account/transfer">이체하기</a>
						</h4>
						<p>이체할 수 있는 서비스를 제공합니다.</p>
					</div>
				</div>



			</div>

		</div>
	</section>
	<!-- End Services Section -->

	<!-- ======= Cta Section ======= -->
	<section id="cta" class="cta">
		<div class="container" data-aos="zoom-in">

			<div class="row">
				<div class="col-lg-9 text-center text-lg-start">
					<h3>이용 안내</h3>
					<p>저의 사이트에 이용에 불편한 점이 있으시면 언제든지 문의해주세요!</p>
				</div>
				<div class="col-lg-3 cta-btn-container text-center">
					<a class="cta-btn align-middle" href="#">문의하기(준비중)</a>
				</div>
			</div>

		</div>
	</section>
	<!-- End Cta Section -->



</main>
<!-- End #main -->
<!--  end of main -->

<!-- footer.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>