<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath }"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<script>
	$("#form").click(function(e){
		console.log('form close');
		$(this).find('form')[0].reset()
	});
	
	function checkEmail(){
		var member_id = $("#member_id").val();
		var email = $("#email").val();

		$.ajax({
			type:"GET",
			url: "${contextPath}/member/signinCheck.do",
			async : false,
			data:{
				"member_id":member_id,
				"email":email
			},
			success:function(data,textStatus){
				if(data['check']){
					alert("정보가 일치합니다. 입력하신 이메일로 발송 완료!!");
					$.ajax({
						type:"POST",
						url: "${contextPath}/member/findPwSendEmail.do",
						async : false,
						data: {
							"member_id":member_id,
							"email":email
						},
						success:function(){
							$('#form').find('#email').val('');
							location.href="${contextPath}/member/signin-passwordUpdate.do?member_id="+member_id;	
						}
					})
				}else{
					alert("일치하는 정보가 없습니다.");
				}
			},
			error: function(data,textStatus){
				alert("에러가 발생했습니다.");
			}
		}); 
	}
</script>

	<body>

		<div id="wrapper">
			<!-- /PAGE TITLE -->


			<!-- FORM -->
			<section>
				<div class="container">


					<div class="row">

						<div class="col-12 col-sm-8 col-md-8 col-lg-6 offset-sm-2 offset-md-2 offset-lg-3">

							<!-- optional class: .form-control-pill -->
							<form id = "form" novalidate class="bs-validate p-5 rounded shadow-xs">

								<h2 class="h5 text-center mb-5 mt-3">
									비밀번호 찾기
								</h2>
								<p class="text-danger" style = "text-align:center; color: blue;" >
									입력된 정보로 임시 비밀번호가 전송됩니다.
								</p>
								
								<!-- <div class="form-label-group mb-3">
									<input required placeholder="member_name" id="member_name" name="member_name" type="text" class="form-control">
									<label for="account_email">이름</label>
								</div> -->

								<div class="form-label-group mb-3">
									<input required placeholder="member_id" id="member_id" name="member_id" type="text" class="form-control">
									<label for="account_email">아이디</label>
								</div>

								<div class="form-label-group mb-3">
									<input required placeholder="Email" id="email" name="email" type="email" class="form-control">
									<label for="account_email">이메일</label>
								</div>
								
								<div class="row">

									<div class="col-12 col-md-6 mt-4">
										<button type="submit" class="btn btn-primary btn-block" onclick = "checkEmail()">
											찾기
										</button>
									</div>

									<div class="col-12 col-md-6 mt-4 text-align-end text-center-xs">
										<!-- empty -->
									</div>
								</div>
							</form>
						</div>

					</div>

				</div>
			</section>
			<!-- /FORM -->




			
		</div><!-- /#wrapper -->

		<!-- <script src="assets/js/core.min.js"></script> -->
		
	</body>
</html>
