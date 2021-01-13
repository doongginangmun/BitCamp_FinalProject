<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:include page="/WEB-INF/views/common/daumZip.jsp" />

<script>	

	function fn_join_member(){ //가입하기 누른 후 비밀번호 불일치 시에 		
			alert("회원 가입을 진행합니다.");		
			return;
		}
	
</script>
	
		<!-- PAGE TITLE -->
		<section class="bg-light p-0">
			<div class="container py-5">

				<h1 class="h3">회원가입</h1>

				<nav aria-label="breadcrumb">
					<ol class="breadcrumb fs--14">
						<li class="breadcrumb-item"><a href="${contextPath}/main/main.do">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Account</li>
					</ol>
				</nav>

			</div>
		</section>
		<!-- /PAGE TITLE -->



		<!-- FORM -->
		<section>
			<div class="container">


				<div class="row">

					<div
						class="col-12 col-sm-8 col-md-8 col-lg-6 offset-sm-2 offset-md-2 offset-lg-3">

						<!-- optional class: .form-control-pill -->
						<form class="bs-validate p-5 rounded shadow-xs" novalidate
							method="post" action="${contextPath}/member/addMember.do"
							data-error-toast-text="<i class='fi fi-circle-spin fi-spin float-start'></i> Please, complete all required fields!"
							data-error-toast-delay="3000"
							data-error-toast-position="top-right">


							<!--
								<p class="text-danger">
									Ups! Please check again
								</p>
								-->


							<div class="form-label-group mb-3">
								<input required placeholder="member_id" id="member_id"
											value="${memberInfo.member_id }" name="member_id"
											type="hidden" class="form-control" readonly>
							</div>

							<div class="input-group-over">
								<div class="form-label-group mb-3">
									<input required placeholder="Password" name="password"
													id="password_check1" value="${memberInfo.password }"
													type="hidden" class="form-control" readonly>
								</div>
								
								<div class="input-group-over">
									<div class="form-label-group mb-3">
										<input required placeholder="Password_check"
														name="Password_check" id="password_check2"
														value="${memberInfo.password }" type="hidden"
														class="form-control">
									</div>
									
									<input required placeholder="member_status" id="member_status"
											value="구글" name="member_status"
											type="hidden" class="form-control" readonly>
									
									
									<div class="form-label-group mb-3">
										<input required placeholder="Member Name" id="member_name"
														value="${memberInfo.member_name }" name="member_name"
														type="text" class="form-control" readonly> <label
														for="member_name">이름</label>
									</div>

									<div class="form-label-group mb-3">
										<input required placeholder="Email" id="email"
														value="${memberInfo.email }" name="email" type="text"
														label="아이디" class="form-control"
														style="margin-bottom: 0; display: inline-block" readonly>
													<label for="email">이메일</label>
									</div>

									<div class="form-label-group mb-3">
										<input required placeholder="Phone" id="phone" name="phone"
											type="tel" class="form-control"> <label for="phone">휴대폰
											번호</label>
									</div>

									<div class="form-label-group mb-3">
										<input required placeholder="Address" id="zipNo"
											name="zipNo" type="number" class="form-control"> <label
											for="zipNo">우편번호</label>
										<a href="javascript:execDaumPostcode()">우편번호검색</a>
									</div>

									<div class="form-label-group mb-3">
										<input required placeholder="Address" id="load_address"
											name="load_address" type="text" class="form-control"> <label
											for="load_address">도로명 주소</label>

									</div>

								</div>
								<div class="form-label-group mb-3">
									<input required placeholder="Address" id="jibun_address"
										name="jibun_address" type="text" class="form-control"> <label
										for="jibun_address">지번 주소</label>

								</div>

								<div class="form-label-group mb-3">
									<input required placeholder="Address" id="rest_address"
										name="rest_address" type="text" class="form-control"> <label
										for="rest_address">나머지 주소</label>

								</div>
								<div class="form-label-group mb-3">
									<input required placeholder="Birthday" id="birthday"
										name="birthday" type="date" class="form-control"> <label
										for="birthday">생년월일</label>
								</div>

							</div>


							<!-- GDPR CONSENT -->
							<div class="clearfix bg-light position-relative rounded p-4 mb-4">


								<label class="form-checkbox form-checkbox-primary"> <input
									required type="checkbox" name="checkbox"> <i></i> <span>
										본인은 만 14세 이상이며, <a href="page-terms-and-conditions.html"
										target="_blank">이용약관</a> 내용을 확인하였으며 이에 동의합니다.
								</span>
								</label>

							</div>
							<!-- /GDPR CONSENT -->

							<div class="row">

								<div class="col-12">
									<button type="submit" class="btn btn-primary btn-block" onClick = "fn_join_member()">
										가입하기</button>

								</div>
							</div>

						</form>

					</div>

				</div>


			</div>
		</section>
		<!-- /FORM -->

