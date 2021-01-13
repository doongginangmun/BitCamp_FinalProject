<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%
   request.setCharacterEncoding("UTF-8");
%>


<c:if test="${not empty msg }">
	<script>
		alert("게시글 작성자가 아닙니다");
	</script>
</c:if>

<script type="text/javascript">
var quantity="0";
var opt_name;

function changeOption() {
	var selectOpt = document.getElementById("opt");
	var tmp = selectOpt.options[selectOpt.selectedIndex].text;
	var tmp1 = tmp.lastIndexOf("원");
	var num = tmp.indexOf("[");
	var str = tmp.substring(0,num);
	opt_name = str.trim();
}
function changeQuantity() {

	var selectOpt =  document.getElementById("opt_quantity");
	    quantity  = parseInt(selectOpt.options[selectOpt.selectedIndex].text);
}
function add_cart(product_name,quantity,opt_name) {
	if(${not empty optionList} && !opt_name){
		alert("옵션을 선택해주세요");
		return;
	}
	
	if(quantity==0){
		alert("수량옵션을 선택해주세요");
		return;
	}
	if(!opt_name){
		opt_name="";
	}
	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/cart/addProductInCart.do",
		data : {
			product_name:product_name,
			quantity:quantity,
			option_name:opt_name
		},
		success : function(data, textStatus) {
			if(data.trim()=='add_success'){
				alert("카트에 등록되었습니다.");
			}else if(data.trim()=='already_existed'){
				alert("이미 카트에 등록된 상품입니다.");	
			}else if(data.trim()=='logingo'){
				alert("로그인을 먼저 해주세요.");
			}
		},
		error : function(data, textStatus) {
		},
		complete : function(data, textStatus) {
		}
	}); //end ajax	

}
</script>

