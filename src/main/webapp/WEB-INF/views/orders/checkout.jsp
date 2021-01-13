<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("UTF-8");
%>


			<!-- PAGE TITLE -->
			<section class="bg-light p-0">
				<div class="container py-5">

					<h1 class="h3">
						주문하기
					</h1>

					<nav aria-label="breadcrumb">
						<ol class="breadcrumb fs--14">
							<li class="breadcrumb-item"><a href="shop-page-checkout.html"><b>NOT LOGGED</b></a></li>
							<li class="breadcrumb-item"><a href="shop-page-checkout-logged.html">LOGGED</a></li>
						</ol>
					</nav>

				</div>
			</section>
			<!-- /PAGE TITLE -->





			<!-- CHECKOUT -->
			<section>
				<div class="container">

					<div class="row">

						<div class="col-12 col-lg-7 col-xl-6 order-2 order-lg-1">

							<form method="post" action="${contextPath }/orders/import.do" name="OrderVO">
							<input type="hidden" name="totalPrice" type="number" value="10000">

								<!-- NOT LOGGED IN -->
								<div class="bg-light p-3 rounded mb-5">

									<div class="fs--12 mb-2">
										계정이 있으신가요?
										<a href="#" class="js-ajax-modal"
											data-href="_ajax/modal_signin_md.html"
											data-ajax-modal-size="modal-md"
											data-ajax-modal-centered="false"
											data-ajax-modal-backdrop="static">
											로그인하기
										</a>
									</div>

									<div class="form-label-group mb-3">
										<input required placeholder="Email Address" id="first_name" name="email" type="email" value="" class="form-control">
										<label for="first_name">이메일</label>
									</div>

									<div class="border-top pt-3 mt-2">

										<label class="form-checkbox form-checkbox-primary d-block">
											<input type="checkbox" name="checkbox" value="1">
											<i></i> 쩝쩝박사 구독하기
										</label>

									</div>

								</div>
								<!-- /NOT LOGGED IN -->




								<!-- SHIPPING ADDRESS -->
								<h2 class="h5 mb-4">
									배송정보
									<span class="d-block fs--14 text-success font-weight-normal">
										상품을 보내실 장소의 주소를 기입해주세요
									</span>
								</h2>
								<div class="p-4 shadow-xs border rounded mb-5">

									<div class="row">

										<div class="col-12 col-sm-6 col-lg-12">

											<div class="form-label-group mb-3">
												<input required placeholder="First Name" id="shipping_first_name" name="member_name" type="text" class="form-control">
												<label for="shipping_first_name">주문자 성명</label>
											</div>

										</div>
										


										<div class="col-12 col-sm-6 col-lg-12 mb--20">

											<div class="form-label-group mb-3">
												<input placeholder="Phone Number" id="shipping_phone" name="phone" type="text" class="form-control">
												<label for="shipping_phone">휴대전화</label>
											</div>

										</div>


										<div class="col-12 col-sm-12 col-lg-12 mb--10">

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
		
			
											<div class="form-label-group mb-3">
												<input required placeholder="Address" id="rest_address"
													name="rest_address" type="text" class="form-control"> <label
													for="rest_address">나머지 주소</label>
											</div>
										</div>



									</div>

								</div>
								<!-- /SHIPPING ADDRESS -->


								<!-- PAYMENT METHOD -->
								<h2 class="h5 mb-4">
									결제수단
									
								</h2>

								<div class="form-advanced-list p-4 shadow-xs border rounded mb-5">

