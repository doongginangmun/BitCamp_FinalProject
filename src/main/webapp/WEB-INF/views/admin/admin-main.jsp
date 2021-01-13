<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath }"  />
<%
  request.setCharacterEncoding("UTF-8");
%>

<!-- MIDDLE -->
				<div id="middle" class="flex-fill">



					<!--
						PAGE TITLE
					-->
					<div class="page-title bg-transparent b-0">

						<h1 class="h4 mt-4 mb-0 px-3 font-weight-normal">
							Dashboard
						</h1>
						
					</div>
					



					<!-- Primary -->
					<section class="rounded mb-3">


						<!-- graph header -->
						<div class="clearfix fs--18 pt-2 pb-3 mb-3 border-bottom">

							<!-- save image -->
							<a href="#" data-chartjs-id="visitsvsorders" data-file-name="visitsvsorders" class="btn btn-sm btn-light rounded-circle chartjs-save float-end m-0" title="Save Chart" aria-label="Save Chart">
								<i class="fi fi-arrow-download m-0"></i>
							</a>
							<!-- /save image -->

							방문자 &amp; 주문량
							<small class="fs--11 text-muted d-block mt-1">MONTHLY REVENUE OF 2019</small>

						</div>
						<!-- /graph header -->



						<div class="row gutters-sm">

							<!-- MAIN GRAPH -->
							<div class="col-12 col-xl-8 mb-5">

								<div class="position-relative min-h-250 max-h-500 max-h-300-xs h-100">
									<canvas id="visitsvsorders" class="mb-5 chartjs" 
										data-chartjs-dots="false" 
										data-chartjs-legend="top" 
										data-chartjs-grid="true" 
										data-chartjs-tooltip="true" 

										data-chartjs-title="Visits &amp; Orders" 
										data-chartjs-xaxes-label="" 
										data-chartjs-yaxes-label="" 
										data-chartjs-line-width="5" 

										data-chartjs-type="line" 
										data-chartjs-labels='["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]' 
										data-chartjs-datasets='[{															
									        "label": 				"방문자",
									        "data": 				[20, 22, 24, 21, 23, 26, 24, 23, 21, 24, 23, 22],
									        "fill": 				true,
									        "backgroundColor": 			"rgba(255, 206, 86, 0.2)"
										},{
									        "label": 				"주문",
									        "data": 				[14, 16, 16, 14, 13, 12, 14, 14, 13, 14, 12, 10],
									        "fill": 				true,
									        "backgroundColor": 		"rgba(255, 206, 86, 0.4)"
										}]'></canvas>

								</div>

							</div>
							<!-- /MAIN GRAPH -->

						<!-- WIDGET : ORDERS -->
						<div class="col-12 col-xl-4 mb-3">

							<div class="portlet">
								
								<div class="portlet-header">

									<div class="float-end dropdown">

										<!-- dropdown -->
										<button type="button" class="dropdown-toggle btn btn-sm btn-soft btn-primary px-2 py-1 fs--15 mt--n3" id="dropdownOrders" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											<span class="js-trigger-text">Export</span>
											<i class="fi fi-arrow-down"></i>
										</button>

										<div class="prefix-link-icon prefix-icon-dot dropdown-menu dropdown-menu-invert mt-2" aria-labelledby="dropdownOrders">

											<div class="dropdown-header">
												Export Options
											</div>

											<a href="#!" class="dropdown-item">
												Export CSV
											</a>

											<a href="#!" class="dropdown-item">
												Export XLS
											</a>

											<a href="#!" class="dropdown-item">
												Export PDF
											</a>

											<a href="#!" class="dropdown-item">
												Print
											</a>

										</div>
										<!-- /dropdown -->

									</div>

									<span class="d-block text-muted text-truncate font-weight-medium">
										주문	
									</span>

								</div>


								<!-- content loaded via ajax! -->
								<div class="portlet-body max-h-500 scrollable-vertical scrollable-styled-dark">

									<!-- ORDER -->
									<a href="#!" class="clearfix d-block dropdown-item font-weight-medium p-3 rounded overflow-hidden border-bottom border-light">

										<!-- badge -->
										<span class="float-end font-weight-normal text-danger">$2155</span>

										<!-- icon -->
										<i class="text-success fi fi-cart-1 d-middle float-start fs--20 bg-light w--40 h--40 rounded-circle text-center"></i>

										<!-- products -->
										<p class="fs--14 m-0 text-truncate font-weight-normal">
											2 items
										</p>

										<!-- date -->
										<small class="text-muted d-block fs--11">
											3 hours ago
										</small>

									</a>
									<!-- /ORDER -->



									<!-- ORDER -->
									<a href="#!" class="clearfix d-block dropdown-item font-weight-medium p-3 rounded overflow-hidden border-bottom border-light">

										<!-- badge -->
										<span class="float-end font-weight-normal text-danger">$984.99</span>

										<!-- icon -->
										<i class="text-success fi fi-cart-1 d-middle float-start fs--20 bg-light w--40 h--40 rounded-circle text-center"></i>

										<!-- products -->
										<p class="fs--14 m-0 text-truncate font-weight-normal">
											3 items
										</p>

										<!-- date -->
										<small class="text-muted d-block fs--11">
											8 hours ago
										</small>

									</a>
									<!-- /ORDER -->



									<!-- ORDER -->
									<a href="#!" class="clearfix d-block dropdown-item font-weight-medium p-3 rounded overflow-hidden border-bottom border-light">

										<!-- badge -->
										<span class="float-end font-weight-normal text-danger">$2155</span>

										<!-- icon -->
										<i class="text-warning fi fi-cart-1 d-middle float-start fs--20 bg-light w--40 h--40 rounded-circle text-center"></i>

										<!-- products -->
										<p class="fs--14 m-0 text-truncate font-weight-normal">
											2 products
										</p>

										<!-- date -->
										<small class="text-warning d-block fs--11">
											12 hours ago
										</small>

									</a>
									<!-- /ORDER -->



									<!-- ORDER -->
									<a href="#!" class="clearfix d-block dropdown-item font-weight-medium p-3 rounded overflow-hidden border-bottom border-light">

										<!-- badge -->
										<span class="float-end font-weight-normal text-danger">$2155</span>

										<!-- icon -->
										<i class="text-danger fi fi-cart-1 d-middle float-start fs--20 bg-light w--40 h--40 rounded-circle text-center"></i>

										<!-- products -->
										<p class="fs--14 m-0 text-truncate font-weight-normal">
											2 products
										</p>

										<!-- date -->
										<small class="text-danger d-block fs--11">
											1 day ago
										</small>

									</a>
									<!-- /ORDER -->


								</div>


								<div class="d-flex align-self-baseline w-100 py-2">
									<a href="#!" class="btn btn-sm text-gray-500 b-0 fs--16 shadow-none font-weight-light">
										<i class="fi fi-arrow-end-slim"></i>
										<span>View All</span>
									</a>
								</div>

							</div>

						</div>
						<!-- /WIDGET : ORDERS -->

						</div>

					</section>
					<!-- /Primary -->


					<!-- WIDGETS -->
					<div class="row gutters-sm">

						<div class="col-12 col-md-6 col-xl-3 mb-3">

							<!-- small graph widget -->
							<div class="bg-white shadow-md text-dark p-5 rounded text-center">

								<span class="badge badge-light fs--45 w--100 h--100 badge-pill rounded-circle">
									<i class="fi fi-user-plus mt-1"></i>
								</span>

								<h3 class="fs--20 mt-5">
									회원 가입량
								</h3>

								<p>
									Last 30 days
								</p>

								<div class="position-relative max-h-200">
									<canvas class="chartjs" 
									    data-chartjs-dots="false" 
									    data-chartjs-legend="false" 
									    data-chartjs-grid="false" 
									    data-chartjs-tooltip="true" 

									    data-chartjs-line-width="3" 
									    data-chartjs-type="line" 

										data-chartjs-labels='["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]' 
									    data-chartjs-datasets='[{                                                           
									        "label":                    "Customers",
									        "data":                     [11, 11, 17, 11, 15, 12, 13, 12, 11, 12, 7, 8],
									        "fill":                     false,
									        "backgroundColor":          "rgba(255, 159, 64, 1)"
									    }]'
									></canvas>
								</div>

							</div>
							<!-- /small graph widget -->

						</div>



						<div class="col-12 col-md-6 col-xl-3 mb-3">

							<!-- small graph widget -->
							<div class="bg-white shadow-md text-dark p-5 rounded text-center">

								<span class="badge badge-light fs--45 w--100 h--100 badge-pill rounded-circle">
									<i class="fi fi-cart-1 mt-1"></i>
								</span>

								<h3 class="fs--20 mt-5">
									월별 주문량
								</h3>

								<p>
									Last 30 days
								</p>

								<div class="position-relative max-h-200">
									<canvas class="chartjs" 
									    data-chartjs-dots="false" 
									    data-chartjs-legend="false" 
									    data-chartjs-grid="false" 
									    data-chartjs-tooltip="true" 

									    data-chartjs-line-width="3" 
									    data-chartjs-type="line" 

										data-chartjs-labels='["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]' 
									    data-chartjs-datasets='[{                                                           
									        "label":                    "Orders",
									        "data":                     [11, 11, 17, 11, 15, 12, 13, 16, 11, 18, 20, 21],
									        "fill":                     false,
									        "backgroundColor":          "rgba(54, 162, 235, 1)"
									    }]'
									></canvas>
								</div>

							</div>
							<!-- /small graph widget -->
							
						</div>




						<div class="col-12 col-xl-6 mb-3">


							<div class="portlet">
								
								<div class="portlet-header">

									<div class="float-end dropdown">

										<!-- dropdown -->
										<button type="button" class="dropdown-toggle btn btn-sm btn-soft btn-primary px-2 py-1 fs--15 mt--n3" id="dropdownGraph1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											<i class="fi fi-dots-vertical m-0"></i>
										</button>

										<div class="prefix-link-icon prefix-icon-dot dropdown-menu dropdown-menu-invert mt-2" aria-labelledby="dropdownGraph1">

											<div class="dropdown-header">
												Export Options
											</div>

											<a href="#!" class="dropdown-item">
												Export CSV
											</a>

											<a href="#!" class="dropdown-item">
												Export XLS
											</a>

											<a href="#!" class="dropdown-item">
												Export PDF
											</a>

											<a href="#!" class="dropdown-item">
												Print
											</a>

										</div>
										<!-- /dropdown -->

									</div>

									<span class="d-block text-muted text-truncate font-weight-medium">
										증가량 그래프
									</span>
								</div>

								<div class="portlet-body max-h-500 scrollable-vertical scrollable-styled-dark tab-content">


								<div class="position-relative min-h-250 max-h-300-xs h-100">
									<canvas class="chartjs" 
									    data-chartjs-dots="false" 
									    data-chartjs-legend="false" 
									    data-chartjs-grid="true" 
									    data-chartjs-tooltip="true" 

									    data-chartjs-line-width="3" 
									    data-chartjs-type="line" 

										data-chartjs-labels='["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]' 
									    data-chartjs-datasets='[{                                                           
									        "label":                    "Orders",
									        "data":                     [11, 11, 17, 11, 15, 12, 13, 16, 11, 18, 20, 21],
									        "fill":                     true,
									        "backgroundColor":          "rgba(201, 203, 207, 0.3)",
									        "borderColor": 				"rgba(255, 99, 132, 1)",
									        "borderWidth": 1
									    }]'
									></canvas>
								</div>


								</div>

							</div>


							
						</div>


					</div>
					<!-- /WIDGETS -->



						<!-- ALERT : UPGRADE -->
						<div class="col-12 mb-3">
							<div class="bg-white shadow-xs fs--16 p-2 row-pill">

								<div class="clearfix bg-light p-2 rounded row-pill">
									<a href="#!" title="Upgrade" aria-label="Upgrade" class="btn btn-pill btn-sm btn-warning py-1 mb-0 float-start transition-hover-end">
										Upgrade
									</a>
									<span class="d-block pt-1 pl-2 pr-2 text-muted text-truncate">
										using 89% of total storage
									</span>
								</div>

							</div>
						</div>
						<!-- /ALERT : UPGDARE -->







					</div>
					<!-- /WIDGETS -->


				</div>
				<!-- /MIDDLE -->