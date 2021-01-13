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

		<!-- PAGE LIST -->

		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="home">
				<h3 class="joy-table-title">
					공지사항
					<p>쩝쩝박사의 새로운 소식과 유용한 정보들을 한곳에서 확인하세요.</p>
				</h3>
				<div class="joy-board-detail">
					<table class="joy-table-detail">
						<tr>
							<th>제목</th>
							<td colspan="3">${notice.title}</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td colspan="3">JJupJJup</td>
						</tr>
						<tr>
							<th>작성일</th>
							<td>${notice.reg_date}</td>
							<th>조회수</th>
							<td>${notice.views}</td>
						</tr>
					</table>
					<div class="detail-contents">
						<p class="contents">
							${notice.contents}
						</p>
						<div class="image-box">
							<c:if test="${not empty notice.image}">
								<c:forTokens var="image" items="${notice.image }" delims=",">
									<img src="${contextPath }/board/fileDownload.do?image=<c:out value="${image}"/>&action=notice" width="20%" height="20%" onclick="imgPop(this.src)">
								</c:forTokens>
							</c:if>
						</div>
					</div>
					<div class="prev-next-list">
						<!-- 이전글이 없음, pre_no = 0 -->
						<c:if test="${notice.pre_no == 0 }">
							<p class="disabled">이전글</p>
						</c:if>
						<!-- 이전글이 있음, pre_no != 0 -->
						<c:if test="${notice.pre_no != 0 }">
							<c:if test="${notice.r_num > paging.begin }">
								<c:if test="${vo.daterange == null }">
									<a href="notice.do?r_num=${notice.pre_no}&cPage=${paging.nowPage}">이전글</a>
								</c:if>
								<c:if test="${vo.daterange != null }">
									<a href="notice.do?r_num=${notice.pre_no}&cPage=${paging.nowPage}&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">이전글</a>
								</c:if>
							</c:if>
							<c:if test="${notice.r_num == paging.begin }">
								<c:if test="${vo.daterange == null }">
									<a href="notice.do?r_num=${notice.pre_no}&cPage=${paging.nowPage - 1}">이전글</a>
								</c:if>
								<c:if test="${vo.daterange != null }">
									<a href="notice.do?r_num=${notice.pre_no}&cPage=${paging.nowPage - 1}&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">이전글</a>
								</c:if>
							</c:if>
						</c:if>
						
						<!-- 다음글이 보이지 않게, next_no = 0 -->
						<c:if test="${notice.next_no == 0 }">
							<p class="disabled">다음글</p>
						</c:if>
						<!-- 다음글이 있음, next_no != 0 -->
						<c:if test="${notice.next_no != 0 }">
							<c:if test="${notice.r_num < paging.end }">
								<c:if test="${vo.daterange == null }">
									<a href="notice.do?r_num=${notice.next_no}&cPage=${paging.nowPage}">다음글</a>
								</c:if>
								<c:if test="${vo.daterange != null }">
									<a href="notice.do?r_num=${notice.next_no}&cPage=${paging.nowPage}&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">다음글</a>
								</c:if>
							</c:if>
							<c:if test="${notice.r_num == paging.end }">
								<c:if test="${vo.daterange == null }">
									<a href="notice.do?r_num=${notice.next_no}&cPage=${paging.nowPage + 1}">다음글</a>
								</c:if>
								<c:if test="${vo.daterange != null }">
									<a href="notice.do?r_num=${notice.next_no}&cPage=${paging.nowPage + 1}&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">다음글</a>
								</c:if>
							</c:if>
						</c:if>
						
						<c:if test="${vo.daterange == null }">
							<a href="notice-tab.do?cPage=${paging.nowPage }" class="list">목록</a>
						</c:if>
						<c:if test="${vo.daterange != null }">
							<a href="notice-tab.do?cPage=${paging.nowPage }&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}" class="list">목록</a>
						</c:if>
						
					</div>
				</div>
			</div>
		</div>

		<!-- /PAGE LIST -->

	</div>
	<!-- /MIDDLE -->

</div>

