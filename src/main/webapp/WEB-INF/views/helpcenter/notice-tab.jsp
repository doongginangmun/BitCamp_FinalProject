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
				<li class="tab-link current">
					<a href="notice-tab.do">공지사항</a>
				</li>
				<li class="tab-link">
					<a href="faq-tab.do">FAQ</a>
				</li>
				<li class="tab-link">
					<a href="memberQ-tab.do">1:1 문의</a>
				</li>
			</ul>

			<!-- tab-1 -->
			<div id="tab-1" class="tab-content current">

				<h3 class="joy-table-title">
					공지사항
					<p>쩝쩝박사의 새로운 소식과 유용한 정보들을 한곳에서 확인하세요.</p>
				</h3>

				<table class="joy-table">
				
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					
					<c:if test="${empty NoticeList}">
						<tbody>
							<tr>
								<td colspan="5">등록된 게시글이 없습니다.</td>
							</tr>
						</tbody>
					</c:if>
					
					<c:if test="${not empty NoticeList}">
						<c:forEach var="notice" items="${NoticeList}">
							<tbody>
								<tr>
									<td>${notice.r_num}</td>
									<td>
										<c:if test="${vo.daterange == null }">
										<a href="notice.do?notice_num=${notice.notice_num}&cPage=${paging.nowPage}">${notice.title}</a>
										</c:if>
										<c:if test="${vo.daterange != null }">
										<a href="notice.do?notice_num=${notice.notice_num}&cPage=${paging.nowPage}&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">${notice.title}</a>
										</c:if>
									</td>
									<td>쩝쩝박사</td>
									<td>${notice.reg_date}</td>
									<td>${notice.views}</td>
								</tr>
							</tbody>
						</c:forEach>
					</c:if>
					
				</table>

			</div>
			<!-- /portlet : header -->

					<!-- 검색창 -->
					<form action="${contextPath}/board/notice-tab.do" method="post" style="margin:5px;">
	
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
							style="border-color: #600080; float:right; width: 8%; padding: 0.3rem 0.5rem; height: 38px; margin: 10px 0px; font-size: 16px; ">
							<option value="title" selected>제목</option>
							<option value="contents">내용</option>
						</select>
						
					</form>
					<!-- 검색창 -->
				
				<!-- paging -->
				<ul class="joy-paging">
				
					<c:if test="${paging.beginPage == 1}">
						<li>
							<p class="disabled">Prev</p>
						</li>
					</c:if>
					
					<c:if test="${paging.beginPage != 1}">
						<li>
							<c:if test="${vo.daterange == null }">
								<a href="notice-tab.do?cPage=${paging.beginPage - 1 }">Prev</a>
							</c:if>
							<c:if test="${vo.daterange != null }">
								<a href="notice-tab.do?cPage=${paging.beginPage - 1 }&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">Prev</a>
							</c:if>
						</li>
					</c:if>
					
					<c:forEach var="pageNo" begin="${paging.beginPage }" end="${paging.endPage }">
						<c:if test="${pageNo == paging.nowPage }">
							<li class="active">${pageNo }</li>
						</c:if>
						<c:if test="${pageNo != paging.nowPage }">
							<li>
								<c:if test="${vo.daterange == null }">
									<a href="notice-tab.do?cPage=${pageNo }">${pageNo }</a>
								</c:if>
								<c:if test="${vo.daterange != null }">
									<a href="notice-tab.do?cPage=${pageNo }&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">${pageNo }</a>
								</c:if>
							</li>
						</c:if>
					</c:forEach>
					<c:if test="${paging.endPage >= paging.totalPage }">
						<li>
							<p class="disabled">Next</p>
						</li>
					</c:if>
					<c:if test="${paging.endPage < paging.totalPage }">
						<li>
							<c:if test="${vo.daterange == null }">
								<a href="notice-tab.do?cPage=${paging.endPage + 1 }">Next</a>
							</c:if>
							<c:if test="${vo.daterange != null }">
								<a href="notice-tab.do?cPage=${paging.endPage + 1 }&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">Next</a>
							</c:if>
						</li>
					</c:if>
				</ul>

			</div>
			<!-- tab-1 end -->

		</div>
		<!-- Nav tabs end-->

	</div>
	<!-- MiDDLE end -->

</div>
