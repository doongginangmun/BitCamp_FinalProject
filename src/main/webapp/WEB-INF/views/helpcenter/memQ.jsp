<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath }"  />
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
                                	1:1 문의
                                	<p>모든 의문... 쩝쩝박사에게!</p>
		                            <a href="memQ-update.do?member_qna_num=${memQ.member_qna_num}&cPage=${paging.nowPage}" class="insert">수정</a>
                            	</h3>
                                <div class="joy-board-detail">
                                    <table class="joy-table-detail">
                                        <tr>
                                        	<th>카테고리</th>
                                        	<td>${memQ.qna_category_name}</td>
                                        	<th>작성일</th>
                                        	<td>${memQ.reg_date}</td>
                                        </tr>
                                        <tr>
                                        	<th>제목</th>
                                        	<td>
												${memQ.title }
                                        	</td>
                                        	<th>작성자</th>
                                        	<td>${memQ.member_id }</td>
                                        </tr>
                                    </table>
                                    <div class="detail-contents">
                                        <p class="contents">
                                            ${memQ.contents}
                                        </p>
                                        <div class="image-box">
					                		<c:if test="${memQ.parent_num == 0 && not empty memQ.image}">
												<c:forTokens var="image" items="${memQ.image }" delims=",">
													<img src="${contextPath }/board/fileDownload.do?image=<c:out value="${image}"/>&action=memQ" width="20%" height="20%" onclick="imgPop(this.src)">
												</c:forTokens>
		                					</c:if>
		                					<c:if test="${memQ.parent_num != 0 && not empty memQ.image}">
			                					<c:forTokens var="image" items="${memQ.image }" delims=",">
													<img src="${contextPath }/board/fileDownload.do?image=<c:out value="${image}"/>&action=memA" width="20%" height="20%" onclick="imgPop(this.src)">
												</c:forTokens>
                                        	</c:if>
										</div>
                                    </div>
									<div class="prev-next-list">
										<!-- 이전글이 없음, pre_no = 0 -->
										<c:if test="${memQ.pre_no == 0 }">
											<p class="disabled">이전글</p>
										</c:if>
										<!-- 이전글이 있음, pre_no != 0 -->
										<c:if test="${memQ.pre_no != 0 }">
											<c:if test="${memQ.r_num > paging.begin }">
												<c:if test="${vo.daterange == null }">
													<a href="memQ.do?r_num=${memQ.pre_no}&cPage=${paging.nowPage}">이전글</a>
												</c:if>
												<c:if test="${vo.daterange != null }">
													<a href="memQ.do?r_num=${memQ.pre_no}&cPage=${paging.nowPage}&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">이전글</a>
												</c:if>
											</c:if>
											<c:if test="${memQ.r_num == paging.begin }">
												<c:if test="${vo.daterange == null }">
													<a href="memQ.do?r_num=${memQ.pre_no}&cPage=${paging.nowPage - 1}">이전글</a>
												</c:if>
												<c:if test="${vo.daterange != null }">
													<a href="memQ.do?r_num=${memQ.pre_no}&cPage=${paging.nowPage - 1}&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">이전글</a>
												</c:if>
											</c:if>
										</c:if>
										
										<!-- 다음글이 보이지 않게, next_no = 0 -->
										<c:if test="${memQ.next_no == 0 }">
											<p class="disabled">다음글</p>
										</c:if>
										<!-- 다음글이 있음, next_no != 0 -->
										<c:if test="${memQ.next_no != 0 }">
											<c:if test="${memQ.r_num < paging.end }">
												<c:if test="${vo.daterange == null }">
													<a href="memQ.do?r_num=${memQ.next_no}&cPage=${paging.nowPage}">다음글</a>
												</c:if>
												<c:if test="${vo.daterange != null }">
													<a href="memQ.do?r_num=${memQ.next_no}&cPage=${paging.nowPage}&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">다음글</a>
												</c:if>
											</c:if>
											<c:if test="${memQ.r_num == paging.end }">
												<c:if test="${vo.daterange == null }">
													<a href="memQ.do?r_num=${memQ.next_no}&cPage=${paging.nowPage + 1}">다음글</a>
												</c:if>
												<c:if test="${vo.daterange != null }">
													<a href="memQ.do?r_num=${memQ.next_no}&cPage=${paging.nowPage + 1}&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">다음글</a>
												</c:if>
											</c:if>
										</c:if>
										
										<c:if test="${vo.daterange == null }">
											<a href="memberQ-tab.do?cPage=${paging.nowPage }" class="list">목록</a>
										</c:if>
										<c:if test="${vo.daterange != null }">
											<a href="memberQ-tab.do?cPage=${paging.nowPage }&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}" class="list">목록</a>
										</c:if>
										
									</div>
								</div>
                            </div>
                        </div>

				<!-- /PAGE LIST -->

			</div>
			<!-- /MIDDLE -->

		</div>