<!-- 
									<label class="form-radio form-radio-primary d-block py-3 border-bottom">
										<input type="radio" name="payment_method" class="form-advanced-list-reveal" data-form-advanced-target="#bankdeposit_expand">
										<i></i> 무통장 입금
									</label>

									paypal info
									<div id="bankdeposit_expand" class="form-advanced-list-reveal-item hide p-4 rounded mt--n10 bg-light bt-0">

										은행명: 쩝쩝뱅크 <br>
										예금주: 쩝쩝이 <br>
										계좌 번호: 123-1234-123456

									</div>
									/paypal info

 -->
									<label class="form-radio form-radio-primary d-block py-3 border-bottom">
										<input type="radio" name="pg" value="html5_inicis" class="form-advanced-list-reveal" data-form-advanced-target="#payment_card_form">
										<i></i> 신용카드

										<span class="float-end mt--n3 ml--n10 mr--n10">
											<img src="${contextPath}/resources/assets/images/credit_card/visa.svg" width="38" height="24" alt="cc">
											<img src="${contextPath}/resources/assets/images/credit_card/mastercard.svg" width="38" height="24" alt="cc">
											<span class="fs--11 d-block text-align-end">and more...</span>
										</span>

									</label>


									<label class="form-radio form-radio-primary d-block py-3 border-bottom">
										<input type="radio" name="pg" value="kakaopay" class="form-advanced-list-reveal" data-form-advanced-target="#paypal_expand">
										<i></i> 카카오페이
									</label>

									<!-- paypal info -->
									<div id="paypal_expand" class="form-advanced-list-reveal-item hide text-center">

										<div class="my-5">
											<img width="150" src="demo.files/svg/vendors/vendor_paypal.svg" alt="...">
										</div>

										<p>
											After clicking "Complete Order", you will be redirected to complete your purchase securely.
										</p>

									</div>
									<!-- /paypal info -->

								</div>
								<!-- /PAYMENT METHOD -->




								<!-- CUSTOMER NOTE -->
								<h2 class="h5 mb-4">
									요청사항
									<span class="d-block fs--14 text-muted font-weight-normal">
										배송 시 요청사항을 입력해주세요
									</span>
								</h2>

								<div class="form-label-group mb-5">
									<textarea name="delivery_request" placeholder="Leave us a note about this order (optional)" id="description" class="form-control" rows="3"></textarea>
									<label for="description">배송 요청사항을 입력하세요 (옵션)</label>
								</div>
								<!-- /CUSTOMER NOTE -->



								<!-- AGREE TERMS -->
								<label class="form-checkbox form-checkbox-primary d-block">
									<input required type="checkbox" name="checkbox">
									<i></i> <a href="#!" target="_blank">약관</a>에 동의합니다.
								</label>


								<!-- COMPLETE ORDER -->
								<div class="clearfix text-center-xs mt--60">

									<div class="float-end ml-0 mr-0 float-none-xs mb-4">
										<button type="submit" class="btn btn-primary btn-shadow btn-lg block-xs fs--16 py-3 pl--15 pr--15 ">
											<span>
												<i class="fi fi-check"></i>
											</span>&nbsp;
											결제하기
										</button>
									</div>

									<div class="pt-4 mb-4">
										<a href="shop-page-cart-1.html" class="fs--15 text-decoration-none">
											<i class="fi fi-arrow-start-slim"></i>
											장바구니로 돌아가기
										</a>
									</div>

								</div>
								<!-- /COMPLETE ORDER -->


							</form>
						</div>



						<!-- SUMMARY COLUMN -->
						<div class="col-12 col-lg-5 col-xl-6 order-1 order-lg-2">

							<div class="sticky-kit">
								<div class="shadow-xs border rounded p-4 mb-5">


									<!-- item -->
									<div class="d-flex justify-content-center align-items-center border-bottom py-3">

										<div class="w--100">
											<img class="img-fluid max-h-80" src="demo.files/images/unsplash/products/thumb_330/barrett-ward-fYYUgvHYgpU-unsplash-min.jpg" alt="...">
										</div>

										<div class="w-100 pl-3 pr-3">
											
											<div class="float-end">
												<p class="fs--13 text-weight-muted mb-0">
													<del>$189.95</del>
												</p>
												<p class="fs--16 font-weight-medium mb-0"> 
													$158.95
												</p>
											</div>

											<h6>Product title here x 1</h6>

										</div>
									</div>
									<!-- /item -->



									<!-- summary -->
									<div class="border-bottom pb-3 mb-3 mt-3 px-3">
										
										<div class="clearfix">
											가격:
											<span class="float-end font-weight-medium">
												$158.95
											</span>
										</div>

										<div class="clearfix">
											할인:
											<span class="float-end">
											 $0
											</span>
										</div>


										<div class="clearfix">
											배송비:
											<span class="float-end text-align-end">
												<a href="#!" class="fs--14">calculate</a>
											</span>
										</div>

									</div>
									<!-- /summary -->



									<!-- total -->
									<div class="clearfix mb-3">
										<h3 class="h4-xs float-start">총합:</h3>
										<h3 class="h4-xs float-end">
											$158.95
										</h3>
									</div>
									<!-- /total -->


								</div>
							</div>

						</div>
						<!-- /SUMMARY COLUMN -->

					</div>







					<!-- ADDITIONAL LINKS -->
					<div class="border-top mt--100 pt-2">
						<ol class="breadcrumb bg-transparent px-0 m-0 fs--13">

							<li class="breadcrumb-item">
								<a href="#" target="_blank">Refund Policy</a>
							</li>

							<li class="breadcrumb-item">
								<a href="#" target="_blank">Privacy Policy</a>
							</li>

							<li class="breadcrumb-item">
								<a href="#" target="_blank">Terms of Service</a>
							</li>

						</ol>
					</div>
					<!-- /ADDITIONAL LINKS -->


				</div>
			</section>
			<!-- /CHECKOUT -->
			<script src="${contextPath}/resources/assets/js/core.min.js"></script>			
			<jsp:include page="/WEB-INF/views/common/daumZip.jsp" />
			
