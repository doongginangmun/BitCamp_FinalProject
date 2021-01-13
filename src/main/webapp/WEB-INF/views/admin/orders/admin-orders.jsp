<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("UTF-8");
%>




<!-- MIDDLE -->
<div id="middle" class="flex-fill">

	<!--

						PAGE TITLE
					-->
	<div class="page-title bg-transparent b-0">

		<h1 class="h4 mt-4 mb-0 px-3 font-weight-normal">주문 관리</h1>

	</div>




	<!-- PAGE LIST -->
	<div class="clearfix">

		<!-- portlet -->
		<div class="portlet">

			<!-- portlet : header -->
			<div class="portlet-header">

				<div class="clearfix">

					<!-- Order Period -->
					<select
						class="form-control b-0 bg-light bs-select w--250 w-100-xs float-start float-none-xs mb-2"
						data-style="bg-light select-form-control" title="주문 기간"
						onchange="window.location=this.value">
						<option value="?filter_order_period=">전체</option>
						<option value="?filter_order_period=1">최근 일주일 이내</option>
						<option value="?filter_order_period=2">최근 한 달 이내</option>
					</select>

					<!-- Order Status -->
					<select
						class="form-control b-0 bg-light bs-select w--250 w-100-xs float-start float-none-xs mb-2"
						data-style="bg-light select-form-control" title="주문 상태"
						onchange="window.location=this.value">
						<option value="?filter_order_status=">전체</option>
						<option value="?filter_order_status=1">결제완료</option>
						<option value="?filter_order_status=2">배송완료</option>
						<option value="?filter_order_status=3">주문취소</option>
					</select>

				</div>


			</div>
			<!-- /portlet : header -->


			<!-- portlet : body -->
			<div class="portlet-body pt-0">
				<!-- -->


				<div class="row gutters-sm" style="margin-left:50px">



						<!-- order -->
						<c:forEach var="orderList" items="${orderList }" begin="0">
					<div class="col-12 col-xl-5">
							<div
								class="clearfix p-3 shadow-xs shadow-md-hover mb-3 rounded bg-white">

								<h2 class="fs--18">
									<a
										href="${contextPath }/admin/order/detail.do?order_num=${orderList.order_num }"
										class="float-end fs--12"> 주문 상세보기 </a> <a
										href="${contextPath }/admin/order/detail.do?order_num=${orderList.order_num }"
										class="text-dark">  ${orderList.order_num }    </a>
								</h2>
								<h2 class="fs--16">주문자: ${orderList.member_name }</h2>

								<p class="mb-0 fs--14">주문일: ${orderList.order_date } | 결제금액:
									${orderList.totalPrice}</p>

								<p class="mb-0 fs--14">
									<select
										class="form-control bg-light bs-select float-start float-none-xs mb-2"
										data-style="bg-light select-form-control"
										title="${orderList.order_status }"
										onchange="window.location=this.value">
										<option value="?order_status=결제완료&order_num=${orderList.order_num }">결제완료</option>
										<option value="?order_status=배송완료&order_num=${orderList.order_num }">배송완료</option>
										<option value="?order_status=주문취소&order_num=${orderList.order_num }">주문취소</option>
									</select>
								</p>

							</div>
					</div>
						</c:forEach>
						<!-- /order -->



				</div>


			</div>
			<!-- /portlet : body -->

		</div>
		<!-- /portlet -->

	</div>
	<!-- /PAGE LIST -->

</div>
<!-- /MIDDLE -->

</div>






<script src="${contextPath}/resources/assets/js/core.min.js"></script>
