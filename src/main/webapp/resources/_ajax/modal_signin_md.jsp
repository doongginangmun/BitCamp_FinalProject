<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("UTF-8");
%>

	<jsp:include page="/WEB-INF/views/member/googleLogin.jsp" />

		<!-- modal header not used -->

		<button type="button" class="close cursor-pointer z-index-10 w--30 h--30 position-absolute top-0 end-0 my-2 mx-3" data-dismiss="modal" aria-label="Close">
			<span class="fi fi-close fs--25 position-absolute end-0 top-0" aria-hidden="true"></span>
		</button>


		<div class="modal-body p-0 m-5 m-4-xs">

			<div class="accordion" id="accordionAccount">


				<!-- SIGN IN -->
				<form class="collapse bs-validate show" novalidate method="post" action="${contextPath}/member/login.do">
				
					<h5 class="text-center pb-3">로그인하기</h5>


					<!-- id -->
					<div class="form-label-group mb-4">

						<input required placeholder="id" id="member_id" type="text" name="member_id" class="form-control">
						<label for="member_id">아이디</label>
					
					</div>


					<!-- password -->
					<div class="input-group-over">

						<div class="form-label-group mb-4">
							<input required placeholder="password" id="password" name="password" type="password" class="form-control" autocomplete="new-password">
							<label for="account_password">비밀번호</label>
						</div>

						<a href="${contextPath}/member/signin-password.do" class="btn btn-pill fs--12">
							비밀번호 찾기
						</a>

					</div>
					<input type="hidden" name="_action" value="productDetail">
					<input type="hidden" name="product_id" value=${product_id }>


					<!-- button -->
					<button type="submit" class="btn btn-primary btn-soft btn-block" id="btn_login">
						로그인
					</button>					


					<div class="text-center mt-5">
						<a href="${contextPath}/member/signupForm.do" class="d-block text-success text-decoration-none"
							style="margin-bottom: 20px">
							아직 계정이 없으신가요?
						</a>
					</div>
					
						<!-- 구글로 로그인  -->
							<!-- In the callback, you would hide the gSignInWrapper element on a successful sign in -->
							<div id="gSignInWrapper">
								<a id="customBtn" class="btn btn-sm btn-block transition-hover-top mt-1 text-white">
									<i>G</i>
										google
								</a>
							</div>
							<div id="name"></div>
							<script>
								startApp();
							</script>

				</form>
				<!-- /SIGN IN -->

			</div>

		</div>

		<div class="border-top text-muted fs--13 bg-light rounded-bottom p-3">
			<b>Privacy:</b> All data is secure, never transfered to a third party provider/service.
		</div>
