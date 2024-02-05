<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- haeder.jsp -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<div class="container k_login_container">
	<div id="k_search_user">
		<div class="text-left k_login">이메일/비밀번호 찾기</div>
		<div class="k_radio_group">
			<input type="radio" id="emailRadio" name="screen" checked> <label
				for="emailRadio">이메일 찾기 </label> <input type="radio"
				id="passwordRadio" name="screen"> <label for="passwordRadio">비밀번호
				찾기</label>
		</div>
		<div id="emailScreen">
			<div class="k_form_group">
				<label class="k_input_label">이름</label><br> <input type="text"
					class="form-control" name="username" id="username">
				<p id="usernameCkeck"></p>
			</div>
			
			<div class="k_input_button">
				<button name="findEmail" id="findEmail">이메일 찾기</button>
			</div>
		</div>

		<div id="passwordScreen" style="display: none;">
			<div class="k_form_group">
				<label class="k_input_label">이메일</label><br> <input type="text"
					class="form-control" name="email" id="email"><br>
				<p id="userEmailCkeck"></p>
			</div>
			<div class="l_email_info">
				<p>입력하신 이메일로 임시 비밀번호가 전송됩니다.</p>
			</div>
			<div class="k_input_button">
				<button type="" name="sendPassword" id="sendPassword">임시
					비밀번호 전송</button>
			</div>
		</div>

	</div>
</div>


</br>
</div>
</div>
<!----------------------------------- 라디오 버튼 --------------------------------------------->
<script>
	// 라디오 버튼에 대한 이벤트 리스너 추가
	document
			.getElementById('emailRadio')
			.addEventListener(
					'change',
					function() {
						document.getElementById('emailScreen').style.display = 'block';
						document.getElementById('passwordScreen').style.display = 'none';
					});

	document
			.getElementById('passwordRadio')
			.addEventListener(
					'change',
					function() {
						document.getElementById('emailScreen').style.display = 'none';
						document.getElementById('passwordScreen').style.display = 'block';
					});
</script>
<!----------------------------------- 라디오 버튼 --------------------------------------------->
<!--------------------------------- 회원 이메일 찾기 ------------------------------------------->
<script>
// 회원 이메일 찾기
$(document).ready(function(){
    $("#findEmail").click(function(){
        console.log("진입확인")
       
        $.ajax({
            url : "/user/find-email",
            type : "post",
            data : {"username" : $("#username").val()},
            success : function(response) {
                alert("회원님의 이메일은 " + response.response + ' 입니다.');
                
            },
            error: function (){
                alert("에러");
            }
        });
    })
});
</script>
<!---------------------------------- 회원 이메일 찾기 ------------------------------------------->
<!--------------------------------- 임시 비밀번호 발송 ----------------------------------------->
<script>
	$(document).ready(function() {
		$("#sendPassword").click(function() {
			console.log("진입 확인~");
			
			  // 디버그용
	        var emailValue = $("#email").val();
	        console.log("Email value: " + emailValue);
			$.ajax({
				url : "/user/send-email",
				type : "post",
				data : {
					"email" : $("#email").val()
				},
				success : function(response) {
					console.log("여기" + response.response + "여기");
					alert("회원님의 " + response.response + " 로 임시 비밀번호를 발송했습니다!");
				},
				error : function(response) {
					alert(response.responseJSON.error.message);
				}
			})
		});
	});
</script>
<!--------------------------------- 임시 비밀번호 발송 ------------------------------------------->
<!--------------------------------------- 유효성 검사 ------------------------------------------->
<script>
	// 이메일 정규표현식으로 유효성 검사
	$('#userEmail')
			.focusout(
					function() {
						let email = $('#userEmail').val()
						let emailCheck = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/
						if (!emailCheck.test(email)) {
							$('#userEmailCkeck').html('이메일을 형식에 맞게 정확히 입력하세요.')
									.css('color', 'red');
							return false
						}
						$('#userEmailCkeck').html('')
					});
	$('#sendPassword')
			.on(
					'submit',
					function() {
						let email = $('#userEmail').val()
						let emailCheck = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/
						if (!emailCheck.test(email)) {
							$('#userEmailCkeck').html('이메일을 형식에 맞게 정확히 입력하세요.')
									.css('color', 'red');
							$('#userEmail').focus()
							return false
						}
						$('#userEmailCkeck').html('')
					});
</script>
<script>
	// 이름 정규표현식으로 유효성 검사
	$('#username').focusout(
			function() {

				let nickname = $('#username').val()
				let nicknameCheck = /^[가-힣a-zA-Z]{2,15}$/
				if (!nicknameCheck.test(nickname)) {
					$('#usernameCkeck').html('한글, 영문 이름 2~15자 이내로 입력해주세요.')
							.css('color', 'red');
					return false
				}
				$('#usernameCkeck').html('')
			});
	$('#findEmail').on(
			'submit',
			function() {
				let nickname = $('#username').val()
				let nicknameCheck = /^[가-힣a-zA-Z]{2,15}$/
				if (!nicknameCheck.test(nickname)) {
					$('#usernameCkeck').html('한글, 영문 이름 2~15자 이내로 입력해주세요.')
							.css('color', 'red');
					$('#username').focus()
					return false
				}
				$('#usernameCkeck').html('')
			})
</script>
<script>
	// 전화번호 정규표현식으로 유효성 검사
	$('#tel').focusout(function() {
		let mobile = $('#tel').val()
		let mobileCheck = /^\d{11}$/
		if (!mobileCheck.test(mobile)) {
			$('#telCkeck').html('전화번호 11자리를 올바르게 입력하세요.').css('color', 'red');
			return false
		}
		$('#telCkeck').html('')
	});
	$('#findEmail').on('submit', function() {
		let mobile = $('#tel').val()
		let mobileCheck = /^\d{11}$/
		if (!mobileCheck.test(mobile)) {
			$('#telCkeck').html('전화번호 11자리를 올바르게 입력하세요.').css('color', 'red');
			$('#tel').focus()
			return false
		}
		$('#telCkeck').html('')
	});
</script>
<!--------------------------------------- 유효성 검사 ------------------------------------------->



<script>
	// Add the following code if you want the name of the file appear on select
	$(".custom-file-input").on(
			"change",
			function() {
				var fileName = $(this).val().split("\\").pop();
				$(this).siblings(".custom-file-label").addClass("selected")
						.html(fileName);
			});
</script>


<!-- footer.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>