<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

    			<!-- CHECKOUT -->
			<section>
				<div class="container">


					<div class="text-center mb-5">

						<h1>
							주문이 완료되었습니다.
						</h1>
						<p>
							주문하신 주문번호를 꼭 기억해주세요.
						</p>
						<p class="h5"><b>주문번호:</b> ${param.order_num } </p>

						<div class="mt--80">
							<img class="img-fluid max-w-350" src="${contextPath }/resources/demo.files/svg/ecommerce/undraw_confirmation_2uy0.svg" alt="...">
						</div>

					</div>


				</div>
			</section>
			<!-- /CHECKOUT -->