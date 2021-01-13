<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("UTF-8");
%>

<div class="col-12 col-sm-12 col-md-12 col-lg-3 mb--60">

	<nav class="sticky-kit nav-deep nav-deep-light">

		<!-- mobile only -->
		<button
			class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none"
			data-target="#nav_responsive"
			data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">
			<span class="group-icon px-2 py-2 float-start"> <i
				class="fi fi-bars-2"></i> <i class="fi fi-close"></i>
			</span> <span class="h5 py-2 m-0 float-start"> 계정 메뉴</span>
		</button>

		<!-- desktop only -->
		<h5 class="pt-3 pb-3 m-0 d-none d-lg-block">계정 메뉴</h5>


		<!-- navigation -->
		<ul id="nav_responsive" class="nav flex-column d-none d-lg-block">

			<li class="nav-item"><a class="nav-link px-0"
				href="${contextPath}/myaccount/account-orders.do"> <i
					class="fi fi-arrow-end m-0 fs--12"></i> <span
					class="px-2 d-inline-block"> 내 주문 </span>
			</a></li>

			<li class="nav-item"><a class="nav-link px-0"
				href="${contextPath}/myaccount/account-favourites.do"> <i
					class="fi fi-arrow-end m-0 fs--12"></i> <span
					class="px-2 d-inline-block"> 찜 리스트 </span>
			</a></li>

			<li class="nav-item"><a class="nav-link px-0"
				href="${contextPath}/myaccount/account-settings.do"> <i
					class="fi fi-arrow-end m-0 fs--12"></i> <span
					class="px-2 d-inline-block"> 마이 페이지 </span>
			</a></li>
			<br>

			<li class="nav-item"><a class="nav-link px-0"
				href="${contextPath}/member/logout.do"> <i class="fi fi-power"></i>
					로그아웃
			</a></li>

		</ul>

	</nav>

</div>