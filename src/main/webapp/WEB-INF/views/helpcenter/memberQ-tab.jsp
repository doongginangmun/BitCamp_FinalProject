<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
  request.setCharacterEncoding("UTF-8");
%>

<div class="d-flex flex-fill container">

	<!-- MIDDLE -->
	<div id="middle" class="flex-fill">

		<div class="page-title bg-transparent b-0">
			<!-- h1 고객센터 -->
			<h1 class="h4 mt-4 mb-0 px-3">고객센터</h1>
		</div>

		<!-- Nav tabs -->
		<div class="container">
			<ul class="nav">
				<li class="tab-link"><a href="notice-tab.do">공지사항</a></li>
				<li class="tab-link"><a href="faq-tab.do">FAQ</a></li>
				<li class="tab-link current"><a href="memberQ-tab.do">1:1
						문의</a></li>
			</ul>

			<!-- tab-3 -->
			<div id="tab-3" class="tab-content current">

				<h3 class="joy-table-title">
					1:1 문의
					<p>모든 의문... 쩝쩝박사에게!</p>
					<a class="insert" href="memQ-insert.do">글쓰기</a>
				</h3>

				<table class="joy-table">
					<thead>
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th class="joy-title-text-left">제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>

					<c:if test="${empty MemQList}">
						<tbody>
							<tr>
								<td colspan="5">데이터가 없습니다.</td>
							</tr>
						</tbody>
					</c:if>
					<c:if test="${not empty MemQList}">
						<c:forEach var="memQ" items="${MemQList}">
							<tbody>
								<tr>
									<td>${memQ.r_num}</td>
									<td>${memQ.qna_category_name}</td>
									
									<c:if test="${vo.daterange == null }">
										<c:if test="${memQ.parent_num == 0 }">
											<td class="joy-title-text-left">
												<a href="memQ.do?member_qna_num=${memQ.member_qna_num}&cPage=${paging.nowPage}">${memQ.title }</a>
											</td>
										</c:if>
										<c:if test="${memQ.parent_num != 0 }">
											<td class="joy-title-text-left">
												<a href="memQ.do?member_qna_num=${memQ.member_qna_num}&cPage=${paging.nowPage}">
													<span class="badge badge-soft badge-pill badge-purple">RE</span>
													${memQ.title }
												</a>
											</td>
										</c:if>
									</c:if>
									<c:if test="${vo.daterange != null }">
										<c:if test="${memQ.parent_num == 0 }">
											<td class="joy-title-text-left">
												<a href="memQ.do?member_qna_num=${memQ.member_qna_num}&cPage=${paging.nowPage}&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">${memQ.title }</a>
											</td>
										</c:if>
										<c:if test="${memQ.parent_num != 0 }">
											<td class="joy-title-text-left">
												<a href="memQ.do?member_qna_num=${memQ.member_qna_num}&cPage=${paging.nowPage}&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">
													<span class="badge badge-soft badge-pill badge-purple">RE</span>
													${memQ.title }
												</a>
											</td>
										</c:if>
									</c:if>
									
									<td>${memQ.member_id}</td>
									<td>${memQ.reg_date}</td>
								</tr>
							</tbody>
						</c:forEach>
					</c:if>
				</table>
				
				<!-- 검색창 -->
					<form action="${contextPath}/board/memberQ-tab.do" method="post" style="margin:5px;">
	
						<div style="float:right; margin: 13px 5px;">
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
							style="border-color: #600080; float:right; width:17%; padding: 0.3rem 0.5rem; height: 38px; margin: 10px 0px;font-size: 16px; ">
	
						<input type="text" name="searchKeyword"
							class="form-control is-valid mb-3" placeholder="검색"
							style="border-color: #600080; float:right; width:15%; overflow: hidden; padding: 0.3rem 0.5rem; height: 38px; margin: 10px 5px !important; font-size: 16px;">
	
						<select name="searchCondition" id="select_options2"
							class="form-control"
							style="border-color: #600080; float:right; width: 10%; padding: 0.3rem 0.5rem; height: 38px; margin: 10px 0px; font-size: 16px; ">
							<option value="qna_category_name" selected>카테고리</option>
							<option value="title">제목</option>
							<option value="contents">내용</option>
							<option value="member_id">아이디</option>
						</select>
						
					</form>
					<!-- 검색창 -->

				<ul class="joy-paging">
					<c:if test="${paging.beginPage == 1}">
						<li><p class="disabled">Prev</p></li>
					</c:if>
					<c:if test="${paging.beginPage != 1}">
						<li>
							<c:if test="${vo.daterange == null }">
								<a href="memberQ-tab.do?cPage=${paging.beginPage - 1 }">Prev</a>
							</c:if>
							<c:if test="${vo.daterange != null }">
								<a href="memberQ-tab.do?cPage=${paging.beginPage - 1 }&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">Prev</a>
							</c:if>
						</li>
					</c:if>

					<c:forEach var="pageNo" begin="${paging.beginPage }"
						end="${paging.endPage }">
						<c:if test="${pageNo == paging.nowPage }">
							<li class="active">${pageNo }</li>
						</c:if>
						<c:if test="${pageNo != paging.nowPage }">
							<li>
								<c:if test="${vo.daterange == null }">
								<a href="memberQ-tab.do?cPage=${pageNo }">${pageNo }</a>
								</c:if>
								<c:if test="${vo.daterange != null }">
								<a href="memberQ-tab.do?cPage=${pageNo }&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">${pageNo }</a>
								</c:if>
							</li>
						</c:if>
					</c:forEach>

					<c:if test="${paging.endPage >= paging.totalPage }">
						<li><p class="disabled">Next</p></li>
					</c:if>
					<c:if test="${paging.endPage < paging.totalPage }">
						<li>
							<c:if test="${vo.daterange == null }">
								<a href="memberQ-tab.do?cPage=${paging.endPage + 1 }">Next</a>
							</c:if>
							<c:if test="${vo.daterange != null }">
								<a href="memberQ-tab.do?cPage=${paging.endPage + 1 }&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">Next</a>
							</c:if>
						</li>
					</c:if>

				</ul>
			</div>
			<!-- tab-3 end -->

		</div>
		<!-- Nav tabs end-->

	</div>
	<!-- MiDDLE end -->

</div>
