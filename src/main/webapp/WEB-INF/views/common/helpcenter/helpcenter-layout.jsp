<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!-- 자바의 import문처럼 타일즈를 사용하기 위해 반드시 추가해야 합니다. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("utf-8");
%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="...">

<meta name="viewport" content="width=device-width, maximum-scale=5, initial-scale=1, user-scalable=0">

	<!-- up to 10% speed up for external res -->
	<link rel="dns-prefetch" href="https://fonts.googleapis.com/">
	<link rel="dns-prefetch" href="https://fonts.gstatic.com/">
	<link rel="preconnect" href="https://fonts.googleapis.com/">
	<link rel="preconnect" href="https://fonts.gstatic.com/">
	
	<!-- preloading icon font is helping to speed up a little bit -->
	<link rel="preload" href="${contextPath}/resources/assets/fonts/flaticon/Flaticon.woff2" as="font" type="font/woff2" crossorigin>
	
	<!-- favicon -->
	<link rel="shortcut icon" href="${contextPath}/resources/images/fvc.svg">
	<link rel="shortcut icon" href="${contextPath}/resources/images/favicon.ico">
	<link rel="apple-touch-icon" href="${contextPath}/resources/images/fvc.svg">
	<link rel="apple-touch-icon" href="${contextPath}/resources/images/icon_512x512.png">
	
	<link rel="manifest" href="${contextPath}/resources/assets/images/manifest/manifest.json">
	<meta name="theme-color" content="#377dff">

	<!-- title -->
	<title><tiles:insertAttribute name="title" /></title>
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	
	<!-- stylesheet -->
	<link rel="stylesheet" href="${contextPath}/resources/assets/css/core.css">
	<link rel="stylesheet" href="${contextPath}/resources/assets/css/core.min.css">
	<link rel="stylesheet" href="${contextPath}/resources/assets/css/vendor_bundle.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&amp;display=swap">
	<link rel="stylesheet" href="${contextPath}/resources/assets/css/joy.css">
	
	<!--font-->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
	
	<c:if test='${not empty message }'>
		<script>
			alert('${message}')
		</script>
	</c:if>
	
	<script type="text/javascript">
		
		$(document).ready(function() {
			$("a[name='delete']").on("click", function(e) {
				e.preventDefault();
				fn_fileDelete($(this));
			})
			$("#add").on("click", function(e) {
				e.preventDefault();
				fn_fileAdd();
			})
		});
		
		function fn_fileDelete(obj) {
			obj.parent().remove();
		}
		
		function fn_fileAdd() {
			var str = "<div><input name='file' type='file' multiple='multiple'><a href='#this' name='delete' class='btn'>삭제하기</a></div>";
			$("#fileDiv").append(str);
	
			$("a[name='delete']").on("click", function(e) {
				e.preventDefault();
				fn_fileDelete($(this));
			})
		}
		
		function imgPop(url) {
			var img = new Image();
			img.src = url;
			var img_width = img.width;
			var win_width = img.width + 25;
			var img_height = img.height;
			var win_height = img.height;
			var OpenWindow = window.open('', '_blank', 'width=' + img_width
					+ ', height=' + img_height
					+ ', menubars=no, scrollbars=auto');
			OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"'>");
		}
		
		var openOrderList;
		
		function orderList_open(member_id) {
			window.name = "parentForm";
			var paramMemberId = "?member_id=" + member_id;
			var url = "${contextPath}/board/member_order_list.do" + paramMemberId;
			openOrderList = window.open(url, "childForm", "width=570, height=350, resizable=no, scrollbars=no");
		}
		
	</script>

</head>

<body class="layout-admin aside-sticky header-sticky">

	<div id="wrapper" class="d-flex align-items-stretch flex-column">

		<tiles:insertAttribute name="header" />

		<tiles:insertAttribute name="body" />

		<tiles:insertAttribute name="footer" />

	</div>
	
	<div id="onload_modal_shop" class="hide js-onload js-ajax-modal" 
		    data-href="${contextPath}/resources/_ajax/modal_shop.html" 
		    data-ajax-modal-delay="3000" 
		    data-ajax-modal-size="modal-lg" 
		    data-ajax-modal-centered="true" 
		    data-ajax-modal-backdrop=""></div>


	<script src="${contextPath}/resources/assets/js/core.js"></script>
	
	<div id="page_js_files">
		<!-- specific page javascript files here -->
	</div>

</body>

</html>