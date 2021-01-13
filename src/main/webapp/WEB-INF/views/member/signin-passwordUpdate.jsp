<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String member_id = request.getParameter("member_id");
%>
<script>
var compare_result = false;
function fn_compare_pwd(){ //비밀번호 확인 체크폼
	var pwd1 = $("#password").val();
	var pwd2 = $("#Password_check").val();
	var s_result = $('#s_result');
	/*<span style = "text-size:10px; color: blue;" id = "s_result" >동일한 비밀번호를 입력해주세요</span>  */
	if(pwd1 == pwd2){
		//alert(pwd1);
		//alert(pwd2);
		compare_result = true;
		 $('#s_result').text("✔  비밀번호가 일치합니다.");
		 $('#s_result').css('color','green')
	}else{
		compare_result = false;
		 $('#s_result').text("✖ 비밀번호가 일치하지 않습니다.");
		 $('#s_result').css('color','red')
	}
}

function confirmPw(){
	var pw = $("#certificationPassword").val();
	var member_id = $("#member_id").val();

		$.ajax({
			type:"GET",
			url: "${contextPath}/member/PwCheck.do",
			async : false,
			data: {
				"member_id":member_id,
				"password":pw
			},
			success:function(data,textStatus){
				if(data['check']){
					alert("인증받은 비밀번호가 일치합니다.");
					$('#passwordForm').find('#certificationPassword').val('');
					$('#passwordForm').find('#Password_check').val('');
					var passwordd = $("#password").val();
					$('#passwordForm').find('#certificationPassword').val('');
					$('#passwordForm').find('#Password_check').val('');
					location.href="${contextPath}/member/modifyPassword.do?member_id="+member_id+"&password="+passwordd;	
				}else{
					alert("인증받은 비밀번호가 일치하지 않습니다.");
				}
				
			}
		})

}
</script>
<body>
<%-- <%
	String member_id = request.getParameter("member_id");
%> --%>
	<div id="wrapper">
		<!-- /PAGE TITLE -->
		<!-- FORM -->
		<section>
			<div class="container">
				<div class="row">
					<div
						class="col-12 col-sm-8 col-md-8 col-lg-6 offset-sm-2 offset-md-2 offset-lg-3">

						<!-- optional class: .form-control-pill -->
						<form id = "passwordForm" novalidate class="bs-validate p-5 rounded shadow-xs" >
							<%-- <p><%=member_id %></p> --%>
							<input type = "hidden" name ="member_id" id = "member_id" value = "<%=member_id %>" />
							<h2 class="h5 text-center mb-5 mt-3">비밀번호 찾기</h2>
							<p class="text-danger" style="text-align: center; color: blue;">
								아래에 이메일에서 인증 받은 비밀번호를 입력해주세요</p>

							<!-- <div class="form-label-group mb-3">
									<input required placeholder="member_name" id="member_name" name="member_name" type="text" class="form-control">
									<label for="account_email">이름</label>
								</div> -->

							<div class="form-label-group mb-3">
								<input required placeholder="certificationPassword" id="certificationPassword"
									name="certificationPassword" type="text" class="form-control"> <label
									for="certificationPassword">현재 비밀번호 </label> 
							</div>

							<div class="form-label-group mb-3">
								<input required placeholder="password" id="password"
									name="password" type="password" class="form-control"> <label
									for="password">새 비밀번호를 입력해주세요</label>
							</div>
							
							<div class="form-label-group mb-3">
								<input required placeholder="Password_check" id="Password_check"
									name="Password_check" type="password" class="form-control"  onKeyUp = "fn_compare_pwd()"> <label
									for="Password_check">새 비밀번호를 한 번 더 입력해주세요</label>
									
									<span style = "text-size:10px; color: rgba(0, 0, 255, 0.411);" id = "s_result" >동일한 비밀번호를 입력해주세요</span>
							</div>

							<div class="row">

								<div class="col-12 col-md-6 mt-4">
									<button type="submit" class="btn btn-primary btn-block" onclick="confirmPw(this.form)">찾기</button>
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



	</div>
	<!-- /#wrapper -->

	<!-- <script src="assets/js/core.min.js"></script> -->

</body>
</html>
