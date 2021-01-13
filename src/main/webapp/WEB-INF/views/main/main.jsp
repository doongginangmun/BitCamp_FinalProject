<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"   isELIgnored="false"
   %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:if test='${not empty message }'>
	<script>
		alert('${message}');
	</script>
</c:if>
<c:set var="contextPath"  value="${pageContext.request.contextPath }"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  


         <!-- 
            SWIPER 
         -->
         <section class="p-0 position-relative overflow-hidden">

            <!--
               Height
                  .h-50vh
                  .h-75vh
                  .h-100vh
            -->
            <div class="swiper-container swiper-btn-group swiper-btn-group-end text-white h-75vh overflow-hidden"
               data-swiper='{
                  "slidesPerView": 1,
                  "spaceBetween": 0,
                  "autoplay": { "delay" : 6500, "disableOnInteraction": true },
                  "loop": true,
                  "effect": "fade",
                  "pagination": { "type": "bullets" }
               }'>

               <div class="swiper-wrapper h-100">

                  <!-- slide 1 -->
                     <a href="#!" class="h-100 swiper-slide d-middle overlay-dark overlay-opacity-5 bg-cover text-decoration-none text-white lazy" style="background-image:url('${contextPath}/resources/images/steak1.jpg')">
                     <div class="position-relative container z-index-10 text-white text-center" data-aos="fade-in" data-aos-delay="150" data-aos-offset="0">

                        <h2 class="display-3 h1-xs mb-4 font-weight-medium" data-swiper-parallax="-300">
                           고기 <span class="text-danger">고기</span> 있소?
                        </h2>

                        <div data-swiper-parallax="-100"><!-- parallax directly on button will cancel hover fade -->
                           <span class="btn btn-lg btn-outline-light shadow-none transition-hover-top">
                              고기 먹기
                           </span>
                        </div>

                     </div>
                  </a>
                  <!-- /slide 1 -->


                  <!-- slide 2 -->
                  <div class="h-100 swiper-slide d-middle overlay-dark overlay-opacity-5 bg-cover text-decoration-none text-white" style="background-image:url('${contextPath}/resources/images/bread1.jpg')">
                     <div class="position-absolute container z-index-10 text-white text-center" data-aos="fade-in" data-aos-delay="150" data-aos-offset="0">

                        <h1 class="display-3 h1-xs mb-4 font-weight-medium" data-swiper-parallax="-300">
                           간단한 <span class="text-danger">브런치</span> 어때요?
                        </h1>

                        <div data-swiper-parallax="-100"><!-- parallax directly on button will cancel hover fade -->
                           <a href="#!" class="btn btn-lg btn-outline-light shadow-none transition-hover-top">
                              점심 먹기
                           </a>
                        </div>

                     </div>
                  </div>

                  <!-- /slide 2 -->

               </div>

               <!-- Add Arrows -->
               <div class="swiper-button-next swiper-button-black"></div>
               <div class="swiper-button-prev swiper-button-black"></div>

               <!-- Add Pagination -->
               <div class="swiper-pagination top-0 h--30 mt-4"></div>

               <!-- v shape : .bg-light, .shape-xs (remove .shape-xs for .h-100vh container) -->
               <div class="shape-v shape-xs bottom-0"></div>

            </div>

         </section>
         <!-- /SWIPER -->





         <!-- INFO BOX -->
         <section class="py-0 border-bottom-xs">
            <div class="container py-3">

               <div class="row">

                  <div class="col-6 col-lg-3 p--15 d-flex d-block-xs text-center-xs">

                     <div class="pl--10 pr--20 fs--50 line-height-1 pt--6">
                        <img width="60" height="60" src="${contextPath}/resources/demo.files/svg/ecommerce/money_bag.svg" alt="...">
                     </div>

                     <div class="my-2">
                        
                        <h2 class="font-weight-medium fs--20 mb-0">
                           최저가 보장
                        </h2>

                        <p class="m-0">
                           30-days money back
                        </p>

                     </div>

                  </div>

                  <div class="col-6 col-lg-3 p--15 d-flex d-block-xs text-center-xs border-dashed border-light bw--1 bt-0 br-0 bb-0 b--0-lg">

                     <div class="pl--10 pr--20 fs--50 line-height-1 pt--6">
                        <img width="60" height="60" src="${contextPath}/resources/demo.files/svg/ecommerce/free-delivery-truck.svg" alt="...">
                     </div>

                     <div class="my-2">
                        
                        <h2 class="font-weight-medium fs--20 mb-0">
                           무료 배송
                        </h2>

                        <p class="m-0">
                           Shipping is on us
                        </p>

                     </div>

                  </div>

                  <div class="col-6 col-lg-3 p--15 d-flex d-block-xs text-center-xs border-dashed border-light bw--1 bl-0 br-0 bb-0 b--0-lg">

                     <div class="pl--10 pr--20 fs--50 line-height-1 pt--6">
                        <img width="60" height="60" src="${contextPath}/resources/demo.files/svg/ecommerce/24-hours-phone-service.svg" alt="...">
                     </div>

                     <div class="my-2">
                        
                        <h2 class="font-weight-medium fs--20 mb-0">
                           고객센터
                        </h2>

                        <p class="m-0">
                           24/24 available
                        </p>

                     </div>

                  </div>

                  <div class="col-6 col-lg-3 p--15 d-flex d-block-xs text-center-xs border-dashed border-light bw--1 bb-0 br-0 b--0-lg">

                     <div class="pl--10 pr--20 fs--50 line-height-1 pt--6">
                        <img width="60" height="60" src="${contextPath}/resources/demo.files/svg/ecommerce/handshake.svg" alt="...">
                     </div>

                     <div class="my-2">
                        
                        <h2 class="font-weight-medium fs--20 mb-0">
                           품질 보장
                        </h2>

                        <p class="m-0">
                           Quality guaranteed
                        </p>

                     </div>

                  </div>

               </div>

            </div>
         </section>
         <!-- /INFO BOX -->




         <!-- OFFER BLOCK -->
         <section>
            <div class="container">


               <div class="mb-7 text-center px-3">
                  <h2 class="h3-xs text-center-xs font-weight-normal text-danger">
                     어떻게 먹어도 맛있는 <b>소고기 최대 30% 할인</b>
                  </h2>
                  
                  <p class="lead max-w-600 mx-auto">
                     ~12월 7일(월) 11시 
                  </p>
               </div>



               <!-- product list -->
               <div class="row gutters-xs--xs">


                  <!-- 
                     
                     MAIN/FEATURED
                     please pay attention to how order-* is set!
                     See on mobile how looks like! Play to set as desired!

                     You can also insert this "featured" anywhere
                     between them as long .order-2 class is present!

                  -->
                  <div class="order-2 col-12 col-lg-6 mb-4 mb-2-xs">

                     <div class="bg-white shadow-md shadow-danger-lg-hover transition-all-ease-250 transition-hover-top rounded show-hover-container p-2 h-100">

                        <a  href="${contextPath}/product/productDetail.do?product_id=${bestlist[0].product_id}" 
                           class="card position-relative h-100 b-0 rounded text-decoration-none overflow-hidden bg-cover text-white overlay-dark overlay-opacity-0" 
                           style="background-image:linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.5)), url('${contextPath}/resources/images/product/${bestlist[0].product_id}/${bestlist[0].product_image}');">
                           <!-- style="background-image:url('${contextPath}/resources/demo.files/images/unsplash/products/sneakers/joshua-hanson-FCcNHcylc9o-unsplash.jpg')"> -->

                           <div class="card-body p-4">

                              <!-- 
                                 typed plugin 
                                 /documentation/plugins-vendor-typed.html
                              -->
                              <span class="typed text-warning h5" 
                                    data-typed-string="Just Arrived|베스트 상품|기간 한정세일"
                                    data-typed-speed-forward="40" 
                                    data-typed-speed-back="30" 
                                    data-typed-back-delay="700" 
                                    data-typed-loop-times="infinite" 
                                    data-typed-smart-backspace="true" 
                                    data-typed-shuffle="false" 
                                    data-typed-cursor="|">&nbsp;</span>


                              <h2 class="d-block">
                                 ${bestlist[0].product_name}
                              </h2>

                              <hr class="border-light opacity-2">

                              <!-- price -->
                              <span class="h5 d-block text-danger font-weight-medium">
                                 <del class="text-white">₩${bestlist[0].price}</del> 
                                 ₩<fmt:formatNumber value="${bestlist[0].price*((100-bestlist[0].discount)/100)}"/>
                              </span>

                              <!-- rating -->
                              <span class="d-block">
                                 <i class="rating-5 text-warning fs--14"></i>
                                 <span class="fs--12 text-muted">(4.7)</span>
                              </span>

                           </div>

                           <!--
                              
                              SOW Countdown timer
                              /documentation/plugins-sow-timer-countdown.html

                           -->
                           <div class="card-footer bg-transparent b-0">
                              <hr class="border-light opacity-2">
                              
                              <span class="float-end fs--14 p-2">
                                 limited
                              </span>

                              <div class="hide timer-countdown timer-countdown-inline fs--13" 
                                 data-timer-countdown-from="12/25/2020 16:00:00">

                                 <span class="w--50 text-center shadow-xs d-inline-block">
                                    <span class="d d-block"></span>
                                    days
                                 </span>

                                 <span class="w--50 text-center shadow-xs d-inline-block">
                                    <span class="h d-block"></span>
                                    hrs
                                 </span>

                                 <span class="w--50 text-center shadow-xs d-inline-block">
                                    <span class="m d-block"></span>
                                    min
                                 </span>

                                 <span class="w--50 text-center shadow-xs d-inline-block">
                                    <span class="s d-block"></span>
                                    sec
                                 </span>

                              </div>

                           </div>


                        </a>

                     </div>

                  </div>
                  <!-- /SPECIAL PRODUCT -->


                  <!-- item -->
                  <div class="order-1 col-6 col-lg-3 mb-4 mb-2-xs">

                     <div class="bg-white shadow-xs shadow-3d-hover transition-all-ease-250 transition-hover-top rounded show-hover-container p-2 h-100">

                        <a href="${contextPath}/product/productDetail.do?product_id=${bestlist[1].product_id}" class="d-block text-decoration-none">

                           <!-- 
                              
                              3 ways to set the image

                           -->

                           <!-- 1. without .bg-suprime - use image as it is -->
                           <!--
                           <figure class="m-0 text-center rounded-top overflow-hidden">
                              <img class="img-fluid" src="image.jpg" alt="..."> 
                           </figure>
                           -->


                           <!-- 2. squared, as background -->
                           <!--
                           <figure class="m-0 text-center rounded-top overflow-hidden bg-cover" style="background-image:url('image.jpg')">
                              <img class="w-100" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="..."> 
                           </figure>
                           -->

                           <!-- 3. with .bg-suprime (remove white bg and add a gray bg) -->
                           <figure class="m-0 text-center bg-light-radial rounded-top overflow-hidden">
                              <img class="img-fluid bg-suprime opacity-9" src="${contextPath}/resources/images/product/${bestlist[1].product_id}/${bestlist[1].product_image}" alt="..."> 
                           </figure>

                           <span class="d-block text-center-xs text-gray-600 py-3">
                              
                              <!-- 
                                 .max-height-50  = limited to 2 rows of text 
                                 -or-
                                 .text-truncate
                              -->
                              <span class="d-block fs--16 max-h-50 overflow-hidden">
                                 <c:out value="${bestlist[1].product_name}" />
                              </span>

                              <!-- price -->
                              <span class="d-block text-danger font-weight-medium fs--16 mt-2">

                                 <del class="text-muted"><fmt:formatNumber value="${bestlist[1].price}" />원</del> 

                                 <fmt:formatNumber value="${bestlist[1].price*((100-bestlist[1].discount)/100)}"/>원
                              </span>

                              <!-- rating -->
                              <span class="d-block">
                                 <i class="rating-5 text-warning fs--14"></i>
                                 <span class="fs--12 text-muted">(4.7)</span>
                              </span>

                           </span>

                        </a>

                     </div>

                  </div>
                  <!-- /item -->


                  <!-- item -->
                  <div class="order-lg-2 col-6 col-lg-3 mb-4 mb-2-xs">

                     <div class="bg-white shadow-xs shadow-3d-hover transition-all-ease-250 transition-hover-top rounded show-hover-container p-2 h-100">

                        <a href="${contextPath}/product/productDetail.do?product_id=${bestlist[2].product_id}" class="d-block text-decoration-none">

                           <figure class="m-0 text-center bg-light-radial rounded-top overflow-hidden">
                              <img class="img-fluid bg-suprime opacity-9" src="${contextPath}/resources/images/product/${bestlist[2].product_id}/${bestlist[2].product_image}" alt="...">
                           </figure>

                           <span class="d-block text-center-xs text-gray-600 py-3">
                              
                              <!-- 
                                 .max-height-50  = limited to 2 rows of text 
                                 -or-
                                 .text-truncate
                              -->
                              <span class="d-block fs--16 max-h-50 overflow-hidden">
                                 <c:out value="${bestlist[2].product_name}" />
                              </span>

                              <!-- price -->
                              <span class="d-block text-danger font-weight-medium fs--16 mt-2">

                                 <del class="text-muted"><fmt:formatNumber value="${bestlist[2].price}" />원</del>  

                                 <fmt:formatNumber value="${bestlist[2].price*((100-bestlist[2].discount)/100)}"/>원
                              </span>

                              <!-- rating -->
                              <span class="d-block">
                                 <i class="rating-5 text-warning fs--14"></i>
                                 <span class="fs--12 text-muted">(4.7)</span>
                              </span>

                           </span>

                        </a>

                     </div>

                  </div>
                  <!-- /item -->















                  <!-- item -->
                  <div class="order-2 col-6 col-lg-3 mb-4 mb-2-xs">

                     <div class="bg-white shadow-xs shadow-3d-hover transition-all-ease-250 transition-hover-top rounded show-hover-container p-2 h-100">

                        <a href="${contextPath}/product/productDetail.do?product_id=${bestlist[3].product_id}" class="d-block text-decoration-none">

                           <figure class="m-0 text-center bg-light-radial rounded-top overflow-hidden">
                              <img class="img-fluid bg-suprime opacity-9" src="${contextPath}/resources/images/product/${bestlist[3].product_id}/${bestlist[3].product_image}" alt="...">
                           </figure>

                           <span class="d-block text-center-xs text-gray-600 py-3">
                              
                              <!-- 
                                 .max-height-50  = limited to 2 rows of text 
                                 -or-
                                 .text-truncate
                              -->
                              <span class="d-block fs--16 max-h-50 overflow-hidden">
                                 <c:out value="${bestlist[3].product_name}" />
                              </span>

                              <!-- price -->
                              <span class="d-block text-danger font-weight-medium fs--16 mt-2">

                                 <del class="text-muted"><fmt:formatNumber value="${bestlist[3].price}" />원</del> 

                                 <fmt:formatNumber value="${bestlist[3].price*((100-bestlist[3].discount)/100)}"/>원
                              </span>

                              <!-- rating -->
                              <span class="d-block">
                                 <i class="rating-5 text-warning fs--14"></i>
                                 <span class="fs--12 text-muted">(4.7)</span>
                              </span>

                           </span>

                        </a>

                     </div>

                  </div>
                  <!-- /item -->


                  <!-- item -->
                  <div class="order-2 col-6 col-lg-3 mb-4 mb-2-xs">

                     <div class="bg-white shadow-xs shadow-3d-hover transition-all-ease-250 transition-hover-top rounded show-hover-container p-2 h-100">

                        <a href="${contextPath}/product/productDetail.do?product_id=${bestlist[4].product_id}" class="d-block text-decoration-none">

                           <figure class="m-0 text-center bg-light-radial rounded-top overflow-hidden">
                              <img class="img-fluid bg-suprime opacity-9" src="${contextPath}/resources/images/product/${bestlist[4].product_id}/${bestlist[4].product_image}" alt="..."> 
                           </figure>

                           <span class="d-block text-center-xs text-gray-600 py-3">
                              
                              <!-- 
                                 .max-height-50  = limited to 2 rows of text 
                                 -or-
                                 .text-truncate
                              -->
                              <span class="d-block fs--16 max-h-50 overflow-hidden">
                                 <c:out value="${bestlist[4].product_name}" />
                              </span>

                              <!-- price -->
                              <span class="d-block text-danger font-weight-medium fs--16 mt-2">

                                 <del class="text-muted"><fmt:formatNumber value="${bestlist[4].price}" />원</del>  

                                 <fmt:formatNumber value="${bestlist[4].price*((100-bestlist[4].discount)/100)}"/>원
                              </span>

                              <!-- rating -->
                              <span class="d-block">
                                 <i class="rating-5 text-warning fs--14"></i>
                                 <span class="fs--12 text-muted">(4.7)</span>
                              </span>

                           </span>

                        </a>

                     </div>

                  </div>
                  <!-- /item -->


                  <!-- item -->
                  <div class="order-2 col-6 col-lg-3 mb-4 mb-2-xs">

                     <div class="bg-white shadow-xs shadow-3d-hover transition-all-ease-250 transition-hover-top rounded show-hover-container p-2 h-100">

                        <a href="${contextPath}/product/productDetail.do?product_id=${bestlist[5].product_id}" class="d-block text-decoration-none">

                           
                           <figure class="m-0 text-center bg-light-radial rounded-top overflow-hidden">
                              <img class="img-fluid bg-suprime opacity-9" src="${contextPath}/resources/images/product/${bestlist[5].product_id}/${bestlist[5].product_image}" alt="...">
                           </figure>

                           <span class="d-block text-center-xs text-gray-600 py-3">
                              
                              <!-- 
                                 .max-height-50  = limited to 2 rows of text 
                                 -or-
                                 .text-truncate
                              -->
                              <span class="d-block fs--16 max-h-50 overflow-hidden">
                                 <c:out value="${bestlist[5].product_name}" />
                              </span>

                              <!-- price -->
                              <span class="d-block text-danger font-weight-medium fs--16 mt-2">

                                 <del class="text-muted"><fmt:formatNumber value="${bestlist[5].price}" />원</del>  

                                 <fmt:formatNumber value="${bestlist[5].price*((100-bestlist[5].discount)/100)}"/>원
                              </span>

                              <!-- rating -->
                              <span class="d-block">
                                 <i class="rating-5 text-warning fs--14"></i>
                                 <span class="fs--12 text-muted">(4.7)</span>
                              </span>

                           </span>

                        </a>

                     </div>

                  </div>
                  <!-- /item -->


                  <!-- item -->
                  <div class="order-2 col-6 col-lg-3 mb-4 mb-2-xs">

                     <div class="bg-white shadow-xs shadow-3d-hover transition-all-ease-250 transition-hover-top rounded show-hover-container p-2 h-100">

                        <a href="${contextPath}/product/productDetail.do?product_id=${bestlist[6].product_id}" class="d-block text-decoration-none">

                           <figure class="m-0 text-center bg-light-radial rounded-top overflow-hidden">
                              <img class="img-fluid bg-suprime opacity-9" src="${contextPath}/resources/images/product/${bestlist[6].product_id}/${bestlist[6].product_image}" alt="..."> 
                           </figure>

                           <span class="d-block text-center-xs text-gray-600 py-3">
                              
                              <!-- 
                                 .max-height-50  = limited to 2 rows of text 
                                 -or-
                                 .text-truncate
                              -->
                              <span class="d-block fs--16 max-h-50 overflow-hidden">
                                 <c:out value="${bestlist[6].product_name}" />
                              </span>

                              <!-- price -->
                              <span class="d-block text-danger font-weight-medium fs--16 mt-2">

                                 <del class="text-muted"><fmt:formatNumber value="${bestlist[6].price}" />원</del>  

                                 <fmt:formatNumber value="${bestlist[6].price*((100-bestlist[6].discount)/100)}"/>원
                              </span>

                              <!-- rating -->
                              <span class="d-block">
                                 <i class="rating-5 text-warning fs--14"></i>
                                 <span class="fs--12 text-muted">(4.7)</span>
                              </span>

                           </span>

                        </a>

                     </div>

                  </div>
                  <!-- /item -->

                  

               </div>
               <!-- /product list -->


            </div>
         </section>
         <!-- /OFFER BLOCK -->





         <!-- SUBSCRIBE -->
         <section class="bg-light py-2">
            <div class="container">

               <div class="row">

                  <div class="col-10 mx-auto col-lg-8 py-5 pb-0-xs text-center-md text-center-xs">
                     <h3 class="m-0">쩝쩝박사의 <span class="text-danger">맛있는 할인정보 </span>받아보기</h3>
                     <p class="m-0">매주 달라지는 쩝쩝박사의 할인정보 놓치지 마지고 이메일로 받아보세요!</p>
                  </div>

                  <div class="col-10 mx-auto col-lg-4 py-4">

                     <form id="form" novalidate class="bs-validate py-3 mt-1 input-group-over input-group-pill"> 
                           
                        <input required class="form-control form-control-lg font-weight-light text-center-md text-center-xs" id="email" name="email" type="email" value="" placeholder="email address..." aria-label="email address...">

                        <button aria-label="subscribe" type="submit" class="btn bg-transparent shadow-none" onclick="sendEmail()"> 
                           <i class="fi fi-send fs--18"></i> 
                        </button>

                     </form>

                  </div>

               </div>

            </div>
         </section>
         <!-- /SUBSCRIBE -->




         <!-- 신상품 -->
         <section>
            <div class="container">


               <div class="mb-7 text-center px-3">
                  <h2 class="h3-xs text-center-xs font-weight-normal text-danger">
                     신상품 <b> 최대 30% 할인</b>
                  </h2>
                  
                  <p class="lead max-w-600 mx-auto">
                     ~12월 7일(월) 11시 
                  </p>
               </div>



               <!-- NEW PRODUCT LIST -->
               <div class="row gutters-xs--xs">


                  <!-- 
                     
                     MAIN/FEATURED
                     please pay attention to how order-* is set!
                     See on mobile how looks like! Play to set as desired!

                     You can also insert this "featured" anywhere
                     between them as long .order-2 class is present!

                  -->
                  
                  <!-- /SPECIAL PRODUCT -->


                  <!-- item -->
                  <c:forEach var="newlist" items="${newlist}" begin="0" end="3">
                     <div class="order-2 col-6 col-lg-3 mb-4 mb-2-xs">

                     <div class="bg-white shadow-xs shadow-3d-hover transition-all-ease-250 transition-hover-top rounded show-hover-container p-2 h-100">

                        <a href="${contextPath}/product/productDetail.do?product_id=${newlist.product_id}" class="d-block text-decoration-none">

                           <!-- 
                              
                              3 ways to set the image

                           -->

                           <!-- 1. without .bg-suprime - use image as it is -->
                           <!--
                           <figure class="m-0 text-center rounded-top overflow-hidden">
                              <img class="img-fluid" src="image.jpg" alt="..."> 
                           </figure>
                           -->


                           <!-- 2. squared, as background -->
                           <!--
                           <figure class="m-0 text-center rounded-top overflow-hidden bg-cover" style="background-image:url('image.jpg')">
                              <img class="w-100" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="..."> 
                           </figure>
                           -->

                           <!-- 3. with .bg-suprime (remove white bg and add a gray bg) -->
                           <figure class="m-0 text-center bg-light-radial rounded-top overflow-hidden">
                              <img class="img-fluid bg-suprime opacity-9" src="${contextPath}/resources/images/product/${newlist.product_id}/${newlist.product_image}" alt="...">
                           </figure>

                           <span class="d-block text-center-xs text-gray-600 py-3">
                              
                              <!-- 
                                 .max-height-50  = limited to 2 rows of text 
                                 -or-
                                 .text-truncate
                              -->
                              <span class="d-block fs--16 max-h-50 overflow-hidden">
                                 <c:out value="${newlist.product_name}" />
                              </span>

                              <!-- price -->
                              <span class="d-block text-danger font-weight-medium fs--16 mt-2">

                                 <del class="text-muted"><fmt:formatNumber value="${newlist.price}" />원</del>  

                                 <fmt:formatNumber value="${newlist.price*((100-newlist.discount)/100)}"/>원
                              </span>

                              <!-- rating -->
                              <span class="d-block">
                                 <i class="rating-5 text-warning fs--14"></i>
                                 <span class="fs--12 text-muted">(4.7)</span>
                              </span>

                           </span>

                        </a>

                     </div>

                  </div>
               </c:forEach>
                  <!-- /item -->
                           
               </div>
               <!-- /product list -->


            </div>
         </section>
         <!-- /NEW PRODUCT LIST -->





         <!-- INFO BOX -->
         <section class="bg-light py-0">
            <div class="container py-3">

               <div class="row">

                  <div class="col-6 col-lg-3 p--15 d-flex d-block-xs text-center-xs">

                     <div class="pl--10 pr--20 fs--50 line-height-1 pt--6">
                        <img width="60" height="60" src="${contextPath}/resources/demo.files/svg/ecommerce/money_bag.svg" alt="...">
                     </div>

                     <div class="my-2">
                        
                        <h2 class="font-weight-medium fs--20 mb-0">
                           최저가 보장
                        </h2>

                        <p class="m-0">
                           30-days money back
                        </p>

                     </div>

                  </div>

                  <div class="col-6 col-lg-3 p--15 d-flex d-block-xs text-center-xs border-dashed border-light bw--1 bt-0 br-0 bb-0 b--0-lg">

                     <div class="pl--10 pr--20 fs--50 line-height-1 pt--6">
                        <img width="60" height="60" src="${contextPath}/resources/demo.files/svg/ecommerce/free-delivery-truck.svg" alt="...">
                     </div>

                     <div class="my-2">
                        
                        <h2 class="font-weight-medium fs--20 mb-0">
                           무료배송
                        </h2>

                        <p class="m-0">
                           Shipping is on us
                        </p>

                     </div>

                  </div>

                  <div class="col-6 col-lg-3 p--15 d-flex d-block-xs text-center-xs border-dashed border-light bw--1 bl-0 br-0 bb-0 b--0-lg">

                     <div class="pl--10 pr--20 fs--50 line-height-1 pt--6">
                        <img width="60" height="60" src="${contextPath}/resources/demo.files/svg/ecommerce/24-hours-phone-service.svg" alt="...">
                     </div>

                     <div class="my-2">
                        
                        <h2 class="font-weight-medium fs--20 mb-0">
                           고객센터
                        </h2>

                        <p class="m-0">
                           24/24 available
                        </p>

                     </div>

                  </div>

                  <div class="col-6 col-lg-3 p--15 d-flex d-block-xs text-center-xs border-dashed border-light bw--1 bb-0 br-0 b--0-lg">

                     <div class="pl--10 pr--20 fs--50 line-height-1 pt--6">
                        <img width="60" height="60" src="${contextPath}/resources/demo.files/svg/ecommerce/handshake.svg" alt="...">
                     </div>

                     <div class="my-2">
                        
                        <h2 class="font-weight-medium fs--20 mb-0">
                           품질보장
                        </h2>

                        <p class="m-0">
                           Quality guaranteed
                        </p>

                     </div>

                  </div>

               </div>

            </div>
         </section>
         <!-- /INFO BOX -->
         
         	<div class="container py-5">

		<div class="row">

			<div class="col-12 col-lg-8">

				<div class="row mb-3">

					<!-- Col 1 -->
					<div class="col-12 col-lg-4 mb-1">

						<!-- mobile only : SOW Toggle Button -->
						<button
							class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none"
							data-target="#footer_c1"
							data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">

							<span class="group-icon p-2 float-start">
								<i class="fi fi-bars-2"></i>
								<i class="fi fi-close"></i>
							</span>

							<span class="h5 py-2 m-0 float-start">
								주문
							</span>
						</button>

						<!-- desktop only -->
						<h3 class="h5 py-3 m-0 d-none d-lg-block">
							주문
						</h3>


						<!-- navigation -->
						<ul id="footer_c1" class="nav flex-column d-none d-lg-block">
							<li class="list-item">
								<a class="d-block py-1" href="#!">My Account</a>
							</li>

							<li class="list-item">
								<a class="d-block py-1" href="#!">How do I order?</a>
							</li>

							<li class="list-item">
								<a class="d-block py-1" href="#!">Payment Methods</a>
							</li>
						</ul>

					</div>

					<!-- Col 2 -->
					<div class="col-12 col-lg-4 mb-1">

						<!-- mobile only : SOW Toggle Button -->
						<button
							class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none"
							data-target="#footer_c2"
							data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">

							<span class="group-icon p-2 float-start">
								<i class="fi fi-bars-2"></i>
								<i class="fi fi-close"></i>
							</span>

							<span class="h5 py-2 m-0 float-start">
								살펴보기
							</span>
						</button>

						<!-- desktop only -->
						<h3 class="h5 py-3 m-0 d-none d-lg-block">
							살펴보기
						</h3>


						<!-- navigation -->
						<ul id="footer_c2" class="nav flex-column d-none d-lg-block">
							<li class="list-item">
								<a class="d-block py-1" href="blog-page-sidebar.html">Smarty Blog</a>
							</li>

							<li class="list-item">
								<a class="d-block py-1" href="#!">Shipping</a>
							</li>

							<li class="list-item">
								<a class="d-block py-1" href="#!">Cookies</a>
							</li>
						</ul>


					</div>

					<!-- Col 3 -->
					<div class="col-12 col-lg-4 mb-1">

						<!-- mobile only : SOW Toggle Button-->
						<button
							class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none"
							data-target="#footer_c3"
							data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">

							<span class="group-icon p-2 float-start">
								<i class="fi fi-bars-2"></i>
								<i class="fi fi-close"></i>
							</span>

							<span class="h5 py-2 m-0 float-start">
								고객센터
							</span>

						</button>

						<!-- desktop only -->
						<h3 class="h5 py-3 m-0 d-none d-lg-block">
							고객센터
						</h3>


						<!-- navigation -->
						<ul id="footer_c3" class="nav flex-column d-none d-lg-block">
							<li class="list-item">
								<a class="d-block py-1" href="#!">Refund Policy</a>
							</li>

							<li class="list-item">
								<a class="d-block py-1" href="#!">Privacy Policy</a>
							</li>

							<li class="list-item">
								<a class="d-block py-1" href="#!">Terms &amp; Conditions</a>
							</li>
						</ul>

					</div>

				</div>

			</div>


			<div class="col">

				<h5 class="text-danger my-3">
					쩝쩝박사 구독하기
				</h5>

				<form novalidate class="bs-validate" method="post" action="#">

					<div class="input-group mb-3">

						<input required type="email" name="subscribe_email" value="" class="form-control"
							placeholder="email address" aria-label="email address">

						<div class="input-group-append">
							<button class="btn btn-danger btn-soft">구독</button>
						</div>

					</div>

				</form>

			</div>

		</div>

	</div>

<script>
	$("#form").click(function(e){
		console.log('form close');
		$(this).find('form')[0].reset()
	});
	
	function sendEmail(){
		var email = $("#email").val();

		$.ajax({
			type:"POST",
			url: "${contextPath}/main/sendEmail.do",
			async : false,
			data: {
				"email":email
			},
			success:function(){
				$('#form').find('#email').val('');
				location.href="${contextPath}/main/main.do";
				alert("전송 성공");
			}
		})
	}
</script>

                     