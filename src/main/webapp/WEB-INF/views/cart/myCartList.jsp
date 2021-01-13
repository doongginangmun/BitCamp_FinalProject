<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="myCartList" value="${cartMap.myCartList}" />
<c:set var="myProductList" value="${cartMap.myProductList}" />
<c:set var="total_price" value="0" />
<c:set var="shipping" value="3500" />
<c:set var="total_discount" value="0" />
<%-- <jsp:include page="/WEB-INF/views/cart/cart.jsp" /> --%>
<script type="text/javascript">

    var sell_price;
	var amount;
	var discount;
	var total_price;
	var total_discount;
	var shipping = 3500;
	var stock;
	function add(product_name, cart_id, index) {
		var currentIndex = parseInt(index);
		total_price = parseInt(document.getElementById("total_price").innerText);
		total_discount = parseInt(document.getElementById("total_discount").innerText);

		if (!document.form["amount"][currentIndex]) {
			amount = parseInt(document.form.amount.value) + 1;
			sell_price = parseInt(document.form.sell_price.value);
			discount = parseInt(document.form.discount.value);
			
			var string= document.getElementsByName("stock")[currentIndex].textContent;
			var no = string.indexOf(":");
			var no1 = string.slice(no+1);
			stock = no1.trim();
			
		} else {
			amount = parseInt(document.form["amount"][currentIndex].value) + 1;
			sell_price = parseInt(document.form["sell_price"][currentIndex].value);
			discount = parseInt(document.form["discount"][currentIndex].value);
			
			var string= document.getElementsByName("stock")[currentIndex].textContent;
			var no = string.indexOf(":");
			var no1 = string.slice(no+1);
			stock = no1.trim();
		}
		if(amount > stock){
			alert("현재 재고보다 많은수량을 선택하셨습니다.");
			return;
		}
	
				$.ajax({
					type : "post",
					async : false,
					url : "${contextPath}/cart/plusQuantity.do",
					data : {
						cart_id : cart_id,
						product_name : product_name
					},
					success : function(data, textStatus) {
						if (data.trim() == 'add_success') {

							document.getElementsByName("product_pri")[currentIndex].innerHTML = "<del>"
									+ parseInt(amount * sell_price)
									+ " 원"
									+ "</del>";
							document.getElementsByName("cash")[currentIndex].innerHTML = parseInt(amount
									* (sell_price - discount))
									+ " 원";
							document.getElementsByName("discountTest")[currentIndex].innerHTML = "할인 금액 :"
									+ "<br>"
									+ parseInt(amount * discount)
									+ " 원";
							document.getElementsByName("amount")[currentIndex].value = amount;

							document.getElementById("total_price").innerHTML = parseInt(total_price
									+ (sell_price - discount))
									+ " 원";
							document.getElementById("total_discount").innerHTML = parseInt(total_discount
									+ discount)
									+ " 원";
							document.getElementById("total-price").innerHTML = parseInt(total_price
									+ (sell_price - discount) + shipping)
									+ " 원";
						}
					},
					error : function(data, testStatus) {
						alert("에러발생 ㅠ" + data);
					},
					complete : function(data, textStatus) {
					}
				}); //end ajax
	}
	function del(product_name, cart_id, index) {
		var currentIndex = parseInt(index);
		total_price = parseInt(document.getElementById("total_price").innerText);
		total_discount = parseInt(document.getElementById("total_discount").innerText);

		if (!document.form["amount"][currentIndex]) {
			amount = parseInt(document.form.amount.value)-1;
			if (amount < 1) {
				document.form.amount.value = 1;
				return;
			}
			sell_price = parseInt(document.form.sell_price.value);
			discount = parseInt(document.form.discount.value);
		} else {
			amount = parseInt(document.form["amount"][currentIndex].value) - 1;
			if (amount < 1) {
				amount = 1;
				return;
			}
			sell_price = parseInt(document.form["sell_price"][currentIndex].value);
			discount = parseInt(document.form["discount"][currentIndex].value);
			document.getElementsByName("amount")[currentIndex].value = parseInt(amount);
		}
				$.ajax({
					type : "post",
					async : false,
					url : "${contextPath}/cart/minusQuantity.do",
					data : {
						cart_id : cart_id,
						product_name : product_name
					},
					success : function(data, textStatus) {
						if (data.trim() == 'add_success1') {
							document.getElementsByName("product_pri")[currentIndex].innerHTML = "<del>"
									+ parseInt(amount * sell_price)
									+ " 원"
									+ "</del>";
							document.getElementsByName("cash")[currentIndex].innerHTML = parseInt(amount
									* (sell_price - discount))
									+ " 원";
							document.getElementsByName("discountTest")[currentIndex].innerHTML = "할인 금액 :"
									+ "<br>"
									+ parseInt(amount * discount)
									+ " 원";
							document.form.amount.value = amount;
							document.getElementById("total_price").innerHTML = parseInt(total_price
									- (sell_price - discount))
									+ " 원";
							document.getElementById("total_discount").innerHTML = parseInt(total_discount
									- discount)
									+ " 원";
							document.getElementById("total-price").innerHTML = parseInt(total_price
									- (sell_price - discount) + shipping)
									+ " 원";
						}
					},
					error : function(data, testStatus) {
						alert("에러발생 ㅠ" + data);
					},
					complete : function(data, textStatus) {
					}
				}); //end ajax
	}
	function deleteAllProduct() {
		var delconfirm = confirm("장바구니 항목 전체를 삭제하시겠습니까?");
		if (delconfirm) {
			location.href = "${contextPath}/cart/deleteAllProduct.do";
		}
	}
	function deleteProduct(product_name, cart_id) {
		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/cart/removeCartProduct.do",
			data : {
				product_name : product_name,
				cart_id : cart_id
			},
			success : function(data, textStatus) {
			},
			error : function(data, textStatus) {
				alert("에러ㅠㅠ" + data);
			},
			complete : function(data, textStaus) {
				refreshMemList();
			}
		}); //end ajax
	}
	function refreshMemList() {
		location.reload();
	}
    </script>
