<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("utf-8");
%>

<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta charset="UTF-8">
		<title><tiles:insertAttribute name="title" /></title>	
		<meta name="description" content="...">

        <meta name="viewport" content="width=device-width, maximum-scale=5, initial-scale=1, user-scalable=0">
        <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->

        <!-- up to 10% speed up for external res -->
        <link rel="dns-prefetch" href="https://fonts.googleapis.com/">
        <link rel="dns-prefetch" href="https://fonts.gstatic.com/">
        <link rel="preconnect" href="https://fonts.googleapis.com/">
        <link rel="preconnect" href="https://fonts.gstatic.com/">
        <!-- preloading icon font is helping to speed up a little bit -->
        <link rel="preload" href="${contextPath}/resources/assets/fonts/flaticon/Flaticon.woff2" as="font" type="font/woff2" crossorigin>

        <!-- non block rendering : page speed : js = polyfill for old browsers missing `preload` -->
        <link rel="stylesheet" href="${contextPath}/resources/assets/css/core.css">
        <link rel="stylesheet" href="${contextPath}/resources/assets/css/vendor_bundle.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&amp;display=swap">

		<!-- favicon -->
		<link rel="shortcut icon" href="${contextPath}/resources/images/favicon.ico">
		<link rel="apple-touch-icon" href="${contextPath}/resources/demo.files/logo/icon_512x512.png">

		<link rel="manifest" href="${contextPath}/resources/assets/images/manifest/manifest.json">
		
		<meta name="theme-color" content="#377dff">
<!--font-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
.mini{
		width: 80px;
		height: 80px;
		margin-right: 60px;
	}
</style>

	<c:if test='${not empty message }'>
		<script>
			alert('${message}')
		</script>
	</c:if>
<script>
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
	OpenWindow.document
			.write("<style>body{margin:0px;}</style><img src='"+url+"'>");
}

function categoryDelete_confirm(product_category_num) {
	result = confirm('정말 삭제 하시겠습니까?');
	if (result == true) {
		location.href = "${contextPath }/adminboard/proCategoryDelete.do?product_category_num=" + product_category_num;
	} else {
		return false;
	}
}
</script>
</head>
	
	<tiles:insertAttribute name="tag" />

			<tiles:insertAttribute name="header" />

			<div id="wrapper_content" class="d-flex flex-fill">
			
				<tiles:insertAttribute name="aside" />
				
				<tiles:insertAttribute name="body" />
			
			</div>

			<tiles:insertAttribute name="footer" />
		
		</div>
		
		<script src="${contextPath}/resources/assets/js/core.js"></script>

		<div id="page_js_files"><!-- specific page javascript files here --></div>

	</body>
</html>







