<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>

<!-- MIDDLE -->
<div id="middle" class="flex-fill">

	<div class="page-title bg-transparent b-0">

		<h1 class="h4 mt-4 mb-0 px-3 font-weight-normal">상품 카테고리 관리</h1>

	</div>

	<!-- start:row -->
	<div class="row gutters-sm">

		<!-- start:col: -->
		<div class="col-12 mb-3">

			<!-- start:portlet -->
			<div class="portlet" style="overflow: hidden; display: block;">

				<div class="portlet-body"
					style="display: inline-block; width: 25%; float: left;">

					<div class="portlet-header border-bottom">
						<span>
							<i class="fi fi-star-empty fs--25 text-warning"></i>
							카테고리 미리보기
						</span>
					</div>

					<nav class="nav-deep nav-deep-light nav-deep-bordered nav-deep-xs">
						<ul class="nav flex-column">

							<li class="nav-item">
								<a class="nav-link" href="#"> 
									<span class="group-icon float-end"> 
									<i class="fi fi-arrow-end-slim"></i> 
									<i class="fi fi-arrow-down-slim"></i>
									</span> 
									전체 카테고리
								</a>
								
								<c:if test="${not empty categoryList}">
								<c:forEach var="category" items="${categoryList}">
								<ul class="nav flex-column">
									<li class="nav-item">
										<a class="nav-link" href="#"> 
											${category.product_category_name }
										</a>
									</li>
								</ul>
								</c:forEach>
								</c:if>
								
							</li>

						</ul>
					</nav>

				</div>

				<div class="portlet-body" style="display: inline-block; width: 25%; float: left;">
					<div class="portlet-header border-bottom">
						<span>
							<i class="fi fi-star-empty fs--25 text-warning"></i>
							카테고리 등록
						</span>
					</div>
					
					<form action="${contextPath }/adminboard/proCategoryInsert.do">
						<div class="form-group">
							<input type="text" name="product_category_name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="카테고리 이름">
						</div>
						<button type="submit" class="btn btn-danger btn-soft-static mb-1">등록</button>
					</form>
				</div>

				<div class="portlet-body"
					style="display: inline-block; width: 25%; float: left;">
					<div class="portlet-header border-bottom">
						<span> <i class="fi fi-star-empty fs--25 text-warning"></i>
							카테고리 수정
						</span>
					</div>

					<form action="${contextPath }/adminboard/proCategoryUpdate.do">
						<select name="product_category_num" class="form-control mb-3 js-ajax js-ajaxified"
							data-ajax-target="#county_list">
							<c:if test="${not empty categoryList}">
								<c:forEach var="category" items="${categoryList}">
									<option value="${category.product_category_num }">${category.product_category_name }</option>
								</c:forEach>
							</c:if>
						</select>
						<div class="form-group">
							<input type="text" name="product_category_name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="수정할 이름">
						</div>
						<button type="submit" class="btn btn-danger btn-soft-static mb-1" style="">수정</button>
					</form>
				</div>

				<div class="portlet-body" style="display: inline-block; width: 25%; float: left;">
					<div class="portlet-header border-bottom">
						<span>
							<i class="fi fi-star-empty fs--25 text-warning"></i>
							카테고리 삭제
						</span>
					</div>

					<c:if test="${not empty categoryList}">
						<c:forEach var="category" items="${categoryList}">
								<div class="alert alert-danger" role="alert">
									<button type="button" class="close">
										<span class="fi fi-close" aria-hidden="true" onclick="categoryDelete_confirm(${category.product_category_num})"></span>
									</button>
									${category.product_category_name }
								</div>
						</c:forEach>
					</c:if>

				</div>


			</div>
			<!-- end:portlet -->

		</div>
		<!-- end:col: -->

	</div>
	<!-- end:row: -->
	<!-- doc:end -->

</div>
<!-- /MIDDLE -->