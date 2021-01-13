<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("utf-8");
%>

<!-- MIDDLE -->
<div id="middle" class="flex-fill">

	<div class="timeline-container">

		<h2 style="margin: 10px !important;" class="h4 font-weight-normal timeline-title border-danger mb-5 pt-2 pb-2">
			공지사항 <small style="padding: 3px;" class="d-block text-muted fs--15">
				공지사항 관리 페이지입니다. </small>
		</h2>

	</div>

	<!-- PAGE LIST -->
	<div class="clearfix">

		<!-- portlet -->
		<div class="portlet">

			<!-- portlet : header -->
			<div class="portlet-header border-bottom" style="padding: 10px;">

				<div style="float: left; margin: 13px;">

					<a href="${contextPath}/adminboard/noticeInsert.do"
						class="js-ajax btn btn-sm btn-primary btn-pill px-2 py-1 fs--15">
						등록 </a>

				</div>

				<!-- 검색창 -->
				<form action="${contextPath}/adminboard/noticeList.do" method="post">

					<div style="float: right; margin: 13px 5px;">
						<button type="submit"
							class="js-ajax btn btn-sm btn-primary btn-pill px-2 py-1 fs--15">
							검색</button>
					</div>

					<input autocomplete="off" type="text" name="daterange"
						class="form-control rangepicker" data-ranges="true"
						data-date-format="YY/MM/DD"
						data-quick-locale='{
															"lang_apply"	: "적용",
															"lang_cancel"	: "취소",
															"lang_crange"	: "범위 선택하기",
															"lang_months" 	: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
															"lang_weekdays" : ["일", "월", "화", "수", "목", "금", "토"],
	
															"lang_today"	: "오늘", 
															"lang_yday"		: "어제", 
															"lang_7days"	: "지난 1주일", 
															"lang_30days"	: "지난 1달", 
															"lang_tmonth"	: "이번 달", 
															"lang_lmonth"	: "지난 달"
														}'
						style="float: right; width: 25%; padding: 0.3rem 0.5rem; height: 38px; margin: 10px 0; font-size: 16px; margin-left: 5px;">

					<input type="text" name="searchKeyword"
						class="form-control is-valid mb-3" placeholder="검색"
						style="float: right; width: 25%; overflow: hidden; padding: 0.3rem 0.5rem; height: 38px; margin: 10px 0 !important; font-size: 16px;">

					<select name="searchCondition" id="select_options2"
						class="form-control"
						style="border-color: #6dbb30; float: right; width: 10%; padding: 0.3rem 0.5rem; height: 38px; margin: 10px 0; font-size: 16px; margin-right: 5px;">
						<option value="title" selected>제목</option>
						<option value="contents">내용</option>
					</select>

				</form>
				<!-- 검색창 -->

			</div>
			<!-- /portlet : header -->


			<!-- portlet : body -->
			<div class="portlet-body pt-0">


				<form novalidate class="bs-validate" id="form_id" method="post"
					action="#!">

					<input type="hidden" id="action" name="action" value="">
					<!-- value populated by js -->

					<div class="table-responsive">

						<table class="table table-align-middle border-bottom mb-6"
							style="margin-bottom: 10px !important;">

							<thead>
								<tr class="text-muted fs--13">
									<th class="w--30 hidden-lg-down"><label
										class="form-checkbox form-checkbox-primary float-start">
											<input class="checkall" data-checkall-container="#item_list"
											type="checkbox" name="checkbox"> <i></i>
									</label></th>
									<th>번호</th>
									<th><span class="px-2 p-0-xs"> 제목 </span></th>
									<th class="w--200 hidden-lg-down">조회수</th>
									<th>작성날짜</th>
									<th class="w--60">&nbsp;</th>
								</tr>
							</thead>

							<c:if test="${empty NoticeList}">
								<tbody id="item_list">
									<tr>
										<td colspan="6">등록된 공지사항이 없습니다.</td>
									</tr>
								</tbody>
							</c:if>

							<tbody id="item_list">
								<c:if test="${not empty NoticeList}">
									<c:forEach var="notice" items="${NoticeList}">


										<!-- item -->
										<tr id="message_id_2" class="text-muted">

											<td class="hidden-lg-down">
												<label class="form-checkbox form-checkbox-secondary float-start">
													<input type="checkbox" name="item_id[]" value="${notice.notice_num}"> <i></i>
												</label>
											</td>
											
											<td>${notice.r_num}</td>
											
											<td>
												
												<c:if test="${vo.daterange == null }">
													<a href="${contextPath}/adminboard/notice.do?notice_num=${notice.notice_num}&cPage=${paging.nowPage}" class="font-weight-medium text-muted mx-2 m-0-xs">
														${notice.title} 
													</a> 
												</c:if>
												<c:if test="${vo.daterange != null }">
													<a href="${contextPath}/adminboard/notice.do?notice_num=${notice.notice_num}&cPage=${paging.nowPage}&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}" class="font-weight-medium text-muted mx-2 m-0-xs">
														${notice.title} 
													</a> 
												</c:if>
												
												<!-- MOBILE ONLY -->
												<div class="fs--13 d-block d-xl-none">
													<span class="d-block text-muted">Visits:
														${notice.views}</span> 
												</div> 
												<!-- /MOBILE ONLY -->
												
											</td>

											<td class="hidden-lg-down">${notice.views}</td>

											<td>${notice.reg_date}</td>

											<td class="text-align-end">

												<div class="dropdown">

													<a href="#" class="btn btn-sm btn-light rounded-circle"
														data-toggle="dropdown" aria-expanded="false"
														aria-haspopup="true"> <span class="group-icon">
															<i class="fi fi-dots-vertical-full"></i> <i
															class="fi fi-close"></i>
													</span>
													</a>


													<div
														class="dropdown-menu dropdown-menu-clean dropdown-click-ignore max-w-220">

														<a href="#!"
															class="dropdown-item text-truncate js-ajax-confirm"
															data-href="page-list.html"
															data-ajax-confirm-body="Delete this page?"
															data-ajax-confirm-mode="ajax"
															data-ajax-confirm-method="GET"
															data-ajax-confirm-btn-yes-class="btn-sm btn-danger"
															data-ajax-confirm-btn-yes-text="Delete"
															data-ajax-confirm-btn-yes-icon="fi fi-check"
															data-ajax-confirm-btn-no-class="btn-sm btn-light"
															data-ajax-confirm-btn-no-text="Cancel"
															data-ajax-confirm-btn-no-icon="fi fi-close"
															data-ajax-confirm-success-target="#message_id_2"
															data-ajax-confirm-success-target-action="remove"> <i
															class="fi fi-thrash text-danger"></i> Delete
														</a>

													</div>

												</div>

											</td>

										</tr>
										<!-- /item -->


									</c:forEach>
								</c:if>
							</tbody>
							
							<tfoot>
								<tr class="text-muted fs--13">
									<th class="w--30 hidden-lg-down"><label
										class="form-checkbox form-checkbox-primary float-start">
											<input class="checkall" data-checkall-container="#item_list"
											type="checkbox" name="checkbox"> <i></i>
									</label></th>
									<th>번호</th>
									<th><span class="px-2 p-0-xs"> 제목 </span></th>
									<th class="w--200 hidden-lg-down">조회수</th>
									<th>작성날짜</th>
									<th class="w--60">&nbsp;</th>
								</tr>
							</tfoot>

						</table>

					</div>

					<!-- options and pagination -->
					<div class="row text-center-xs">

						<div class="hidden-lg-down col-12 col-xl-6">

							<!-- SELECTED ITEMS -->
							<div class="dropup">

								<a href="#" class="btn btn-sm btn-pill btn-light"
									data-toggle="dropdown" aria-expanded="false"
									aria-haspopup="true"> <span class="group-icon"> <i
										class="fi fi-dots-vertical-full"></i> <i class="fi fi-close"></i>
								</span> <span>Selected Items</span>
								</a>

								<div
									class="dropdown-menu dropdown-menu-clean dropdown-click-ignore max-w-250">

									<a href="#!"
										class="dropdown-item text-truncate js-form-advanced-bulk"
										data-js-form-advanced-bulk-hidden-action-id="#action"
										data-js-form-advanced-bulk-hidden-action-value="delete"
										data-js-form-advanced-bulk-container-items="#item_list"
										data-js-form-advanced-bulk-required-selected="true"
										data-js-form-advanced-bulk-required-txt-error="게시글이 선택되지 않았습니다."
										data-js-form-advanced-bulk-required-txt-position="top-center"
										data-js-form-advanced-bulk-required-custom-modal=""
										data-js-form-advanced-bulk-required-custom-modal-content-ajax=""
										data-js-form-advanced-bulk-required-modal-type="danger"
										data-js-form-advanced-bulk-required-modal-size="modal-md"
										data-js-form-advanced-bulk-required-modal-txt-title="확인해주세요!"
										data-js-form-advanced-bulk-required-modal-txt-subtitle="Selected Items: {{no_selected}}"
										data-js-form-advanced-bulk-required-modal-txt-body-txt="{{no_selected}}개의 게시글을 선택했습니다. 정말 삭제하시겠습니까?"
										data-js-form-advanced-bulk-required-modal-txt-body-info="삭제하면 복구되지 않습니다."
										data-js-form-advanced-bulk-required-modal-btn-text-yes="삭제"
										data-js-form-advanced-bulk-required-modal-btn-text-no="취소"
										data-js-form-advanced-bulk-submit-without-confirmation="false"
										data-js-form-advanced-form-id="#form_id"> <i
										class="fi fi-thrash text-danger"></i> Delete
									</a>

								</div>

							</div>
							<!-- /SELECTED ITEMS -->

						</div>


						<div class="col-12 col-xl-6">

							<!-- pagination -->
							<nav aria-label="pagination">
								<ul
									class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end">
									<c:if test="${paging.beginPage == 1}">
										<li class="page-item disabled btn-pill "><a
											class="page-link" href="#" tabindex="-1" aria-disabled="true">Prev</a>
										</li>
									</c:if>
									<c:if test="${paging.beginPage != 1}">
										<li class="page-item">
										<c:if test="${vo.daterange != null }">
											<a class="page-link" href="noticeList.do?cPage=${paging.beginPage - 1 }&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}" tabindex="-1" aria-disabled="true">Prev</a>
										</c:if> 
										<c:if test="${vo.daterange == null }">
											<a class="page-link" href="noticeList.do?cPage=${paging.beginPage - 1 }" tabindex="-1" aria-disabled="true">Prev</a>
										</c:if>
										</li>
									</c:if>

									<c:forEach var="pageNo" begin="${paging.beginPage }"
										end="${paging.endPage }">
										<c:if test="${pageNo == paging.nowPage }">
											<li class="page-item active" aria-current="page"><a
												class="page-link" href="#">${pageNo } <span
													class="sr-only">(current)</span></a></li>
										</c:if>
										<c:if test="${pageNo != paging.nowPage }">
											<li class="page-item" aria-current="page"><c:if
													test="${vo.daterange != null }">
													<a class="page-link"
														href="noticeList.do?cPage=${pageNo }&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">${pageNo }
														<span class="sr-only">(current)</span>
													</a>
												</c:if> <c:if test="${vo.daterange == null }">
													<a class="page-link" href="noticeList.do?cPage=${pageNo }">${pageNo }
														<span class="sr-only">(current)</span>
													</a>
												</c:if></li>
										</c:if>
									</c:forEach>

									<c:if test="${paging.endPage >= paging.totalPage }">
										<li class="page-item disabled btn-pill "><a
											class="page-link" href="#">Next</a></li>
									</c:if>
									<c:if test="${paging.endPage < paging.totalPage }">
										<li class="page-item"><c:if
												test="${vo.daterange != null }">
												<a class="page-link"
													href="noticeList.do?cPage=${paging.endPage + 1 }&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">Next</a>
											</c:if> <c:if test="${vo.daterange == null }">
												<a class="page-link"
													href="noticeList.do?cPage=${paging.endPage + 1 }">Next</a>
											</c:if></li>
									</c:if>

								</ul>
							</nav>
							<!-- pagination -->

						</div>

					</div>
					<!-- /options and pagination -->

				</form>

			</div>
			<!-- /portlet : body -->

		</div>
		<!-- /portlet -->

	</div>
	<!-- /PAGE LIST -->

</div>
<!-- /MIDDLE -->