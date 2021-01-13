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
			1:1 회원 문의 <small style="padding: 3px;" class="d-block text-muted fs--15">
				1:1 회원 문의 관리 페이지입니다. </small>
		</h2>

	</div>




	<!-- PAGE LIST -->
	<div class="clearfix">

		<!-- portlet -->
		<div class="portlet">
			
			<!-- portlet : header -->
			<div class="portlet-header border-bottom" style="padding: 10px;">

				<!-- 검색창 -->
				<form action="${contextPath}/adminboard/memberQnaList.do" method="post">

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
						<option value="qna_category_name" selected>카테고리</option>
						<option value="title">제목</option>
						<option value="contents">내용</option>
						<option value="member_id">아이디</option>
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
									<th>카테고리</th>
									<th><span class="px-2 p-0-xs"> 제목 </span></th>
									<th>작성자</th>
									<th>작성날짜</th>
								</tr>
							</thead>

							<c:if test="${empty MemQList}">
								<tbody id="item_list">
									<tr>
										<td colspan="8">등록된 공지사항이 없습니다.</td>
									</tr>
								</tbody>
							</c:if>

									<tbody id="item_list">
							<c:if test="${not empty MemQList}">
								<c:forEach var="memQ" items="${MemQList}">

										<!-- item -->
										<tr id="message_id_2" class="text-muted">

											<td class="hidden-lg-down"><label
												class="form-checkbox form-checkbox-secondary float-start">
													<input type="checkbox" name="item_id[]" value="2">
													<i></i>
											</label></td>
											<td>${memQ.r_num}</td>
											<td>${memQ.qna_category_name }</td>
											
											<td>
											<c:if test="${vo.daterange == null }">
												<c:if test="${memQ.parent_num == 0 }">
													<a href="${contextPath}/adminboard/memQ.do?member_qna_num=${memQ.member_qna_num}&member_id=${memQ.member_id }&cPage=${paging.nowPage}" class="font-weight-medium text-muted mx-2 m-0-xs">
														${memQ.title} 
													</a>
												</c:if> 
												<c:if test="${memQ.parent_num != 0 }">
													<a href="${contextPath}/adminboard/memQ.do?member_qna_num=${memQ.member_qna_num}&member_id=${memQ.member_id }&cPage=${paging.nowPage}" class="font-weight-medium text-muted mx-2 m-0-xs"> 
													<span class="badge badge-soft badge-pill badge-purple">RE</span>
														${memQ.title }
													</a>
												</c:if> 
											</c:if>
											<c:if test="${vo.daterange != null }">
												<c:if test="${memQ.parent_num == 0 }">
													<a href="${contextPath}/adminboard/memQ.do?member_qna_num=${memQ.member_qna_num}&member_id=${memQ.member_id }&cPage=${paging.nowPage}&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}" class="font-weight-medium text-muted mx-2 m-0-xs">
														${memQ.title} 
													</a>
												</c:if> 
												<c:if test="${memQ.parent_num != 0 }">
													<a href="${contextPath}/adminboard/memQ.do?member_qna_num=${memQ.member_qna_num}&member_id=${memQ.member_id }&cPage=${paging.nowPage}&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}" class="font-weight-medium text-muted mx-2 m-0-xs"> 
													<span class="badge badge-soft badge-pill badge-purple">RE</span>
														${memQ.title }
													</a>
												</c:if> 
											</c:if>
											</td>
											
											<td>${memQ.member_id }</td>
											<td>${memQ.reg_date }</td>

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
									<th>카테고리</th>
									<th><span class="px-2 p-0-xs"> 제목 </span></th>
									<th>작성자</th>
									<th>작성날짜</th>
								</tr>
							</tfoot>
							
						</table>

					</div>



					<!-- options and pagination -->
					<div class="row text-center-xs">

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
										<c:if test="${vo.daterange == null }">
											<a class="page-link" href="memberQnaList.do?cPage=${paging.beginPage - 1 }" tabindex="-1" aria-disabled="true">Prev</a>
										</c:if> 
										<c:if test="${vo.daterange != null }">
											<a class="page-link" href="memberQnaList.do?cPage=${paging.beginPage - 1 }&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}" tabindex="-1" aria-disabled="true">Prev</a>
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
											<li class="page-item" aria-current="page">
											<c:if test="${vo.daterange == null }">
												<a class="page-link" href="memberQnaList.do?cPage=${pageNo }">${pageNo } <span class="sr-only">(current)</span></a>
											</c:if> 
											<c:if test="${vo.daterange != null }">
												<a class="page-link" href="memberQnaList.do?cPage=${pageNo }&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}" tabindex="-1" aria-disabled="true">${pageNo }</a>
											</c:if>
											</li>
										</c:if>
									</c:forEach>

									<c:if test="${paging.endPage >= paging.totalPage }">
										<li class="page-item disabled btn-pill "><a
											class="page-link" href="#">Next</a></li>
									</c:if>
									<c:if test="${paging.endPage < paging.totalPage }">
										<li class="page-item">
										<c:if test="${vo.daterange != null }">
											<a class="page-link" href="memberQnaList.do?cPage=${paging.endPage + 1 }&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}" tabindex="-1" aria-disabled="true">Prev</a>
										</c:if> 
										<c:if test="${vo.daterange == null }">
											<a class="page-link" href="memberQnaList.do?cPage=${paging.endPage + 1 }">Next</a>
										</c:if>
										</li>
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