<style>
.stm, .stm .btn {
	overflow: hidden;
	height: 36px
}

.stm .btn {
	float: left;
	width: 35px;
	border: 0;
	font-size: 0;
	text-indent: -9999px
}

.stm .btn.minus {
	background-image:
		url(https://res.kurly.com/mobile/service/cart/2007/ico_minus_on.svg)
}

.stm .btn.minus, .stm .btn.minus.off {
	background-color: transparent;
	background-repeat: no-repeat;
	background-size: 36px 36px;
	background-position: 50% 50%
}

.stm .btn.minus.off {
	background-image:
		url(https://res.kurly.com/mobile/service/cart/2007/ico_minus.svg)
}

.stm .btn.plus {
	background-image:
		url(https://res.kurly.com/mobile/service/cart/2007/ico_plus_on.svg)
}

.stm .btn.plus, .stm .btn.plus.off {
	background-color: transparent;
	background-repeat: no-repeat;
	background-size: 36px 36px;
	background-position: 50% 50%
}

.stm .btn.plus.off {
	background-image:
		url(https://res.kurly.com/mobile/service/cart/2007/ico_plus.svg)
}

.stm .num {
	float: left;
	width: 29px;
	height: 36px;
	padding: 0;
	border: 100px;
	font-weight: 600;
	font-size: 14px;
	color: #333;
	line-height: 50px;
	text-align: center
}
</style>
<body>
<c:choose>
	  <c:when test="${isLogOn==false and empty memberInfo }">
	  		<h1>장바구니비었음</h1>
	  		
	  </c:when>
</c:choose>

	<c:choose>
		<c:when test="${ empty myCartList }">
			<!-- CART -->
			<section>
				<div class="container">

					<div class="text-center mb-5">


						<h1 class="mb--80">장바구니가 비었습니다</h1>

						<img class="img-fluid max-w-350"
							src="${contextPath }/resources/demo.files/svg/ecommerce/undraw_empty_cart_co35.svg"
							alt="...">

					</div>
				</div>
			</section>
			<!-- /CART -->
		</c:when>
		<c:otherwise>
    <!-- PAGE TITLE -->
         <section class="bg-light p-0">
            <div class="container py-5">

               <h1 class="h3">
                  장바구니
               </h1>

               <nav aria-label="breadcrumb">
                  <ol class="breadcrumb fs--14">
                     <li class="breadcrumb-item"><a href="#!">Home</a></li>
                     <li class="breadcrumb-item active" aria-current="page">My Cart</li>
                  </ol>
               </nav>

            </div>
         </section>
         <!-- /PAGE TITLE -->

			<!-- CART -->
			<section>
				<div class="container">

					<div class="row">

						<div class="col-12 col-md-8 col-lg-9 order-md-1 mb-5">

							<form method="post" action="#" name="form">
							

								<!-- ITEM -->
								<div class="cart-item shadow-xs p-3 mb-4 rounded border">

									<!-- PRODUCT -->
									<c:forEach var="item" items="${myProductList}" varStatus="cnt">
										<c:set var="cart_product_qty"
											value="${myProductList[cnt.count-1].quantity}" />
										<c:set var="cart_id"
											value="${myProductList[cnt.count-1].cart_id}" />
										<c:set var="product_price"
											value="${myProductList[cnt.count-1].option_price}" />
										<c:set var="option_name"
										 	value="${myProductList[cnt.count-1].option_name}" />
										 	<c:if test="${empty option_name}">
										 <c:set var="option_name"
										 	value="${myProductList[cnt.count-1].product_name}" />	
										 	</c:if>
										<c:set var="product_discount"
											value="${myProductList[cnt.count-1].discount}" />
										<c:set var="product_image"
											value="${myProductList[cnt.count-1].product_image}" />
										<c:set var="product_index" value="${cnt.index}" />
										<c:set var="product_stock"
											value="${myProductList[cnt.count-1].stock}" />
										<c:set var="total_price"
											value="${total_price+((product_price-product_discount)*cart_product_qty)}" />
										<c:set var="total_discount"
											value="${total_discount+(cart_product_qty*product_discount)}" />

										<div class="row">

											<div class="col-4 col-sm-4 col-md-2 col-lg-2 text-center">

												<img class="img-fluid max-h-80"
													src="${contextPath}/resources/images/product/${item.product_id }/${product_image}"
													alt="...">

											</div>

											<div class="col-8 col-sm-8 col-md-10 col-lg-10">

												<div class="row">

													<div class="col-12 col-sm-12 col-md-6 col-lg-6">

														<div class="clearfix my-2 d-block">
															<a class="fs--18 text-dark font-weight-medium"
																href="${contextPath}/product/productDetail.do?product_id=${item.product_id}">
																${option_name} </a> <span
																class="d-block text-muted fs--12">
																${item.option_price} 원 </span>

															<ul class="list-inline">
																<li class="list-inline-item"><a
																	class="js-ajax-confirm fs--13" href="#"
																	data-href="javascript:deleteProduct('${item.product_name}',${cart_id});"
																	data-ajax-confirm-mode="regular"
																	data-ajax-confirm-size="modal-md"
																	data-ajax-confirm-centered="true"
																	data-ajax-confirm-title="한번더 확인!!"
																	data-ajax-confirm-body="${item.option_name} 아이템을 제거하시겠습니까?"
																	data-ajax-confirm-btn-yes-class="btn-sm btn-danger"
																	data-ajax-confirm-btn-yes-text="네 지워주세요!"
																	data-ajax-confirm-btn-yes-icon="fi fi-check"
																	data-ajax-confirm-btn-no-class="btn-sm btn-light"
																	data-ajax-confirm-btn-no-text="아뇨, 안지울래요."
																	data-ajax-confirm-btn-no-icon="fi fi-close"> 제거 </a></li>
																<!-- 
															<li class="list-inline-item">
																<a class="fs--13" href="#!">
																	나중에 저장
																</a>
															</li> -->
															</ul>

														</div>

													</div>


													<div class="col-6 col-sm-6 col-md-3 col-lg-3 text-center">

														<div class="position-relative">
															<span
																class="js-form-advanced-limit-info badge badge-warning hide animate-bouncein position-absolute absolute-top start-0 m-1">
																주문수량1~99까지만 가능합니다. </span>

															<!-- <input type="number" name="qty[5][]" class="cart-qty form-control form-control-sm text-center js-form-advanced-limit" min="0" max="99" value="1"> -->
														</div>

														<!-- <input type="button" value=" + " onclick="add();">
								<input type="button" value=" - " onclick="del();"><br> -->
														<!-- button 의 타입 명시해주기 안해주면 스크립트가 실행안됨(button은 기본적으로 submit형태로 동작하는데 submit없기때문)
									onclick="add();return:false;"> 요런식으로 추가해도가능 -->
														<!-- 위에 폼부분에 name=form 추가 -->
														<!-- <form name="form" method="get"> -->
														<div class="stm">

															<!-- <input type="button" value=" + " onclick="add();">
												<input type="button" value=" - " onclick="del();"><br> -->
															<!-- button 의 타입 명시해주기 안해주면 스크립트가 실행안됨(button은 기본적으로 submit형태로 동작하는데 submit없기때문)
													onclick="add();return:false;"> 요런식으로 추가해도가능 -->
															<button type="button" class="btn minus"
																onclick="del('${item.product_name}','${item.cart_id}','${cnt.index}');">감소</button>
															<input type=hidden name="sell_price"
																value="${item.option_price}"> <input type=hidden
																name="discount" value="${product_discount}"> <input
																type="text" class="num" name="amount"
																value="${cart_product_qty}" size="3" readonly>
															<button type="button" class="btn plus"
																onclick="add('${item.product_name}','${item.cart_id}','${cnt.index}');">증가</button>

														</div>
														<span class="d-block text-muted fs--11 mt-1" name="stock">
															재고: ${product_stock} </span>

													</div>


													<div
														class="col-6 col-sm-6 col-md-3 col-lg-3 text-align-end">

														<p class="fs--13 text-weight-muted mb-0" id="price"
															name="product_pri">
															<del>${item.option_price*cart_product_qty} 원</del>
														</p>
														<!-- 수량버튼클릭시 변경되는부분 -->
														<p class="fs--16 font-weight-medium mb-0" id="money"
															name="cash">
															${(item.option_price-product_discount)*cart_product_qty}
															원</p>

														<span class="text-success d-block fs--12 mb-2"
															id="discount" name="discountTest"> 할인 금액 :<br>
															${cart_product_qty*product_discount} 원
														</span>

													</div>

												</div>

											</div>

										</div>
										<!-- /PRODUCT -->
										<!--
									GIFT
									<div class="row">

										<div class="col-12 col-sm-12 col-md-2 col-lg-2"></div>

										<div class="col-12 col-sm-12 col-md-10 col-lg-10">

											<div class="font-weight-medium mb-1 border-top pt-3 mt-2">
												<i class="fi fi-gift text-muted"></i>
												<span class="d-inline-block px-2">Your Gift</span>
											</div>

											<span class="float-end text-align-end text-muted fs--12">
												<span class="d-block">Gift value:</span>
												2000원
											</span>

											<img height="30" class="float-start" src="demo.files/images/unsplash/products/thumb_330/imani-clovis-LxVxPA1LOVM-unsplash-min.jpg" alt="...">

											<a class="text-dark fs--13 d-block pt--4" href="#!">										
												1 &times; Product gift title
											</a>

										</div>
										
									</div>
									/GIFT-->
										<hr>
									</c:forEach>

								</div>
								<!-- /ITEM -->


								<!-- UPDATE CART -->
								<div class="clearfix mb-4 text-align-end">

									<button type="button" class="btn btn-sm btn-secondary"
										onclick="javascript:deleteAllProduct();">
										<!--"location.href ='${contextPath}/cart/deleteAllProduct.do'"; "javascript:deleteAllProduct();"  -->

										<i class="fi fi-go-back"></i> 장바구니 전체 비우기
									</button>

								</div>
								<!-- /UPDATE CART -->

							</form>

						</div>



						<div class="col-12 col-md-4 col-lg-3 order-md-2 mb-5">

							<div class="sticky-kit">
								<div class="mb-3 position-relative">
									<div class="bg-light p-3 rounded-xl">

										<!-- mobile : top arrow : documentation/util-misc.html -->
										<i
											class="arrow arrow-lg arrow-top arrow-center border-light d-block d-md-none"></i>
										<!-- desktop side arrow : documentation/util-misc.html -->
										<i
											class="arrow arrow-lg arrow-start mt-3 border-light d-none d-md-inline-block d-lg-inline-block d-xl-inline-block"></i>


										<h3 class="h5 border-bottom pb-3 mb-3">주문서</h3>


										<div class="border-bottom pb-3 mb-3">
											<div class="clearfix">
												상품금액: <span class="float-end font-weight-medium"
													id="total_price"> ${total_price} 원 </span>
											</div>

											<div class="clearfix">
												상품할인금액 : <span class="float-end" id="total_discount">
													${total_discount} 원 </span>
											</div>


											<div class="clearfix">
												배송비: <span class="float-end text-align-end">
													${shipping} 원 <!-- 	<a href="#!" class="fs--14">calculate</a> -->
												</span>
											</div>
										</div>


										<div class="clearfix mb-3">
											<h4 class="float-start fs--20">Total:</h4>
											<h4 class="float-end fs--20 " id="total-price">
												${total_price+shipping} 원</h4>
										</div>

										<div class="border-bottom pb-3 mb-2">

											<a href="${contextPath }/orders/checkout.do"
												class="btn btn-primary btn-block fs--14"> <span>주문하기</span>
												<i class="fi fi-arrow-end fs--12"></i>
											</a>

										</div>



										<!-- COUPON CODE
										<a href="#coupon_code" data-toggle="collapse" class="text-decoration-none m-0 text-dark">
											<span class="group-icon float-start fs--16">
												<i class="fi fs--15 fi-product-tag"></i>
												<i class="fi fs--14 fi-close"></i>
											</span>
											<span>Add Coupon Code</span>
										</a>

										<div id="coupon_code" class="collapse w-100">

											<div class="pt-3 w-100">
												<form novalidate class="bs-validate" method="post" action="#">

													<div class="input-group">

														<input required type="text" name="coupon_code" value="" class="form-control form-control-sm" placeholder="coupon code">
														
														<div class="input-group-append">
															<button class="btn btn-sm btn-secondary">Redeem</button>
														</div>

													</div>

												</form>
											</div>

										</div>
										 /COUPON CODE -->

									</div>
								</div>
							</div>

						</div>
					</div>

				</div>
			</section>
			<!-- /CART -->
		</c:otherwise>
	</c:choose>





	<!-- INFO BOX -->
	<section class="p-0 border-top">
		<div class="container py-3">

			<div class="row">

				<div class="col-6 col-lg-3 p--15 d-flex d-block-xs text-center-xs"
					data-aos="fade-in" data-aos-delay="150">

					<div class="pl--10 pr--20 fs--50 line-height-1 pt--6">
						<img width="60" height="60"
							src="${contextPath}/resources/demo.files/svg/ecommerce/money_bag.svg" alt="...">
					</div>

					<div class="my-2">

						<h2 class="font-weight-medium fs--20 mb-0">Money Back</h2>

						<p class="m-0">30-days money back</p>

					</div>

				</div>

				<div
					class="col-6 col-lg-3 p--15 d-flex d-block-xs text-center-xs border-dashed border-light bw--1 bt-0 br-0 bb-0 b--0-lg"
					data-aos="fade-in" data-aos-delay="250">

					<div class="pl--10 pr--20 fs--50 line-height-1 pt--6">
						<img width="60" height="60"
							src="${contextPath}/resources/demo.files/svg/ecommerce/free-delivery-truck.svg" alt="...">
					</div>

					<div class="my-2">

						<h2 class="font-weight-medium fs--20 mb-0">Free Shipping</h2>

						<p class="m-0">Shipping is on us</p>

					</div>

				</div>

				<div
					class="col-6 col-lg-3 p--15 d-flex d-block-xs text-center-xs border-dashed border-light bw--1 bl-0 br-0 bb-0 b--0-lg"
					data-aos="fade-in" data-aos-delay="350">

					<div class="pl--10 pr--20 fs--50 line-height-1 pt--6">
						<img width="60" height="60"
							src="${contextPath}/resources/demo.files/svg/ecommerce/24-hours-phone-service.svg"
							alt="...">
					</div>

					<div class="my-2">

						<h2 class="font-weight-medium fs--20 mb-0">Free Support</h2>

						<p class="m-0">24/24 available</p>

					</div>

				</div>

				<div
					class="col-6 col-lg-3 p--15 d-flex d-block-xs text-center-xs border-dashed border-light bw--1 bb-0 br-0 b--0-lg"
					data-aos="fade-in" data-aos-delay="450">

					<div class="pl--10 pr--20 fs--50 line-height-1 pt--6">
						<img width="60" height="60"
							src="${contextPath}/resources/demo.files/svg/ecommerce/handshake.svg" alt="...">
					</div>

					<div class="my-2">

						<h2 class="font-weight-medium fs--20 mb-0">Best Deal</h2>

						<p class="m-0">Quality guaranteed</p>

					</div>


				</div>

			</div>

		</div>
	</section>
	<!-- /INFO BOX -->
</body>

