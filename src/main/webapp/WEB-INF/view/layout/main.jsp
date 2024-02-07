<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- haeder.jsp -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

 <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">

    <div class="container">
      <div class="row">
        <div class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1" data-aos="fade-up" data-aos-delay="200">
          <h1>더 나은 은행  <br/>GreenBank입니다.</h1>
          <h2>그린은행은 손쉬운 은행업무들을 제공합니다.</h2>
          <div class="d-flex justify-content-center justify-content-lg-start">
            <a href="/account/save" class="btn-get-started scrollto">계좌개설하기</a>
          </div>
        </div>
        <div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-in" data-aos-delay="200">
          <img src="images/hero-img.png" class="img-fluid animated" alt="">
        </div>
      </div>
    </div>

  </section><!-- End Hero -->

<!--  여기 아래 부분 부터 main 영역으로 사용 예정 -->
<main id="main">

	<!-- ======= Clients Section ======= -->
	<section id="clients" class="clients section-bg">
		<div class="container"></div>
	</section>
	<!-- End Cliens Section -->

	
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
							<a href="/account/save">🎫 계좌 개설하기</a>
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
							<a href="/account/list">🔎 계좌조회</a>
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
							<a href="/account/transfer">💸 이체하기</a>
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
					<h3>자주 묻는 질문</h3>
					<p>자주 묻는 은행 업무를 알려드립니다.</p>
				</div>
				<div class="col-lg-3 cta-btn-container text-center">
					<a class="cta-btn align-middle" href="/qna">바로가기</a>
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