<!-- 여기서부터 -->
<!-- PRODUCT -->
<section class="pt-5">
	<div class="container">

		<!-- Breadcrumbs -->
		<div class="mb-5">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb fs--14">
					<li class="breadcrumb-item"><a href="${contextPath}/main/main.do">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">
						${vo.product_category_name }</li>
				</ol>
			</nav>

		</div>
		<!-- /Breadcrumbs -->


		<div class="row">

			<div class="col-lg-7 col-md-6 order-1 mb-5">

				<div class="row">

					<!-- SECONDARY SWIPER : THUMBS -->
					<div class="col-12 order-2">
						 
						<img src="${contextPath}/resources/images/product/${vo.product_id}/${vo.product_image}">
						
						
					</div>


					<!-- PRIMARY SWIPER -->
					<div class="col-12 order-1">
						
						<div id="swiper_primary"
							class="swiper-container swiper-preloader swiper-white mx-auto"
							data-swiper-link="swiper_secondary"
							data-swiper='{
                                 "slidesPerView": 1,
                                 "spaceBetween": 0,
                                 "autoplay": false,
                                 "loop": true,
                                 "zoom": true,
                                 "effect": "slide",
                                 "loopedSlides": 1,
                                 "breakpoints": {
                                    "920":    { "slidesPerView": "1" }
                                 }
                              }'>
						</div>
						<!-- /SWIPER SLIDER -->
					</div>

				</div>
			</div>


			<div class="col-lg-5 col-md-6 order-2 mb-5">

				<div class="clearfix">
					<!-- sticky-kit -->

					<!-- SUPPLIER & TITLE -->
					<h4 class="h2 h3-xs font-weight-medium mb-5">
						[${vo.supplier}]${vo.product_name} <span
							class="d-block text-muted fs--14">${vo.product_detail}</span>
					</h4>

					<!-- Form -->
					<form novalidate class="bs-validate" method="post" action="#"
						data-error-scroll-up="true">


						<!-- PRICE -->
						<div class="clearfix mb-5">

							<p class="text-muted m-0">
								<del>
									<fmt:formatNumber type="number" value="${vo.price}" />
									원
								</del>
								<span class="text-success font-light fs--14">(
									${vo.discount}%) 
								</span>
							</p>

							<p class="fs--25 m-0 font-weight-medium text-danger">

								<span class="item-price"><fmt:formatNumber
										type="number" value="${vo.sale_price}" />원</span>
							</p>

						</div>
                           <!--  상세 정보  -->
                           <table class="table">
                              <tbody>
                                 <tr>
                                    <th scope="row">판매단위</th>
                                    <td>${vo.sales_unit }</td>
                                 </tr>
                                 <tr>
                                    <th scope="row">상품용량</th>
                                    <td>${vo.product_size }</td>
                                 </tr>
                                 <tr>
                                    <th scope="row">포장타입</th>
                                    <td>${vo.packing_type }</td>
                                 </tr>
                              </tbody>
                           </table>
                           
                           <!-- 상품 옵션!! -->
                           <!-- Basic -->
                           <c:if test="${not empty optionList }" >
                              <select id="opt" class="form-control bs-select" name="option_name" title="Please Select..." onChange="changeOption();" required>
                                 <c:forEach var="option" items="${optionList }">
                                    <option value="${option.option_name }">${option.option_name } [<fmt:formatNumber type="number" value="${option.option_price }"/> 원]</option>
                                 </c:forEach>
                              </select>
                           </c:if>
                           <br>
                           <select id="opt_quantity" class="form-control bs-select" name="option_quantity" title="Please Select..." onChange="changeQuantity();" required>
                              <c:forEach var="i" begin="1" end="10" step="1">
                                 <option value="i">${i }개</option>
                              </c:forEach>
                           </select>


						<!-- ADD TO CART -->
						<div class="clearfix d-flex d-block-xs">

							<!-- ADD TO CART BUTTON -->
							<div
								class="d-inline-flex w-100-xs float-start float-none-xs ml-0 mr-0 mt-2">

								<!-- QUANTITY INPUT -->
								<div>
									<span
										class="js-form-advanced-limit-info badge badge-warning hide animate-bouncein position-absolute absolute-top start-0 m-1 z-index-5">
										please, order between 1 and 99. </span> <input required type="number"
										name="qty" value="1" step="1" min="0" max="99"
										class="form-control text-center js-form-advanced-limit w--80 h-100 m-0"
										data-toggle="tooltip" data-original-title="quantity">
								</div>

						<!-- 상품 담기 -->
                                 <div class="pl-2 pr-2 w-100-xs"> 
                                    <button class="btn btn-danger bg-gradient-danger text-white px-4 b-0 d-block-xs w-100-xs"
                   		 onclick="javascript:add_cart('${vo.product_name}',quantity,opt_name)"> 
                   		
                                       <span class="px-4 p-0-xs">
                                          <i>
                                             <svg width="22px" height="22px" x="0px" y="0px" viewBox="0 10 459.529 500.529">
                                                <path fill="#ffffff" d="M17,55.231h48.733l69.417,251.033c1.983,7.367,8.783,12.467,16.433,12.467h213.35c6.8,0,12.75-3.967,15.583-10.2    l77.633-178.5c2.267-5.383,1.7-11.333-1.417-16.15c-3.117-4.817-8.5-7.65-14.167-7.65H206.833c-9.35,0-17,7.65-17,17    s7.65,17,17,17H416.5l-62.9,144.5H164.333L94.917,33.698c-1.983-7.367-8.783-12.467-16.433-12.467H17c-9.35,0-17,7.65-17,17    S7.65,55.231,17,55.231z"></path>
                                                <path fill="#ffffff" d="M135.433,438.298c21.25,0,38.533-17.283,38.533-38.533s-17.283-38.533-38.533-38.533S96.9,378.514,96.9,399.764    S114.183,438.298,135.433,438.298z"></path>
                                                <path fill="#ffffff" d="M376.267,438.298c0.85,0,1.983,0,2.833,0c10.2-0.85,19.55-5.383,26.35-13.317c6.8-7.65,9.917-17.567,9.35-28.05    c-1.417-20.967-19.833-37.117-41.083-35.7c-21.25,1.417-37.117,20.117-35.7,41.083    C339.433,422.431,356.15,438.298,376.267,438.298z"></path>
                                             </svg>
										</i> <span class="fs--18">Add to cart</span>
										</span>

										<!-- free shipping : optional : good for conversions -->
										<span class="d-block pt-2 pb-1"> <span class="hr"></span>
											<span class="font-light fs--13 opacity-7 d-block mt-2">
												free shipping </span>
										</span>
										<!-- /free shipping : optional : good for conversions -->

									</button>
								</div>

							</div>

							<!-- ADD TO FAVOURITES BUTTON -->
							<c:choose>
								<c:when test="${isLogOn==true and not empty memberInfo }">
									<div class="w--60 mt-2 w-100-xs float-start float-none-xs mt-2">
										<a href="#"
											class="btn-toggle btn btn-light h-100 d-flex justify-content-center align-items-center"
											data-toggle="tooltip" data-original-title="찜 리스트에 담기"
											data-toggle-ajax-url-on="${contextPath}/myaccount/addFav.do?product_id=${vo.product_id}"
											data-toast-success-message="찜 리스트에 담겼습니다."
											data-toast-success-position="bottom-center"> <!-- heart icon -->
											<i class="m-0 fi fi-heart-empty"></i> <!-- text : mobile only -->
											<span class="pl-3 pr-3 d-block d-sm-none"> 찜 리스트에 담기 </span>
										</a>

									</div>

								</c:when>
								<c:otherwise>
									<div class="w--60 mt-2 w-100-xs float-start float-none-xs mt-2">
										<a href="#"
											class="js-ajax-modal btn btn-light h-100 d-flex justify-content-center align-items-center"
											data-toggle="tooltip" data-original-title="찜 리스트에 담기"
											data-href="${contextPath }/resources/_ajax/modal_signin_md.jsp?product_id=${vo.product_id}"
											data-ajax-modal-size="modal-md"
											data-ajax-modal-backdrop="static"
											data-ajax-modal-centered="true"> <i
											class="m-0 fi fi-heart-empty"></i> <span
											class="pl-3 pr-3 d-block d-sm-none"> 찜 리스트에 담기 </span>
										</a>
									</div>
								</c:otherwise>

							</c:choose>


						</div>
						<!-- /ADD TO CART -->

						<!-- stock info -->
						<span class="d-block text-muted fs--11 mt-1 pl-2 pr-2"> 99
							in stock </span>
						<!-- /ADD TO CART -->
					</form>
					<!-- /Form -->
				</div>
			</div>
		</div>
	</div>
</section>
<!-- /PRODUCT -->


<!-- SPECIFICATIONS -->
<section class="border-top">
	<div class="container">
		<img src="${contextPath}/resources/images/product/${vo.product_id}/${vo.product_detail_image}" />
		
	</div>
</section>
<!-- /SPECIFICATIONS -->

<!-- 상문 문의  -->
<jsp:include page="productQna.jsp" flush="true">
	<jsp:param value="productQna" name="productQna"/>
</jsp:include>
<!-- 상문 문의  -->

<!-- 상품 후기 -->
<jsp:include page="productReview.jsp" flush="true">
	<jsp:param value="productReview" name="productReview"/>
</jsp:include>
<!-- 상품 후기 -->



<!-- /#wrapper -->

<script src="${contextPath}/resources/assets/js/core.min.js"></script>

