<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>옵션 관리 페이지</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script>
	function option_add() {
		app = document.getElementById("op");
		app.innerHTML += "<tr><td></td><td><input type=text name=product_id readonly value=${id}></td><td><input type=text name=option_name placeholder=option_name></td><td><input type=text name=option_price placeholder=option_price></td><td><input type=text name=option_quantity placeholder=option_quantity></td><td><button type=submit>옵션 추가</button></td></tr>";
	}
</script>
</head>


			<div id="middle" class="flex-fill">

				<section>
					<a href="${contextPath}/admin/productList.do">
						<i class="fas fa-reply"></i>
						상품 목록 페이지 이동
					</a>
					
				</section>
				<form action="productOptionAdd.do">
					<section>
						<input type="button" onclick="option_add()" class="btn btn-primary" value="옵션추가" /><br><br>
						<table class="table table-align-middle border-bottom mb-6">
							<thead>
								<tr class="text-muted fs--13">
									<th>No</th>
									<th>product_id</th>
									<th>옵션명</th>
									<th>옵션 가격</th>
									<th>수량</th>
									<th>비고</th>
								</tr>
								<c:choose>
									<c:when test="${empty list}">
										<tr class="text-muted fs--13">
											
											<td colspan=6 class="fixed"><strong>조회된 상품이
													없습니다.</strong></td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="option" items="${list}" varStatus="option_num">
											<tr class="text-muted fs--13">
												<td>${option_num.count}</td>
												<td>${option.product_id}</td>
												<td>${option.option_name}</td>
												<td>${option.option_price}</td>
												<td>${option.option_quantity}</td>
												<td><a
													href="${contextPath}/admin/productOptionDelete.do?product_id=${option.product_id}&&option_name=${option.option_name}">삭제</a>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</thead>
							<tbody id="op">

							</tbody>
						</table>
					</section>
				</form>
			</div>

		