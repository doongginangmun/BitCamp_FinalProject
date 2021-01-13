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

<!-- PAGE TITLE -->
<section class="bg-light p-0">
	<div class="container py-5">

		<h1 class="h3">베스트</h1>

		<nav aria-label="breadcrumb">
			<ol class="breadcrumb fs--14">
				<li class="breadcrumb-item"><a href="${contextPath}/main/main.do" id="mainNavPages">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">베스트</li>
			</ol>
		</nav>

	</div>
</section>
<!-- /PAGE TITLE -->




<!-- -->
<section>
	<div class="container">

		<div class="row">

			<div class="col-12 col-sm-12 col-md-12 col-lg-2 mb--60"></div>


			<div class="col-12 col-sm-12 col-md-12 col-lg-9">



				<div class="row">
					<c:forEach var="item" items="${list}">
						<div class="col-6 col-md-4 mb-4">

							<div
								class="bg-white shadow-md shadow-3d-hover transition-all-ease-250 transition-hover-top rounded show-hover-container p-2">

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
										</del> <fmt:formatNumber
											value="${item.price*((100-item.discount)/100)}" />원
								</span> <!-- rating --> <span class="d-block"> <i
										class="rating-5 text-warning fs--14"></i> <span
										class="fs--12 text-muted">(4.7)</span>
								</span>
								</a>

							</div>

						</div>
					</c:forEach>



				</div>






			</div>

		</div>

	</div>
</section>
<!-- / -->