<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!-- 자바의 import문처럼 타일즈를 사용하기 위해 반드시 추가해야 합니다. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title" /></title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript">

	function setOrderNum(){
		var radioId = $('input[name="ordernoSelect"]:checked').val(); 
	    opener.document.getElementById("pOrderNum").value = radioId;
	    window.close();
	}
	
</script>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>선택</th>
				<th>주문번호</th>
				<th>상품명</th>
				<th>수량</th>
				<th>주문금액</th>
				<th>주문일자</th>
			</tr>
		</thead>
		<tbody>
	<c:if test="${not empty orderList}">
		<c:forEach var="order" items="${orderList}">
			<tr>
				<td>
					<input type="checkbox" name="ordernoSelect" value="${order.order_num }">
				</td>
				<td>${order.order_num }</td>
				<td>[LOTS OF LOVE] 입맛듬.. 외 5건</td>
				<td>6개</td>
				<td>26,800원</td>
				<td>18-11-30</td>
			</tr>
		</c:forEach>
	</c:if>
		</tbody>
	</table>
	<button type="button" onclick="setOrderNum()">선택</button>
</body>
</html>










