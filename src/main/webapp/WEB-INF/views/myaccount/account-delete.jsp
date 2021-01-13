<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- DELETE ACCOUNT -->
<form name="deleteForm" method="post"
	action="${contextPath}/myaccount/deleteAccount.do">
	<div class="clearfix mt--60">

		<div class="text-align-end">
			<a href="#account_deactivate_confirm"
				class="text-gray-500 text-decoration-none font-light collapsed"
				data-toggle="collapse" aria-expanded="false"
				 style="color:purple;"
				onclick="jQuery('#user_password_current, #user_password_new').val('');">
				<span class="group-icon fs--13"> <i class="fi fi-arrow-down"></i>
					<i class="fi fi-close"></i>
			</span> 
			<span class="pl-2 pr-2" style = "color: purple"> 계정 삭제 </span>
			</a>
		</div>


		<div id="account_deactivate_confirm" class="collapse" style="">

			<div class="alert b-0 bg-danger-soft mt-3 mb-5 p-4 clearfix">

				<p>
					참고 : &nbsp;&nbsp;삭제 된 계정은 복원 할 수 없습니다!! &nbsp; 귀하의 계정은 시스템에서 영구적으로 삭제됩니다. <br> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 다시 한 번 생각해주세요.
				</p>


				<i
					class="arrow arrow-lg arrow-bottom arrow-center border-danger-soft"></i>
			</div>

			<div class="row mb--60">

				<div class="col-12 offset-lg-2 col-lg-7">

					<div class="input-group-over">
						<div class="form-label-group mb-1">
							<input placeholder="Current Password" id="current_password"
								name="current_password" type="password" class="form-control">
							<label for="current_password">현재 비밀번호</label>
						</div>

						<!-- `SOW : Form Advanced` plugin used -->
						<a href="#" class="btn fs--12 btn-password-type-toggle"
							data-target="#account_del_current_password"> <span
							class="group-icon"> <i class="fi fi-eye m-0"></i> <i
								class="fi fi-close m-0"></i>
						</span>
						</a>
					</div>



					<div class="mt--7 fs--13 text-muted mb--30">보안상의 이유로 현재 비밀번호가
						필요합니다.</div>

					<div class="form-label-group mb-1">
						<input placeholder="Current Password" id="bbutton" type= "button"
							style="background-color: red;" onclick="deleteCheck()"
							class="form-control" value= "계정 삭제" 
							style = "background-color: red"/>
					</div>

				</div>

			</div>

		</div>

	</div>

	<!-- /DELETE ACCOUNT -->

</form>
<script>
	function deleteCheck() {
		if (confirm("회원탈퇴를 하시면 회원님의 모든 데이터(개인정보, 포인트 등)가 삭제 되어집니다. 그래도 회원을 탈퇴하시겠습니까??") == true) { //확인
			document.deleteForm.submit();
		} else { //취소
			return false;
		}
	}
</script>
<script src="${contextPath}/resources/assets/js/core.min.js"></script>