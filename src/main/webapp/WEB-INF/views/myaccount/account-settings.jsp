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
<c:if test='${not empty message }'>
	<script>
		alert('${message}');
	</script>
</c:if>

<c:if test='${not empty shipMessage }'>
	<script>
		alert('${shipMessage}');
	</script>
</c:if>
<body>
	<div id="wrapper">

		<!-- PAGE TITLE -->
		<section class="bg-light p-0">
			<div class="container py-5">

				<h1 class="h3">마이 페이지</h1>

				<nav aria-label="breadcrumb">
					<ol class="breadcrumb fs--14">
						<li class="breadcrumb-item"><a
							href="${contextPath}/main/main.do">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">마이 페이지</li>
					</ol>
				</nav>

			</div>
		</section>
		<!-- /PAGE TITLE -->




		<!--container -->
		<section>
			<div class="container">

				<div class="row">
					<jsp:include page="/WEB-INF/views/myaccount/account-navi.jsp" />

					<div class="col-12 col-sm-12 col-md-12 col-lg-9">

						<!--
								
								Tab Navigation
								Last tab remembered using localstorage by sow.nav_deep.js plugin

							-->
						<ul class="nav nav-tabs">
							<li class="nav-item"><a
								class="nav-link nav-link-remember active" data-toggle="tab"
								href="#tab_account">계정</a></li>

							<li class="nav-item"><a class="nav-link nav-link-remember"
								data-toggle="tab" href="#tab_address">주소</a></li>
						</ul>



						<div class="tab-content">
							<!-- form 태그 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
							<!-- ACCOUNT TAB -->
							<div id="tab_account" class="tab-pane active">

								<form method="post" id="account"
									action="${contextPath}/myaccount/modifyMemberInfo.do"
									novalidate class="bs-validate" enctype="multipart/form-data">


									<!-- PERSONAL DETAIL -->
									<div class="p-4 shadow-xs border bt-0 mb-4 bg-white">

										<div class="row">

											<!-- avatar -->
											<div class="col-12 col-md-3 text-center">

												<!-- 
														Based on `SOW : File Upload` 
														
														For ajax:
														documentation/plugins-sow-file-upload.html 
													-->
												<label
													class="w--100 h--100 rounded text-center position-relative d-inline-block cursor-pointer  bg-white"
													style="background-image: url('${contextPath}/resources/images/grade_image/grade1.PNG')">

													<%--  <a href="#?action=remove_avatar"
													class="js-file-upload-avatar-ajax-circle-remove-preadded position-absolute bottom-0 mb--n15 w-100 z-index-3">
														<span
														class="d-inline-block btn btn-sm btn-pill bg-secondary text-white pt--4 pb--4 pl--10 pr--10"
														data-tooltip="tooltip" data-original-title="remove avatar">
															<i class="fi fi-close m-0"></i>
													</span> 
													</a> <!-- 
															preadded image 이미지++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
														--> <span
													class="z-index-2 js-file-input-avatar-ajax-circle-container-preadded d-block absolute-full z-index-1">
														<span						
														style="background-image: url('${contextPath}/resources/images/grade_image/grade1.PNG')"
														>
													</span>
												</span>  --%> <!-- 
															upload field (등급 나타내는 곳)
														--> <!-- 사진 삽입 --> <!-- <input name="account_avatar"
													type="file" data-file-ext="jpg, png"
													data-file-max-size-kb-per-file="5000"
													data-file-ext-err-msg="Allowed:"
													data-file-size-err-item-msg="File too large!"
													data-file-size-err-total-msg="Total allowed size exceeded!"
													data-file-toast-position="bottom-center"
													data-file-preview-container=".js-file-input-avatar-ajax-circle-container-preadded"
													data-file-preview-show-info="false"
													data-file-preview-class="rounded-circle m-0 p-0 animate-bouncein"
													data-file-preview-img-height="118"
													data-file-btn-clear="a.js-file-upload-avatar-ajax-circle-remove-preadded"
													data-file-preview-img-cover="true"
													class="custom-file-input absolute-full"> avatar : : always under image
													<svg class="fill-gray-600 rounded-circle z-index-0 m-4"
														viewBox="0 0 60 60">
															<path
															d="M41.014,45.389l-9.553-4.776C30.56,40.162,30,39.256,30,38.248v-3.381c0.229-0.28,0.47-0.599,0.719-0.951c1.239-1.75,2.232-3.698,2.954-5.799C35.084,27.47,36,26.075,36,24.5v-4c0-0.963-0.36-1.896-1-2.625v-5.319c0.056-0.55,0.276-3.824-2.092-6.525C30.854,3.688,27.521,2.5,23,2.5s-7.854,1.188-9.908,3.53c-2.368,2.701-2.148,5.976-2.092,6.525v5.319c-0.64,0.729-1,1.662-1,2.625v4c0,1.217,0.553,2.352,1.497,3.109c0.916,3.627,2.833,6.36,3.503,7.237v3.309c0,0.968-0.528,1.856-1.377,2.32l-8.921,4.866C1.801,46.924,0,49.958,0,53.262V57.5h46v-4.043C46,50.018,44.089,46.927,41.014,45.389z" />
															<path
															d="M55.467,46.526l-9.723-4.21c-0.23-0.115-0.485-0.396-0.704-0.771l6.525-0.005c0,0,0.377,0.037,0.962,0.037c1.073,0,2.638-0.122,4-0.707c0.817-0.352,1.425-1.047,1.669-1.907c0.246-0.868,0.09-1.787-0.426-2.523c-1.865-2.654-6.218-9.589-6.354-16.623c-0.003-0.121-0.397-12.083-12.21-12.18c-1.187,0.01-2.309,0.156-3.372,0.413c0.792,2.094,0.719,3.968,0.665,4.576v4.733c0.648,0.922,1,2.017,1,3.141v4c0,1.907-1.004,3.672-2.607,4.662c-0.748,2.022-1.738,3.911-2.949,5.621c-0.15,0.213-0.298,0.414-0.443,0.604v2.86c0,0.442,0.236,0.825,0.631,1.022l9.553,4.776c3.587,1.794,5.815,5.399,5.815,9.41V57.5H60v-3.697C60,50.711,58.282,47.933,55.467,46.526z" />
														</svg> -->

												</label>
												<p style="margin-bottom color: purple">회원등급</p>
											</div>

											<!-- /avatar -->


											<!-- detail -->
											<div class="col">

												<div class="row">

													<div class="col-12 col-sm-6 col-md-6">

														<div class="form-label-group mb-3">
															<input required placeholder="member_id" id="member_id"
																name="member_id" type="text" class="form-control"
																value="${memberinfo.member_id}" readonly> <label
																for="account_first_name">아이디</label>
														</div>

													</div>

													<div class="col-12 col-sm-6 col-md-6">

														<div class="form-label-group mb-3">
															<input required placeholder="member_name"
																id="member_name" name="member_name" type="text"
																class="form-control" value="${memberinfo.member_name}">
															<label for="account_last_name">이름</label>
														</div>

													</div>



													<div class="col-12 col-sm-6 col-md-6">


														<div class="form-label-group mb-6">
															<input required placeholder="email" id="email"
																name="email" type="text" class="form-control"
																value="${memberinfo.email}"> <label for="email">이메일</label>
														</div>

														<div id="email_edit_info"
															class="mt-1 mb-4 fs--13 text-muted hide">
															<!--(일단 보류) A confirmation link will be sent to current email address -->
														</div>
														<!-- /EMAIL ADDRESS -->

													</div>


													<div class="col-12 col-sm-6 col-md-6">

														<div class="form-label-group mb-3">
															<input required placeholder="phone" id="phone"
																name="phone" type="text" class="form-control"
																value="${memberinfo.phone}"> <label for="phone">휴대폰
																번호</label>
														</div>

													</div>

												</div>




											</div>
											<!-- detail -->

										</div>

										<!-- subscribe -->
										<div class="border-top pt-4 mt-4">
											<label class="form-checkbox form-checkbox-primary mb-0">
												<input type="checkbox" name="user_newsletter_accept"
												value="1"> <i></i> 뉴스 및 독점 제안에 대한 최신 정보를 받음
											</label>
										</div>

									</div>
									<!-- /PERSONAL DETAIL -->



									<!-- PASSWORD -->
									<div class="p-4 shadow-xs rounded mb-4 bg-white">

										<a href="#user_edit_password"
											class="btn-toggle btn fs--14 btn-light collapsed"
											data-toggle="collapse" aria-expanded="false"
											onclick="jQuery('#user_password_current, #user_password_new').val('');">
											<span class="group-icon float-start"> <i
												class="fi fi-arrow-down"></i> <i class="fi fi-close"></i>
										</span> &nbsp; 비밀번호 변경
										</a>

										<div id="user_edit_password" class="collapse" style="">

											<div class="row mt-3">

												<div class="col-12 col-sm-6 col-md-6">

													<div class="input-group-over">
														<div class="form-label-group mb-3">
															<input placeholder="Current Password"
																id="account_current_password"
																name="account_current_password" type="password"
																class="form-control" value="${memberinfo.password}">
															<label for="account_current_password">현재 비밀번호</label>
														</div>

														<!-- `SOW : Form Advanced` plugin used -->
														<a href="account_current_password"
															class="btn fs--12 btn-password-type-toggle"
															data-target="#account_current_password"> <span
															class="group-icon"> <i class="fi fi-eye m-0"></i>
																<i class="fi fi-close m-0"></i>
														</span>
														</a>
													</div>

												</div>

												<div class="col-12 col-sm-6 col-md-6">

													<div class="input-group-over">
														<div class="form-label-group mb-3">
															<input placeholder="New Password" id="password"
																name="password" type="password" class="form-control"
																value="${memberinfo.password}"> <label
																for="password">새 비밀번호</label>
														</div>

														<!-- `SOW : Form Advanced` plugin used -->
														<a href="#" class="btn fs--12 btn-password-type-toggle"
															data-target="#account_new_password"> <span
															class="group-icon"> <i class="fi fi-eye m-0"></i>
																<i class="fi fi-close m-0"></i>
														</span>
														</a>
													</div>

												</div>

											</div>

										</div>

									</div>
									<!-- /PASSWORD -->

									<div class="border-top pt-4 mt-1">

										<button type="submit" class="btn btn-purple fs--20"
											onclick="saveChanges()">
											<i class="fi fi-check "></i> 변경사항 저장
										</button>
									</div>

									<script>
										function saveChanges() {
											const result = confirm("변경되었습니다");
											/* swal("변경되었습니다","계정 수정 성공", "success");  
											swal({
												title: "변경되었습니다!",
												text: "계정 정보 수정 완료되었습니다.",
												type: "success",
												timer: 100000
											}); */
										}
									</script>
								</form>
								<!-- form 태그 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

							</div>

							<!-- ADDRESSES TAB ++++++++++++++++++++++++++++++++++배송 주소(주소탭)+++++++++++++++++++++++++++++-->
							<div id="tab_address" class="tab-pane border bt-0 p-4 shadow-xs">

								<h3 class="h5 clearfix mb-3 mt-3">

									<a href="#"
										data-href="${contextPath}/resources/_ajax/modal_address_add.jsp"
										data-ajax-modal-size="modal-md"
										data-ajax-modal-centered="false"
										data-ajax-modal-backdrop="static"
										class="js-ajax-modal float-end btn btn-sm btn-primary fs--14 mb-0">
										새 배송지 추가 </a> <span class="float-start mt-2"> <span
										class="text-primary">배송</span> 주소
									</span>

								</h3>



								<!-- address -->
								<div class="d-block shadow-xs rounded p-4 mb-2">
									<div class="row">

										<div class="col">

											<p class="mb-0">
												<b>우편번호 :</b> &nbsp;&nbsp; <b>${memberinfo.zipNo}</b>
											</p>
											<p class="mb-0">
												<b>도로명 주소 :</b> &nbsp;&nbsp; <b>${memberinfo.load_address}</b>
											</p>
											<p class="mb-0">
												<b>지번 주소 :</b> &nbsp;&nbsp; <b>${memberinfo.jibun_address}</b>
											</p>
											<p class="mb-0">
												<b>나머지 주소 :</b> &nbsp;&nbsp; <b>${memberinfo.rest_address}</b>
											</p>


											<p class="mb-0 mt-2 text-success" style = "text-align: center; font:bold 30px;">
												<!-- <i class="fi fi-check"> --></i> &nbsp; 기본 배송지
											</p>

										</div>

										<div class="col-4 col-sm-3 col-md-3 col-lg-2">

											<a href="#" name="member_id" id="member_id"
												value="${memberinfo.member_id}"
												data-href="${contextPath}/resources/_ajax/modal_address.jsp"
												data-ajax-modal-size="modal-md"
												data-ajax-modal-centered="false"
												data-ajax-modal-backdrop="static"
												class="js-ajax-modal float-end btn btn-sm btn-block btn-light fs--14 mb-0">
												수정 </a><!--  <a href="#" data-href="#?action=delete&amp;item_id=1"
												data-ajax-confirm-mode="regular"
												data-ajax-confirm-size="modal-md"
												data-ajax-confirm-centered="false"
												data-ajax-confirm-title="확인해주세요"
												data-ajax-confirm-body="확실합니까? 배송지에서 제거하시겠습니까??"
												data-ajax-confirm-btn-yes-class="btn-sm btn-danger"
												data-ajax-confirm-btn-yes-text="제거"
												data-ajax-confirm-btn-yes-icon="fi fi-check"
												data-ajax-confirm-btn-no-class="btn-sm btn-light"
												data-ajax-confirm-btn-no-text="취소"
												data-ajax-confirm-btn-no-icon="fi fi-close"
												class="js-ajax-confirm float-end btn btn-sm btn-block btn-light fs--14 mb-0 mt-2">
												삭제 </a> -->

										</div>
									</div>
								</div>
								<!-- /address -->



								<!-- address -->
								<c:forEach var="shippList" items="${shippList}">

									<div class="d-block shadow-xs rounded p-4 mb-2">
										<div class="row">

											<div class="col">

												<p class="mb-0" id = "zipNo" name = "zipNo">
													<b>우편번호 :</b> &nbsp;&nbsp; <b>${shippList.zipNo}</b>
												</p>
												<p class="mb-0"  id = "load_address" name = "load_address" >
													<b>도로명 주소 :</b> &nbsp;&nbsp; <b>${shippList.load_address}</b>
												</p>
												<p class="mb-0"  id = "jibun_address" name = "jibun_address">
													<b>지번 주소 :</b> &nbsp;&nbsp; <b>${shippList.jibun_address}</b>
												</p>
												<p class="mb-0"  id = "rest_address" name = "rest_address" >
													<b>나머지 주소 :</b> &nbsp;&nbsp; <b>${shippList.rest_address}</b>
												</p>
												
												<p class="mb-0 mt-3">
													<a href="${contextPath}/myaccount/defaultShippingPoint.do" class="btn btn-sm btn-light active">
														<i class="fi fi-check"></i> 
														기본 배송지
													</a>
												</p>
												

											</div>

											

											<div class="col-4 col-sm-3 col-md-3 col-lg-2">

												<a href="#"
													data-href="${contextPath}/resources/_ajax/modal_address_add.jsp"
													data-ajax-modal-size="modal-md"
													data-ajax-modal-centered="false"
													data-ajax-modal-backdrop="static"
													class="js-ajax-modal float-end btn btn-sm btn-block btn-light fs--14 mb-0">
													수정 </a>
													 <a href="${contextPath}/myaccount/deleteShipping.do?zipNo=${shippList.zipNo}"
													data-ajax-confirm-mode="regular"
													data-ajax-confirm-size="modal-md"
													data-ajax-confirm-centered="false"
													data-ajax-confirm-title="확인해주세요"
													data-ajax-confirm-body="확실합니까? 배송지에서 제거하시겠습니까??"
													data-ajax-confirm-btn-yes-class="btn-sm btn-danger"
													data-ajax-confirm-btn-yes-text="제거"
													data-ajax-confirm-btn-yes-icon="fi fi-check"
													data-ajax-confirm-btn-no-class="btn-sm btn-light"
													data-ajax-confirm-btn-no-text="취소"
													data-ajax-confirm-btn-no-icon="fi fi-close"
													data-ajax-confirm-callback-function=""
													class="js-ajax-confirm float-end btn btn-sm btn-block btn-light fs--14 mb-0 mt-2"
													>
													삭제 </a>
													
											</div>
										</div>
									</div>
								</c:forEach>
								<!-- /address -->

							</div>
						</div>
					</div>
				</div>


				<!-- 계정 삭제 -->
				<jsp:include page="account-delete.jsp" flush="true">
					<jsp:param value="account-delete" name="account-delete" />
				</jsp:include>
			</div>
		</section>
		<!-- / -->



		<!-- INFO BOX(밑) -->
		<section class="bg-light py-0">
			<div class="container py-3">

				<div class="row">

					<div class="col-6 col-lg-3 p--15 d-flex d-block-xs text-center-xs">

						<div class="pl--10 pr--20 fs--50 line-height-1 pt--6">
							<img width="60" height="60"
								src="${contextPath}/resources/demo.files/svg/ecommerce/money_bag.svg"
								alt="...">
						</div>

						<div class="my-2">

							<h2 class="font-weight-medium fs--20 mb-0">최저가 보장</h2>

							<p class="m-0">30-days money back</p>

						</div>

					</div>

					<div
						class="col-6 col-lg-3 p--15 d-flex d-block-xs text-center-xs border-dashed border-light bw--1 bt-0 br-0 bb-0 b--0-lg">

						<div class="pl--10 pr--20 fs--50 line-height-1 pt--6">
							<img width="60" height="60"
								src="${contextPath}/resources/demo.files/svg/ecommerce/free-delivery-truck.svg"
								alt="...">
						</div>

						<div class="my-2">

							<h2 class="font-weight-medium fs--20 mb-0">무료배송</h2>

							<p class="m-0">Shipping is on us</p>

						</div>

					</div>

					<div
						class="col-6 col-lg-3 p--15 d-flex d-block-xs text-center-xs border-dashed border-light bw--1 bl-0 br-0 bb-0 b--0-lg">

						<div class="pl--10 pr--20 fs--50 line-height-1 pt--6">
							<img width="60" height="60"
								src="${contextPath}/resources/demo.files/svg/ecommerce/24-hours-phone-service.svg"
								alt="...">
						</div>

						<div class="my-2">

							<h2 class="font-weight-medium fs--20 mb-0">고객센터</h2>

							<p class="m-0">24/24 available</p>

						</div>

					</div>

					<div
						class="col-6 col-lg-3 p--15 d-flex d-block-xs text-center-xs border-dashed border-light bw--1 bb-0 br-0 b--0-lg">

						<div class="pl--10 pr--20 fs--50 line-height-1 pt--6">
							<img width="60" height="60"
								src="${contextPath}/resources/demo.files/svg/ecommerce/handshake.svg"
								alt="...">
						</div>

						<div class="my-2">

							<h2 class="font-weight-medium fs--20 mb-0">품질보장</h2>

							<p class="m-0">Quality guaranteed</p>

						</div>

					</div>

				</div>

			</div>
		</section>
		<!-- /INFO BOX -->


	</div>
	<!-- /#wrapper -->


	<!-- 
			SHOP AJAX MODAL : ON LOAD 

			Note: #onload_modal_shop is also used inside the modal
			for the button "stop showing" to set a cookie!
		-->
	<div id="onload_modal_shop" class="hide js-onload js-ajax-modal"
		data-href="${contextPath}/resources/_ajax/modal_shop.html"
		data-ajax-modal-delay="3000" data-ajax-modal-size="modal-lg"
		data-ajax-modal-centered="true" data-ajax-modal-backdrop=""></div>


	<script src="${contextPath}/resources/assets/js/core.min.js"></script>