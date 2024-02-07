<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- haeder.jsp -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<div class="jumbotron text-center "
	style="margin-bottom: 0; background-color: #37517e; color: white; height: 200px;">
	<h1 class="mt-4">QNA</h1>

</div>

<div class="container p-5">
	<div class="accordion" id="accordionPanelsStayOpenExample">
		<div class="accordion-item">
			<h2 class="accordion-header" id="panelsStayOpen-headingOne">
				<button class="accordion-button" type="button"
					data-bs-toggle="collapse"
					data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true"
					aria-controls="panelsStayOpen-collapseOne">예금을 신규하려고 합니다.
					도장이 없는데 서명으로도 가능한가요?</button>
			</h2>
			<div id="panelsStayOpen-collapseOne"
				class="accordion-collapse collapse show"
				aria-labelledby="panelsStayOpen-headingOne">
				<div class="accordion-body">
					가능합니다. 다만, 아래예금에 대해서는 서명에 의한 거래가 불가능합니다.<br /> ♣서명거래제외예금 : 예금주 본인
					이외의 거래, 당좌.가계당좌예금, 법인 및 단체명의예금, 공동명의예금 <br /> 서명계좌는 창구거래(출금, 해지 및
					제신고 처리)시 반드시 본인확인증표로 본인확인을 하셔야 하며, 대리인에 의한 출금은 불가능합니다.
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header" id="panelsStayOpen-headingTwo">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse"
					data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false"
					aria-controls="panelsStayOpen-collapseTwo">비과세종합저축에 대해서
					궁금합니다.</button>
			</h2>
			<div id="panelsStayOpen-collapseTwo"
				class="accordion-collapse collapse"
				aria-labelledby="panelsStayOpen-headingTwo">
				<div class="accordion-body">비과세종합저축으로 금융기관이 취급하는 상품에 가입하는 경우
					발생 이자를 비과세합니다. <br/>- 가입기한 : ~2020.12.31 - 가입대상 : 소득세법상의 거주자(직전 3개 과세기간
					동안 소득세법 제14조 제3항 제6호에 따른 소득의 연간 합계액이 1회 이상 2천만원을 초과한 자를 제외)로서 다음의
					1에 해당하는 자 <br/>1. 만 65세 이상* *다만, 2015년 가입자 : 만 61세 이상, 2016년 가입자 : 만 62세
					이상, 2017년 가입자 : 만 63세 이상, 2018년 가입자 : 만 64세 이상<br/> 2. 장애인복지법 제32조의 규정에
					의하여 등록한 장애인<br/> 3. 독립유공자예우에관한법률 제6조의 규정에 의하여 등록한 독립유공자와 그 유족 또는 가족<br/> 4.
					국가유공자 등 예우 및 지원에 관한 법률 제6조의 규정에 의하여 등록한 상이(傷痍)자<br/> 5. 국민기초생활보장법
					제2조제2호의 규정에 의한 수급자<br/> 6. 고엽제후유증의환자지원등에관한법률 제2조제3호의 규정에 의한 고엽제후유의증환자
					(2005.1.1부터) (국가보훈처지방 보훈처에서 발행한 고엽제후유의증환자확인서(증명서))<br/> 7.
					5.18민주유공자예우에관한법률 제4조제2호의 규정에 의한 5.18민주화운동부상자 (2005.1.1부터) (국가보훈처장이
					발행한 '5.18민주유공자증'에 대항구분에 "부상자"임을 확인)<br/> - 저축한도 : 전 금융기관 5천만원(저축원금 기준)</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header" id="panelsStayOpen-headingThree">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse"
					data-bs-target="#panelsStayOpen-collapseThree"
					aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
					타행으로 현금송금 후 바로 출금이 가능한가요?</button>
			</h2>
			<div id="panelsStayOpen-collapseThree"
				class="accordion-collapse collapse"
				aria-labelledby="panelsStayOpen-headingThree">
				<div class="accordion-body">
					현금으로 송금한 경우에는 계좌입금 완료후에 즉시 현금출금이 가능합니다.<br/>
타행 자기앞수표로 입금하신 경우에는 다음 영업일 교환결제 출금가능시간(월~금요일 12:20)이후에 출금이 가능합니다.
				</div>
			</div>
		</div>
	</div>
</div>

<!-- footer.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>