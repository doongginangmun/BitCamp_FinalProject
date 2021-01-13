<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("UTF-8");
%>
	
			<!-- PAGE TITLE -->
			<section class="bg-light p-0" >
				<div class="container py-5">

					<h1 class="h3">내 주문</h1>

					<nav aria-label="breadcrumb">
						<ol class="breadcrumb fs--14">
							<li class="breadcrumb-item"><a href="${contextPath}/main/main.do">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">내 주문</li>
						</ol>
					</nav>

				</div>
			</section>
			<!-- /PAGE TITLE -->
			
			<c:choose>
				<c:when test="${empty orderList }">
				
					<div class="container" style="margin-top: 50px">

					<div class="row">
									<jsp:include page="/WEB-INF/views/myaccount/account-navi.jsp" />

						<div class="col-12 col-md-8 col-lg-9 order-md-1 mb-5" >

							<div class="text-center mb-5">
	
								<h1 class="mb--80">
									주문내역이 존재하지 않습니다.
								</h1>

								<img class="img-fluid max-w-350" src="${contextPath}/resources/demo.files/svg/ecommerce/undraw_empty_cart_co35.svg" alt="..." style="margin-bottom:50px">
								<br>
								<a href="${contextPath }/main/bestProduct.do" class="badge badge-pill badge-purple badge-soft font-weight-normal p-2">
									쇼핑하러 가기
								</a>

							</div>

						</div>
						</div>
						</div>
				
				</c:when>
				<c:otherwise>

			<!-- -->
			<section>
				<div class="container">

					<div class="row">

				<jsp:include page="/WEB-INF/views/myaccount/account-navi.jsp" />


						<div class="col-12 col-sm-12 col-md-12 col-lg-9">

							<div class="clearfix mb-5">

								<!-- Order Period -->
								<select
									class="form-control b-0 bg-light bs-select w--250 w-100-xs float-start float-none-xs mb-2"
									data-style="bg-light select-form-control" title="주문 기간"
									onchange="window.location=this.value">
									<option value="#">전체</option>
									<option value="?filter_order_period=1">최근 일주일 이내</option>
									<option value="?filter_order_period=2">최근 한 달 이내</option>
								</select>

								<!-- Order Status -->
								<select
									class="form-control b-0 bg-light bs-select w--250 w-100-xs float-start float-none-xs mb-2"
									data-style="bg-light select-form-control" title="주문 상태"
									onchange="window.location=this.value">
									<option value="#">전체</option>
									<option value="?filter_order_status=1">결제완료</option>
									<option value="?filter_order_status=2">배송완료</option>
									<option value="?filter_order_status=3">주문취소</option>
								</select>

							</div>

							<!-- order -->
							<c:forEach var="orderList" items="${orderList }" begin="0">
							<div
								class="clearfix p-3 shadow-xs shadow-md-hover mb-3 rounded bg-white">

								<h2 class="fs--18">
									<a href="${contextPath }/myaccount/account-order-detail.do?order_num=${orderList.order_num }" class="float-end fs--12">
										주문 상세보기 </a> <a href="${contextPath }/myaccount/account-order-detail.do?order_num=${orderList.order_num }"
										class="text-dark"> 주문 # ${orderList.order_num } </a>
								</h2>

								<p class="mb-0 fs--14">주문일: ${orderList.order_date } |
									결제금액: ${orderList.totalPrice} </p>

								<p class="mb-0 fs--14">
									상태:&nbsp; 
									<c:choose>
										<c:when test="${orderList.order_status == '결제완료' }">
									<span class="text-warning font-weight-normal">${orderList.order_status }</span>										
										</c:when>
										<c:when test="${orderList.order_status == '배송완료' }">
									<span class="text-success font-weight-normal">${orderList.order_status }</span>										
										</c:when>
										<c:when test="${orderList.order_status == '주문취소' }">
									<span class="text-danger font-weight-normal">${orderList.order_status }</span>										
										</c:when>
									</c:choose>
								</p>

							</div>
							</c:forEach>
							<!-- /order -->





						</div>

					</div>

				</div>
			</section>
		</c:otherwise>
		</c:choose>
		

	<script src="${contextPath}/resources/assets/js/core.min.js"></script>
