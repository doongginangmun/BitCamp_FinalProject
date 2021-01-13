<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="order" value="${orderMap.order}" />
<c:set var="product" value="${orderMap.product}" />
<%
	request.setCharacterEncoding("UTF-8");
%>


<!-- PAGE TITLE -->
<section class="bg-light p-0">
	<div class="container py-5">

		<h1 class="h3">주문 상세</h1>

		<nav aria-label="breadcrumb">
			<ol class="breadcrumb fs--14">
				<li class="breadcrumb-item"><a
					href="${contextPath }/main/main.do">Home</a></li>
				<li class="breadcrumb-item"><a
					href="${contextPath }/myaccount/account-orders.do">내 주문</a></li>
				<li class="breadcrumb-item active" aria-current="page">주문 상세</li>
			</ol>
		</nav>

	</div>
</section>
<!-- /PAGE TITLE -->




<!-- -->
<section>
	<div class="container">

		<div class="row">

			<!-- 네비게이션 자리 -->


			<div class="col-12 col-sm-12 col-md-12 col-lg-9">

				<!-- ORDER INFO -->
				<div class="p-4 shadow-xs border rounded mb-4">

					<div class="row">

						<div class="col-12 col-sm-6 col-md-6 col-lg-6">

							<h2 class="fs--18 mb-0">주문 # ${order.order_num }</h2>

							<p>${order.order_date }</p>

							<p class="mb-0">
								상태 :

								<c:choose>
									<c:when test="${order.order_status == '결제완료' }">
										<span class="text-warning">${order.order_status }</span>
									</c:when>
									<c:when test="${order.order_status == '배송완료' }">
										<span class="text-success">${order.order_status }</span>
									</c:when>
									<c:when test="${order.order_status == '주문취소' }">
										<span class="text-danger ">${order.order_status }</span>
									</c:when>
								</c:choose>
							</p>

						</div>


						<div class="col-12 col-sm-6 col-md-6 col-lg-6">

							<a href="#"
								data-href="?order_status=주문취소&order_num=${order.order_num }"
								data-ajax-confirm-mode="regular"
								data-ajax-confirm-size="modal-md"
								data-ajax-confirm-centered="false"
								data-ajax-confirm-title="Please Confirm"
								data-ajax-confirm-body="정말로 주문을 취소하시겠습니까??"
								data-ajax-confirm-btn-yes-class="btn-sm btn-danger"
								data-ajax-confirm-btn-yes-text="네"
								data-ajax-confirm-btn-yes-icon="fi fi-check"
								data-ajax-confirm-btn-no-class="btn-sm btn-light"
								data-ajax-confirm-btn-no-text="아니오"
								data-ajax-confirm-btn-no-icon="fi fi-close"
								class="js-ajax-confirm float-end float-none-xs m-0 btn btn-sm btn-light fs--14 mb-0 mt-2">

								주문 취소하기 <!-- 											
											<span class="text-muted fs--12 d-block">
												29 min. remaining
											</span> -->

							</a>

						</div>

					</div>

				</div>
				<!-- /ORDER INFO -->



				<!-- ORDER PERSONAL DETAIL -->
				<div class="p-4 shadow-xs rounded mb-4">

					<div class="row row-grid b-0">


						<div class="col-12 col-sm-6 col-md-4 col-lg-6">

							<div class="px-3 pb-3">

								<h6 class="mb-4 mt-2 text-primary">
									배송 <span class="font-weight-normal">정보</span>
								</h6>

								<label class="text-dark d-block m-0">주문자 이름</label>
								<p>
									${order.member_name } <span class="d-block fs--13 text-muted">(${order.phone })</span>
								</p>


								<label class="text-dark d-block m-0">주소</label>
								<p>
									${order.zipNo } <br> ${order.address }
								</p>

								<label class="text-dark d-block m-0">이메일</label>
								<p>${order.email }</p>

							</div>

						</div>

						<div class="col-12 col-sm-12 col-md-4 col-lg-6 br-0">

							<div class="px-3 pb-3">

								<h6 class="mt-2 text-primary">거래 정보</h6>

								<!-- not needed/required -->
								<!--
											<div class="mt-3">
												<span class="d-block text-muted">Name:</span>
												John Doe
											</div>
											-->

								<div class="mt-3">
									<label class="text-dark d-block m-0">카드사 승인번호:</label> <span
										class="text-muted">${order.apply_num }</span>
								</div>

								<div class="mt-3">
									<label class="text-dark d-block m-0">결제 승인시각:</label> <span
										class="text-muted">${order.paid_at }</span>
								</div>

								<div class="mt-3">
									<label class="text-dark d-block m-0">결제방법:</label> <span
										class="text-muted">${order.pg} </span>
								</div>


							</div>

						</div>


					</div>

					<div class="text-muted mt-4">
						<span class="font-weight-medium">요청사항:</span>

						${order.delivery_request }

					</div>
					<!-- customer detail -->

				</div>
				<!-- /ORDER PERSONAL DETAIL -->



				<!-- ITEMS -->
				<div class="p-4 shadow-xs rounded mb-4">

					<c:forEach var="item" items="${product}" varStatus="cnt">

						<!-- item -->
						<div class="row">

							<div class="col-3 col-sm-2 col-md-2 col-lg-2 text-center">

								<a class="d-block clearfix"
									href="${contextPath}/product/productDetail.do?product_id=${item.product_id}">
									<img class="img-fluid"
									src="${contextPath}/resources/images/product/${item.product_id }/${item.product_image}"
									alt="...">
								</a>

							</div>

							<div class="col">

								<div class="row">
									<div class="col">

										<a class="d-block clearfix"
											href="${contextPath}/product/productDetail.do?product_id=${item.product_id}">
											${item.product_name } </a> <span
											class="d-block text-muted fs--13">${item.option_name }
											x ${item.quantity }</span>

									</div>

									<div class="col-12 col-md-3 text-align-end text-start-xs">
										${item.price - item.sale_price } 원

										<del class="text-muted d-block fs--14"> ${item.price } 원
										</del>
									</div>

									<div class="col-12 col-md-2 text-align-end text-start-xs">
										x ${item.quantity }</div>

									<div class="col-12 col-md-3 text-align-end text-start-xs">
										${(item.price-item.sale_price)*item.quantity }원</div>

								</div>

							</div>
						</div>
						<!-- /item -->
					</c:forEach>


					<hr>




					<div class="row">
						<div
							class="offset-sm-6 offset-md-6 offset-lg-7 col-12 col-sm-6 col-md-6 col-lg-5">

							<div class="clearfix">
								배송비: <span class="float-end text-align-end"> 3500 원 </span>
							</div>

							<hr>

							<div class="clearfix">
								<h5 class="float-start">총합:</h5>
								<h5 class="float-end">${order.totalPrice }원</h5>
							</div>

						</div>
					</div>




				</div>
				<!-- /ITEMS -->



			</div>

		</div>

	</div>
</section>
<!-- / -->
<script src="${contextPath}/resources/assets/js/core.min.js"></script>