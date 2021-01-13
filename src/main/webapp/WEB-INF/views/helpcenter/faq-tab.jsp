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
				<li class="tab-link">
					<a href="notice-tab.do">공지사항</a>
				</li>
				<li class="tab-link  current">
					<a href="faq-tab.do">FAQ</a>
				</li>
				<li class="tab-link">
					<a href="memberQ-tab.do">1:1 문의</a>
				</li>
			</ul>

			<!-- tab-1 -->
			<div id="tab-1" class="tab-content current">

				<h3 class="joy-table-title">
					FAQ
					<p>여러분이 쩝쩝박사에게 자주하는 질문!</p>
				</h3>

				<table class="joy-table">
				
					<thead>
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th>제목</th>
						</tr>
					</thead>

					<c:if test="${empty FAQList}">
						<tbody>
							<tr>
								<td colspan="3">데이터가 없습니다.</td>
							</tr>
						</tbody>
					</c:if>

					<c:if test="${not empty FAQList}">
						<c:forEach var="faq" items="${FAQList}">
							<tbody>
								<tr>
									<td>${faq.r_num}</td>
									<td>${faq.qna_category_name}</td>
									
									<td>
										<c:if test="${vo.searchKeyword == null }">
											<a href="faq.do?faq_num=${faq.faq_num}&cPage=${paging.nowPage}">${faq.title}</a>
										</c:if>
										<c:if test="${vo.searchKeyword != null }">
											<a href="faq.do?faq_num=${faq.faq_num}&cPage=${paging.nowPage}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">${faq.title}</a>
										</c:if>
									</td>
									
								</tr>
							</tbody>
						</c:forEach>
					</c:if>

				</table>
				
				<!-- 검색창 -->
					<form action="${contextPath}/board/faq-tab.do" method="post" style="margin:5px;">
	
						<div style="float:right; margin: 13px 5px;">
							<button type="submit"
								class="js-ajax btn btn-sm btn-primary btn-pill px-2 py-1 fs--15">
								검색</button>
						</div>
	
						<input type="text" name="searchKeyword"
							class="form-control is-valid mb-3" placeholder="검색"
							style="border-color: #600080; float:right; width:17%; overflow: hidden; padding: 0.3rem 0.5rem; height: 38px; margin: 10px 5px !important; font-size: 16px;">
	
						<select name="searchCondition" id="select_options2"
							class="form-control"
							style="border-color: #600080; float:right; width: 10%; padding: 0.3rem 0.5rem; height: 38px; margin: 10px 0px; font-size: 16px; ">
								<option value="qna_category_name" selected>카테고리</option>
								<option value="title">제목</option>
								<option value="contents">내용</option>
						</select>
						
					</form>
					<!-- 검색창 -->

				<ul class="joy-paging">
					<c:if test="${paging.beginPage == 1}">
						<li>
							<p class="disabled">Prev</p>
						</li>
					</c:if>
					<c:if test="${paging.beginPage != 1}">
						<li>
							<c:if test="${vo.searchKeyword == null }">
								<a href="faq-tab.do?cPage=${paging.beginPage - 1 }">Prev</a>
							</c:if>
							<c:if test="${vo.searchKeyword != null }">
								<a href="faq-tab.do?cPage=${paging.beginPage - 1 }&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">Prev</a>
							</c:if>
						</li>
					</c:if>
					<c:forEach var="pageNo" begin="${paging.beginPage }" end="${paging.endPage }">
						<c:if test="${pageNo == paging.nowPage }">
							<li class="active">${pageNo }</li>
						</c:if>
						<c:if test="${pageNo != paging.nowPage }">
							<li>
								<c:if test="${vo.searchKeyword == null }">
									<a href="faq-tab.do?cPage=${pageNo }">${pageNo }</a>
								</c:if>
								<c:if test="${vo.searchKeyword != null }">
									<a href="faq-tab.do?cPage=${pageNo }&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">${pageNo }</a>
								</c:if>
							</li>
						</c:if>
					</c:forEach>
					<c:if test="${paging.endPage >= paging.totalPage }">
						<li><p class="disabled">Next</p></li>
					</c:if>
					<c:if test="${paging.endPage < paging.totalPage }">
						<li>
							<c:if test="${vo.searchKeyword == null }">
								<a href="faq-tab.do?cPage=${paging.endPage + 1 }">Next</a>
							</c:if>
							<c:if test="${vo.searchKeyword != null }">
								<a href="faq-tab.do?cPage=${paging.endPage + 1 }&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">Next</a>
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
