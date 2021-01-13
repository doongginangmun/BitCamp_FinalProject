<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>     <!-- 자바의 import문처럼 타일즈를 사용하기 위해 반드시 추가해야 합니다. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("utf-8");
%>

<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta name="description" content="...">
		<title><tiles:insertAttribute name="title" /></title>
        <meta name="viewport" content="width=device-width, maximum-scale=5, initial-scale=1, user-scalable=0">
        <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->

        <!-- up to 10% speed up for external res -->
        <link rel="dns-prefetch" href="https://fonts.googleapis.com/">
        <link rel="dns-prefetch" href="https://fonts.gstatic.com/">
        <link rel="preconnect" href="https://fonts.googleapis.com/">
        <link rel="preconnect" href="https://fonts.gstatic.com/">
        <!-- preloading icon font is helping to speed up a little bit -->
        <link rel="preload" href="${contextPath}/resources/assets/fonts/flaticon/Flaticon.woff2" as="font" type="font/woff2" crossorigin>

        <link rel="stylesheet" href="${contextPath}/resources/assets/css/core.css">
        <link rel="stylesheet" href="${contextPath}/resources/assets/css/vendor_bundle.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&amp;display=swap">

      	<!-- favicon -->
      	<link rel="shortcut icon" href="${contextPath}/resources/images/fvc.svg">
      	<link rel="apple-touch-icon" href="${contextPath}/resources/images/fvc.svg">

		<link rel="manifest" href="${contextPath}/resources/assets/images/manifest/manifest.json">
		<meta name="theme-color" content="#377dff">
		
		<!-- 구글 로그인 api -->
  		<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
		<script src="https://apis.google.com/js/platform.js" async defer></script>
		<script src="https://apis.google.com/js/api:client.js"></script>
  		<script src="http://code.jquery.com/jquery-latest.js"></script>

		<!--font-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
		
	</head>
<body>
		<div id="wrap">
		
			<tiles:insertAttribute name="header" /> <!-- tiles.xml의 <definition>의 하위 태그인 <put-attribute>태그의 name이 header인 JSP를 표시합니다. -->
			
			<tiles:insertAttribute name="body" />
	
 			<%-- <tiles:insertAttribute name="footer" />  --%>
			
		</div><!-- /#wrapper -->


		<!-- 
			SHOP AJAX MODAL : ON LOAD 

			Note: #onload_modal_shop is also used inside the modal
			for the button "stop showing" to set a cookie!
		-->
<!-- 		<div id="onload_modal_shop" class="hide js-onload js-ajax-modal" 
			data-href="_ajax/modal_shop.html" 
			data-ajax-modal-delay="3000" 
			data-ajax-modal-size="modal-lg" 
			data-ajax-modal-centered="true" 
			data-ajax-modal-backdrop=""></div> -->


		<script src="${contextPath}/resources/assets/js/core.js"></script>
		
	</body>
</html>
