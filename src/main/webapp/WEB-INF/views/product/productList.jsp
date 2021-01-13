<%@page import="com.project.shop.product.impl.ProductDAO"%>
<%@page import="com.project.shop.product.Paging"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
  request.setCharacterEncoding("UTF-8");
%>

<!--여기서부터 시작-->
<!-- PAGE TITLE -->
<section class="bg-light p-0">
	<div class="container py-5">

		<h1 class="h3">${product_category_name}</h1>

		<nav aria-label="breadcrumb">
			<ol class="breadcrumb fs--14">
				<li class="breadcrumb-item"><a
					href="${contextPath}/main/main.do">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">${product_category_name}</li>
			</ol>
		</nav>

	</div>
</section>
<!-- /PAGE TITLE -->



<section>
	<div class="container">

		<div class="row">

			<!-- sidebar -->
			<div class="order-1 col-12 col-sm-12 col-md-12 col-lg-3 mb--60">


				<!-- CATEGORIES -->
				<nav
					class="nav-deep nav-deep-light mb-4 border b-0-xs px-4 pb-3 p-0-md p-0-xs rounded">

					<!-- desktop only -->
					<h5 class="h6 pt-3 pb-3 m-0 d-none d-lg-block">Categories</h5>


					<!-- navigation -->
					<ul id="nav_responsive" class="nav flex-column d-none d-lg-block">

						<li class="nav-item"><a class="nav-link px-0"
							href="${contextPath}/product/productList.do?product_category_num=1">
								<i class="fi fi-arrow-end m-0 fs--12"></i> <span
								class="px-2 d-inline-block"> 육류 </span>
						</a></li>

						<li class="nav-item"><a class="nav-link px-0"
							href="${contextPath}/product/productList.do?product_category_num=2">
								<i class="fi fi-arrow-end m-0 fs--12"></i> <span
								class="px-2 d-inline-block"> 채소 </span>
						</a></li>

						<li class="nav-item"><a class="nav-link px-0"
							href="${contextPath}/product/productList.do?product_category_num=3">
								<i class="fi fi-arrow-end m-0 fs--12"></i> <span
								class="px-2 d-inline-block"> 베이커리 </span>
						</a></li>

						<li class="nav-item"><a class="nav-link px-0"
							href="${contextPath}/product/productList.do?product_category_num=4">
								<i class="fi fi-arrow-end m-0 fs--12"></i> <span
								class="px-2 d-inline-block"> 과일 </span>
						</a></li>
						
						<li class="nav-item"><a class="nav-link px-0"
							href="${contextPath}/product/productList.do?product_category_num=5">
								<i class="fi fi-arrow-end m-0 fs--12"></i> <span
								class="px-2 d-inline-block"> 음료 </span>
						</a></li>
						

					</ul>

				</nav>
				<!-- /CATEGORIES -->

			</div>
			<!-- /sidebar -->



			<!-- products -->
			<div class="order-2 col-12 col-sm-12 col-md-12 col-lg-9">


				<!-- additional filters -->
				<div class="bg-light mb-5 p-3 rounded clearfix">

					<div class="clearfix border-bottom pb-3 mb-3">


						<div class="float-end fs--14 position-relative mt-1">
							<a href="#" class="text-primary text-decoration-none"
								data-toggle="dropdown" aria-expanded="false"> ${sortby } <i
								class="fi fi-arrow-down-slim fs--12"></i>
							</a>

							<ul class="dropdown-menu b-0 mt-3 rounded fs--15">
								<li class="dropdown-item active"><a
									href="${contextPath}/product/productList.do?product_category_num=${product_category_num }&listKey=reg_date&orderKey=desc"
									class="text-muted py-2 d-block">신상품순 </a></li>
								<li class="dropdown-item"><a
									href="${contextPath}/product/productList.do?product_category_num=${product_category_num }&listKey=price&orderKey=asc"
									class="text-muted py-2 d-block">낮은가격순 </a></li>
								<li class="dropdown-item"><a
									href="${contextPath}/product/productList.do?product_category_num=${product_category_num }&listKey=price&orderKey=desc"
									class="text-muted py-2 d-block">높은가격순 </a></li>
							</ul>
						</div>

					</div>

				</div>
				<!-- /additional filters -->



				<!-- product list -->

				<div class="row gutters-xs--xs">

					<c:forEach var="item" items="${productList}">
						<!-- item -->

						<div class="col-6 col-md-4 mb-4 mb-2-xs">

							<div
								class="bg-white border rounded show-hover-container p-2 h-100">

								<!-- hover buttons : top -->
								<div
									class="position-absolute top-0 end-0 text-align-end w--80 z-index-3 my-3 mx-4 px-2 show-hover-item">



									<!-- add to favourite : logged in -->
									
									<c:choose>
								<c:when test="${isLogOn==true and not empty memberInfo }">
										<a href="#"
											class="btn-toggle btn bg-white shadow-lg btn-sm rounded-circle mb-2"
											data-toggle="tooltip" data-original-title="찜 리스트에 담기"
											data-placement="left"
											data-toggle-ajax-url-on="${contextPath}/myaccount/addFav.do?product_id=${vo.product_id}"
											data-toast-success-message="찜 리스트에 담겼습니다."
											data-toast-success-position="bottom-center"><i
											class="fi fi-heart-slim"></i>
										</a>
								</c:when>
							</c:choose>								
									
									<a href="#"
										class="btn btn-danger shadow-lg btn-sm rounded-circle mb-2"
										title="" data-toggle="tooltip" data-placement="left"
										data-original-title="add to cart"> <i class="fi fi-cart-1"></i>
									</a>
								</div>
								<!-- /hover buttons : top -->


								<a
									href="${contextPath}/product/productDetail.do?product_id=${item.product_id}"
									class="d-block text-decoration-none"> <!--  상품 이미지  --> <img
									class="img-fluid"
									src="${contextPath}/resources/images/product/${item.product_id}/${item.product_image}"
									alt="상품이미지"> <span
									class="d-block fs--16 max-h-50 overflow-hidden">
										${item.product_name} </span> <!-- price --> <span
									class="d-block text-danger font-weight-medium fs--16 mt-2">
										<del class="text-muted">
											<fmt:formatNumber type="number" value="${item.price}" />
											원
										</del> <fmt:formatNumber type="number" value="${item.sale_price}" />원
								</span> <!-- rating --> <span class="d-block"> <i
										class="rating-5 text-warning fs--14"></i> <span
										class="fs--12 text-muted">(4.7)</span>
								</span>
								</a>

							</div>

						</div>
					</c:forEach>
					<!-- /item -->




				</div>
				<!-- pagination -->


				<nav aria-label="pagination" class="mt-5">
					<ul
						class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end">

						<%--[이전으로] 사용불가 또는 안보이게 : 첫번째 블록인경우 --%>
						<c:if test="${pvo.beginPage == 1}">
							<li class="page-item disabled"><a class="page-link" href="#"
								tabindex="-1" aria-disabled="true">Previous</a></li>
						</c:if>
						<c:if test="${pvo.beginPage != 1}">
							<li class="page-item"><a class="page-link"
								href="${contextPath}/product/productList.do?product_category_num=${product_category_num }&cPage=${pvo.beginPage - 1 }">Previous</a>
							</li>
						</c:if>

						<%-- 페이지 표시(시작페이지~끝페이지) --%>
						<c:forEach var="pageNo" begin="${pvo.beginPage }"
							end="${pvo.endPage }">
							<c:if test="${pageNo == pvo.nowPage }">
								<li class="page-item active"><a class="page-link" href="#">${pageNo }
										<span class="sr-only"></span>
								</a></li>
							</c:if>
							<c:if test="${pageNo != pvo.nowPage }">
								<li class="page-item" aria-current="page"><a
									class="page-link"
									href="${contextPath}/product/productList.do?product_category_num=${product_category_num}&cPage=${pageNo}">${pageNo }</a>
								</li>
							</c:if>
						</c:forEach>

						<%--[다음으로] 사용여부 처리 --%>
						<c:if test="${pvo.endPage >= pvo.totalPage }">
							<li class="page-item disabled"><a class="page-link">다음으로</a>
							</li>
						</c:if>

						<c:if test="${pvo.endPage < pvo.totalPage }">
							<li class="page-item"><a class="page-link"
								href="${contextPath}/product/productList.do?product_category_num=${product_category_num}&cPage=${pvo.endPage +1}">Next</a>
							</li>
						</c:if>
					</ul>
				</nav>

				<!-- pagination -->
			</div>
		</div>
	</div>
</section>



<script src="${contextPath}/resources/assets/js/core.js"></script>
