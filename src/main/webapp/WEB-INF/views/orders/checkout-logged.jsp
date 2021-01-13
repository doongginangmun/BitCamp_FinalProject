<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="myCartList" value="${cartMap.myCartList}" />
<c:set var="myProductList" value="${cartMap.myProductList}" />
<c:set var="total_price" value="0" />
<c:set var="shipping" value="3500" />
<c:set var="total_discount" value="0" />
<%
	request.setCharacterEncoding("UTF-8");
%>


<!-- PAGE TITLE -->
<section class="bg-light p-0">
	<div class="container py-5">

		<h1 class="h3">주문하기</h1>

		<nav aria-label="breadcrumb">
			<ol class="breadcrumb fs--14">
				<li class="breadcrumb-item"><a href="shop-page-checkout.html"><b>NOT
							LOGGED</b></a></li>
				<li class="breadcrumb-item"><a
					href="shop-page-checkout-logged.html">LOGGED</a></li>
			</ol>
		</nav>

	</div>
</section>
<!-- /PAGE TITLE -->





<form method="post" action="${contextPath }/orders/import.do"
	name="OrderVO">
	<!-- CHECKOUT -->
	<section>
		<div class="container">

			<div class="row">

				<div class="col-12 col-lg-7 col-xl-6 order-2 order-lg-1">


					<!-- LOGGED IN -->
					<div class="bg-light p-3 rounded mb-5">

						<div class="d-flex">

							<div>

								<!--
											<span class="bg-primary-soft h5 m-0 w--60 h--60 rounded-circle d-inline-flex justify-content-center align-items-center">
												JD
											</span>
											-->

								<span class="w--60 h--60 rounded-circle d-inline-block bg-cover"
									style="background-image:url('${contextPath}/resources/images/fvc.svg')"></span>
							</div>

							<div class="w-100 px-3 py-2">
								<span class="d-block "> ${memberInfo.member_name }(${memberInfo.email })</span>
								<input name="email" type="hidden" value="${memberInfo.email }">
								<a href="${contextPath}/member/logout.do" class="fs--14">
									로그아웃 </a>
							</div>

						</div>

						<div class="border-top pt-3 mt-2"></div>

					</div>
					<!-- /LOGGED IN -->




					<!-- SHIPPING ADDRESS -->
					<h2 class="h5 mb-4">
						배송정보 <span class="d-block fs--14 text-success font-weight-normal">
							상품을 보내실 장소의 주소를 기입해주세요 </span>
					</h2>
					<div class="p-4 shadow-xs border rounded mb-5">

						<select class="form-control bs-select"
							name="shipping_address_selected">
							<option value="1">${memberInfo.load_address }/
								${memberInfo.rest_address }</option>
						</select>

						<div class="pt-2">
							<a href="#shipping_address_edit" data-toggle="collapse"
								class="text-decoration-none d-block py-1"> <span
								class="group-icon"> <i class="fi fi-pencil"></i> <i
									class="fi fi-arrow-up"></i>
							</span> <span class="d-inline-block pl-2 pr-2"> 배송정보 수정하기 </span>
							</a>
						</div>


						<div id="shipping_address_edit" class="collapse">
							<div class="row mt-3">

								<div class="col-12 col-sm-6 col-lg-6">

									<div class="form-label-group mb-3">
										<input required placeholder="First Name"
											id="shipping_first_name" name="member_name" type="text"
											value="${memberInfo.member_name}" class="form-control">
										<label for="shipping_first_name">주문자 성명</label>
									</div>

								</div>



								<div class="col-12 col-sm-6 col-lg-12 mb--20">

									<div class="form-label-group mb-3">
										<input placeholder="Phone Number" id="shipping_phone"
											value="${memberInfo.phone}" name="phone" type="text"
											class="form-control"> <label for="shipping_phone">휴대전화</label>
									</div>

								</div>


								<div class="col-12 col-sm-12 col-lg-12 mb--10">

									<div class="form-label-group mb-3">
										<input required placeholder="Address" id="zipNo" name="zipNo"
											value="${memberInfo.zipNo}" type="number"
											class="form-control"> <label for="zipNo">우편번호</label>
										<a href="javascript:execDaumPostcode()">우편번호검색</a>
									</div>


									<div class="form-label-group mb-3">
										<input required placeholder="Address" id="load_address"
											value="${memberInfo.load_address}" name="load_address"
											type="text" class="form-control"> <label
											for="load_address">도로명 주소</label>

									</div>


									<div class="form-label-group mb-3">
										<input required placeholder="Address" id="rest_address"
											value="${memberInfo.rest_address}" name="rest_address"
											type="text" class="form-control"> <label
											for="rest_address">나머지 주소</label>
									</div>
								</div>


							</div>

						</div>

					</div>
					<!-- /SHIPPING ADDRESS -->


					<!-- PAYMENT METHOD -->
					<h2 class="h5 mb-4">결제수단</h2>

					<div class="form-advanced-list p-4 shadow-xs border rounded mb-5">

						<label
							class="form-radio form-radio-primary d-block py-3 border-bottom">
							<input type="radio" name="pg" value="html5_inicis"
							class="form-advanced-list-reveal"
							data-form-advanced-target="#payment_card_form"> <i></i>
							신용카드 <span class="float-end mt--n3 ml--n10 mr--n10"> <img
								src="${contextPath}/resources/assets/images/credit_card/visa.svg"
								width="38" height="24" alt="cc"> <img
								src="${contextPath}/resources/assets/images/credit_card/mastercard.svg"
								width="38" height="24" alt="cc"> <span
								class="fs--11 d-block text-align-end">and more...</span>
						</span>

						</label> <label
							class="form-radio form-radio-primary d-block py-3 border-bottom">
							<input type="radio" name="pg" value="kakaopay"
							class="form-advanced-list-reveal"
							data-form-advanced-target="#paypal_expand"> <i></i> 카카오페이
						</label>

						<!-- paypal info -->
						<div id="paypal_expand"
							class="form-advanced-list-reveal-item hide text-center">


							<p>※ 카카오페이 결제는 결제 시 결제하신 수단으로만 환불되는 점 양해부탁드립니다.</p>

						</div>
						<!-- /paypal info -->

					</div>
					<!-- /PAYMENT METHOD -->




					<!-- CUSTOMER NOTE -->
					<h2 class="h5 mb-4">
						요청사항 <span class="d-block fs--14 text-muted font-weight-normal">
							배송 시 요청사항을 입력해주세요 </span>
					</h2>

					<div class="form-label-group mb-5">
						<textarea name="delivery_request"
							placeholder="Leave us a note about this order (optional)"
							id="description" class="form-control" rows="3"></textarea>
						<label for="description">배송 요청사항을 입력하세요 (옵션)</label>
					</div>
					<!-- /CUSTOMER NOTE -->



					<!-- AGREE TERMS -->
					<label class="form-checkbox form-checkbox-primary d-block">
						<input required type="checkbox" name="checkbox"> <i></i> <a
						href="#!" target="_blank">약관</a>에 동의합니다.
					</label>


					<!-- COMPLETE ORDER -->
					<div class="clearfix text-center-xs mt--60">

						<div class="float-end ml-0 mr-0 float-none-xs mb-4">
							<button type="submit"
								class="btn btn-primary btn-shadow btn-lg block-xs fs--16 py-3 pl--15 pr--15 ">
								<span> <i class="fi fi-check"></i>
								</span>&nbsp; 결제하기
							</button>
						</div>

						<div class="pt-4 mb-4">
							<a href="${contextPath }/cart/myCartList.do"
								class="fs--15 text-decoration-none"> <i
								class="fi fi-arrow-start-slim"></i> 장바구니로 돌아가기
							</a>
						</div>

					</div>
					<!-- /COMPLETE ORDER -->



				</div>



				<!-- SUMMARY COLUMN -->
				<div class="col-12 col-lg-5 col-xl-6 order-1 order-lg-2">

					<div class="sticky-kit">
						<div class="shadow-xs border rounded p-4 mb-5">

							<!-- PRODUCT -->
							<c:forEach var="item" items="${myProductList}" varStatus="cnt">
								<c:set var="cart_product_qty"
									value="${myProductList[cnt.count-1].quantity}" />
								<c:set var="cart_id"
									value="${myProductList[cnt.count-1].cart_id}" />
								<c:set var="product_price"
									value="${myProductList[cnt.count-1].option_price}" />
								<c:set var="product_discount"
									value="${myProductList[cnt.count-1].discount}" />
								<c:set var="product_image"
									value="${myProductList[cnt.count-1].product_image}" />
								<c:set var="product_index" value="${cnt.index}" />
								<c:set var="product_stock"
									value="${myProductList[cnt.count-1].stock}" />
								<c:set var="total_price"
									value="${total_price+((product_price-product_discount)*cart_product_qty)}" />
								<c:set var="total_discount"
									value="${total_discount+(cart_product_qty*product_discount)}" />




								<!-- item -->
								<div
									class="d-flex justify-content-center align-items-center border-bottom py-3">

									<div class="w--100">
										<img class="img-fluid max-h-80"
										src="${contextPath}/resources/images/product/${item.product_id }/${product_image}"
											alt="...">
									</div>

									<div class="w-100 pl-3 pr-3">

										<div class="float-end">
											<p class="fs--13 text-weight-muted mb-0">
												<del>${item.option_price*cart_product_qty} 원</del>
											</p>
											<p class="fs--16 font-weight-medium mb-0">${(item.option_price-product_discount)*cart_product_qty}
												원</p>
										</div>

										<h6>${item.product_name } ${item.option_name } x
											${cart_product_qty}</h6>

									</div>
								</div>
								<!-- /item -->
							</c:forEach>


							<!-- summary -->
							<div class="border-bottom pb-3 mb-3 mt-3 px-3">

								<div class="clearfix">
									가격: <span class="float-end font-weight-medium">
										${total_price} 원 </span>
								</div>

								<div class="clearfix">
									할인: <span class="float-end"> ${total_discount} 원 </span>
								</div>


								<div class="clearfix">
									배송비: <span class="float-end text-align-end"> ${shipping}
										원 </span>
								</div>

							</div>
							<!-- /summary -->



							<!-- total -->
							<div class="clearfix mb-3">
								<h3 class="h4-xs float-start">총합:</h3>
								<h3 class="h4-xs float-end">${total_price+shipping}원</h3>
								<input type="hidden" name="totalPrice" type="number"
									value="${total_price+shipping}">
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

					<li class="breadcrumb-item"><a href="#" target="_blank">Refund
							Policy</a></li>

					<li class="breadcrumb-item"><a href="#" target="_blank">Privacy
							Policy</a></li>

					<li class="breadcrumb-item"><a href="#" target="_blank">Terms
							of Service</a></li>

				</ol>
			</div>
			<!-- /ADDITIONAL LINKS -->


		</div>
	</section>
	<!-- /CHECKOUT -->
</form>

<script src="${contextPath}/resources/assets/js/core.min.js"></script>
<jsp:include page="/WEB-INF/views/common/daumZip.jsp" />

