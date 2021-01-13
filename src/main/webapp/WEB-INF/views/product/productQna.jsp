<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
   request.setCharacterEncoding("UTF-8");
%>

<!-- 상품 문의   Accordion -->

<section class="border-top">
	<div class="container">

		<div class="accordion" id="accordionShadow">
			<h2 class="h4 text-primary mb-4 mt-5">상품 문의 게시판</h2>
			<p class="lead mb-5">
				상품에 대한 문의를 남기는 공간입니다.<br> 배송관련, 주문(취소/교환/환불)관련 문의는 1:1문의에 남겨주세요
			</p>


			<div class="card shadow-md b-0 mb-2">
				<div class="card-header mb-0 p-0 b-0 bg-transparent"
					id="cleanHeadingOne">
					<h2 class="mb-0">
						<button style="background-color: lightgray;"
							class="btn btn-link btn-block btn-lg text-align-start text-decoration-none text-dark"
							type="button" data-toggle="collapse"
							data-target="#shadowCollapseOne" aria-expanded="true"
							aria-controls="shadowCollapseOne">
							<span
								style="text-align: center; display: inline-block; width: 10%;">글번호</span>
							<span style="display: inline-block; width: 55%;">글제목</span> <span
								style="text-align: center; display: inline-block; width: 15%;">작성자</span>
							<span
								style="text-align: center; display: inline-block; width: 15%;">작성일</span>

						</button>
					</h2>
				</div>


				<c:if test="${empty qnaList }">
					<div id="shadowCollapseOne" aria-labelledby="cleanHeadingOne"
						data-parent="#accordionShadow">
						<div class="card-body">
							<span>등록된 게시글이 없습니다.</span>
						</div>
					</div>
				</c:if>
			</div>

			<form method="post"
				action="${contextPath }/product/updateQnaForm.do?product_id=${vo.product_id}&product_qna_num=${qnaList[0].product_qna_num}">

				<c:if test="${not empty qnaList[0] }">
					<div class="card shadow-md b-0 mb-2">
						<div class="card-header mb-0 p-0 b-0 bg-transparent"
							id="cleanHeading1">
							<h2 class="mb-0">
								<button
									class="btn btn-link btn-block btn-lg text-align-start text-decoration-none text-dark collapsed"
									type="button" data-toggle="collapse"
									data-target="#shadowCollapse1" aria-expanded="false"
									aria-controls="shadowCollapse1">
									<span
										style="text-align: center; display: inline-block; width: 10%;">
										<c:out value="${qnaList[0].rowNum}" />
									</span>
									<!--  	 <span style="display: inline-block; width: 10%;"> <c:out value="${qnaList[0].product_qna_num}" /></span> -->
									<c:if test="${qnaList[0].parent_num != 0 }">
										<span style="display: inline-block; width: 4%;"
											class="badge badge-soft badge-pill badge-indigo">RE</span>
										<span style="display: inline-block; width: 51%;"><c:out
												value="${qnaList[0].title}" /> </span>
									</c:if>
									<c:if test="${qnaList[0].parent_num == 0 }">
										<span style="display: inline-block; width: 55%;"><c:out
												value="${qnaList[0].title}" /> </span>
										<!-- ${qna.title } -->
									</c:if>
									<span
										style="text-align: center; display: inline-block; width: 15%;"><c:out
											value="${qnaList[0].member_id}" /></span>
									<!-- ${qna.member_id } -->
									<span
										style="text-align: center; display: inline-block; width: 15%;"><c:out
											value="${qnaList[0].reg_date}" /></span>
									<!-- ${qna.reg_date } -->
									<span class="group-icon float-end"> <i
										class="fi fi-arrow-start-slim"></i> <i
										class="fi fi-arrow-down-slim"></i>
									</span>
								</button>
							</h2>
						</div>


						<div id="shadowCollapse1" class="collapse"
							aria-labelledby="cleanHeading1" data-parent="#accordionShadow">
							<div class="card-body">

								${qnaList[0].contents}
								<p>
									<c:if test="${not empty qnaList[0].image1 }">
										<img
											src="${contextPath}/resources/images/product_qna/${qnaList[0].image1}">
									</c:if>
									<c:if test="${not empty qnaList[0].image2 }">
										<img
											src="${contextPath}/resources/images/product_qna/${qnaList[0].image2}">
									</c:if>
									<c:if test="${not empty qnaList[0].image3 }">
										<img
											src="${contextPath}/resources/images/product_qna/${qnaList[0].image3}">
									</c:if>
								</p>

								<p>
									<c:choose>
										<c:when test="${member_id=='admin' }">
											<a
												href="${contextPath }/product/insertQnaForm.do?product_id=${vo.product_id}&product_qna_num=${qnaList[0].product_qna_num}">
												<button style="float: right;" type="button"
													class="btn btn-purple btn-soft mb-1">답변</button>
											</a>

										</c:when>
										<c:otherwise>
											<button style="float: right;" type="submit"
												class="btn btn-purple btn-soft mb-1">수정</button>

											<a
												href="${contextPath }/product/deleteBoardQna.do?product_id=${vo.product_id}&product_qna_num=${qnaList[0].product_qna_num}">
												<button style="float: right;" type="button"
													class="btn btn-purple btn-soft mb-1">삭제</button>
											</a>

										</c:otherwise>
									</c:choose>
								</p>
							</div>
						</div>
					</div>
				</c:if>
			</form>



			<form method="post"
				action="${contextPath }/product/updateQnaForm.do?product_id=${vo.product_id}&product_qna_num=${qnaList[1].product_qna_num}">
				<c:if test="${not empty qnaList[1] }">
					<div class="card shadow-md b-0 mb-2">
						<div class="card-header mb-0 p-0 b-0 bg-transparent"
							id="cleanHeading2">
							<h2 class="mb-0">
								<button
									class="btn btn-link btn-block btn-lg text-align-start text-decoration-none text-dark collapsed"
									type="button" data-toggle="collapse"
									data-target="#shadowCollapse2" aria-expanded="false"
									aria-controls="shadowCollapse2">
									<span
										style="text-align: center; display: inline-block; width: 10%;">
										<c:out value="${qnaList[1].rowNum}" />
									</span>
									<!--  <span style="display: inline-block; width: 10%;"> <c:out value="${qnaList[1].product_qna_num}" /></span>  -->
									<c:if test="${qnaList[1].parent_num != 0 }">
										<span style="dispaly: inline-block; width: 4%;"
											class="badge badge-soft badge-pill badge-indigo">RE</span>
										<span style="display: inline-block; width: 51%;"><c:out
												value="${qnaList[1].title}" /> </span>
									</c:if>
									<c:if test="${qnaList[1].parent_num == 0 }">
										<span style="display: inline-block; width: 55%;"><c:out
												value="${qnaList[1].title}" /> </span>
									</c:if>
									<!-- ${qna.title } -->
									<span
										style="text-align: center; display: inline-block; width: 15%;"><c:out
											value="${qnaList[1].member_id}" /></span>
									<!-- ${qna.member_id } -->
									<span
										style="text-align: center; display: inline-block; width: 15%;"><c:out
											value="${qnaList[1].reg_date}" /></span>
									<!-- ${qna.reg_date } -->
									<span class="group-icon float-end"> <i
										class="fi fi-arrow-start-slim"></i> <i
										class="fi fi-arrow-down-slim"></i>
									</span>
								</button>
							</h2>
						</div>

						<div id="shadowCollapse2" class="collapse"
							aria-labelledby="cleanHeading2"
							data-parent="#accordionShadow">
							<div class="card-body">

								${qnaList[1].contents}

								<p>
									<c:if test="${not empty qnaList[1].image1 }">
										<img
											src="${contextPath}/resources/images/product_qna/${qnaList[1].image1}">
									</c:if>
									<c:if test="${not empty qnaList[1].image2 }">
										<img
											src="${contextPath}/resources/images/product_qna/${qnaList[1].image1}">
									</c:if>
									<c:if test="${not empty qnaList[1].image3 }">
										<img
											src="${contextPath}/resources/images/product_qna/${qnaList[1].image1}">
									</c:if>
								</p>

								<p>
									<c:choose>
										<c:when test="${member_id=='admin' }">
											<a
												href="${contextPath }/product/insertQnaForm.do?product_id=${vo.product_id}&product_qna_num=${qnaList[1].product_qna_num}">
												<button style="float: right;" type="button"
													class="btn btn-purple btn-soft mb-1">답변</button>
											</a>
										</c:when>
										<c:otherwise>
											<button style="float: right;" type="submit"
												class="btn btn-purple btn-soft mb-1">수정</button>

											<a
												href="${contextPath }/product/deleteBoardQna.do?product_id=${vo.product_id}&product_qna_num=${qnaList[1].product_qna_num}">
												<button style="float: right;" type="button"
													class="btn btn-purple btn-soft mb-1">삭제</button>
											</a>

										</c:otherwise>
									</c:choose>
								</p>
							</div>
						</div>
					</div>
				</c:if>
			</form>

			<form method="post"
				action="${contextPath }/product/updateQnaForm.do?product_id=${vo.product_id}&product_qna_num=${qnaList[2].product_qna_num}">
				<c:if test="${not empty qnaList[2] }">
					<div class="card shadow-md b-0 mb-2">
						<div class="card-header mb-0 p-0 b-0 bg-transparent"
							id="cleanHeading3">
							<h2 class="mb-0">
								<button
									class="btn btn-link btn-block btn-lg text-align-start text-decoration-none text-dark collapsed"
									type="button" data-toggle="collapse"
									data-target="#shadowCollapse3" aria-expanded="false"
									aria-controls="shadowCollapse3">
									<span
										style="text-align: center; display: inline-block; width: 10%;">
										<c:out value="${qnaList[2].rowNum}" />
									</span>
									<!--  	 <span style="display: inline-block; width: 10%;"> <c:out value="${qnaList[2].product_qna_num}" /></span>-->
									<!-- ${qna.product_qna_num } -->
									<c:if test="${qnaList[2].parent_num != 0 }">
										<span style="display: inline-block; width: 4%;"
											class="badge badge-soft badge-pill badge-indigo">RE</span>
										<span style="display: inline-block; width: 51%;"><c:out
												value="${qnaList[2].title}" /> </span>
									</c:if>
									<c:if test="${qnaList[2].parent_num == 0 }">
										<span style="display: inline-block; width: 55%;"><c:out
												value="${qnaList[2].title}" /> </span>
										<!-- ${qna.title } -->
									</c:if>
									<span
										style="text-align: center; display: inline-block; width: 15%; text-align: center;"><c:out
											value="${qnaList[2].member_id}" /></span>
									<!-- ${qna.member_id } -->
									<span
										style="text-align: center; display: inline-block; width: 15%;"><c:out
											value="${qnaList[2].reg_date}" /></span>
									<!-- ${qna.reg_date } -->
									<span class="group-icon float-end"> <i
										class="fi fi-arrow-start-slim"></i> <i
										class="fi fi-arrow-down-slim"></i>
									</span>
								</button>
							</h2>
						</div>

						<div id="shadowCollapse3" class="collapse"
							aria-labelledby="cleanHeading3" data-parent="#accordionShadow">
							<div class="card-body">

								${qnaList[2].contents}

								<p>
									<c:if test="${not empty qnaList[2].image1 }">
										<img
											src="${contextPath}/resources/images/product_qna/${qnaList[2].image1}">
									</c:if>
									<c:if test="${not empty qnaList[2].image2 }">
										<img
											src="${contextPath}/resources/images/product_qna/${qnaList[2].image1}">
									</c:if>
									<c:if test="${not empty qnaList[2].image3 }">
										<img
											src="${contextPath}/resources/images/product_qna/${qnaList[2].image1}">
									</c:if>
								</p>

								<p>
									<c:choose>
										<c:when test="${member_id=='admin' }">
											<a
												href="${contextPath }/product/insertQnaForm.do?product_id=${vo.product_id}&product_qna_num=${qnaList[2].product_qna_num}">
												<button style="float: right;" type="button"
													class="btn btn-purple btn-soft mb-1">답변</button>
											</a>
										</c:when>
										<c:otherwise>
											<button style="float: right;" type="submit"
												class="btn btn-purple btn-soft mb-1">수정</button>

											<a
												href="${contextPath }/product/deleteBoardQna.do?product_id=${vo.product_id}&product_qna_num=${qnaList[2].product_qna_num}">
												<button style="float: right;" type="button"
													class="btn btn-purple btn-soft mb-1">삭제</button>
											</a>

										</c:otherwise>
									</c:choose>
								</p>

							</div>
						</div>
					</div>
				</c:if>
			</form>





			<!-- 글쓰기 -->
			<div>
				<br> <br> <a
					href="${contextPath }/product/insertQnaForm.do?product_id=${vo.product_id}">
					<button style="float: right;" type="button"
						class="btn btn-purple btn-soft mb-1">상품문의</button>
				</a> <br> <br>

			</div>
			<!-- 글쓰기 -->

			<!-- 
         <button style="float: right;"type="button" class="btn btn-purple btn-soft mb-1">  </button>
          -->

			<!-- pagination -->
			<div>
				<nav aria-label="pagination" class="mt-5">
					<ul
						class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end">
						<%--[이전으로] 사용불가 또는 안보이게 : 첫번째 블록인경우 --%>
						<c:if test="${pvo.beginPage == 1}">
							<li class="page-item disabled"><a class="page-link" href="#"
								tabindex="-1" aria-disabled="true">Previous</a></li>
						</c:if>
						<c:if test="${pvo.beginPage != 1}">
							<li class="page-item"><a class="page-link"
								href="${contextPath}/product/productDetail.do?product_id=${vo.product_id }&cPage=${pvo.beginPage - 1 }&nPage=${rePvo.beginPage-1}">Previous</a>
							</li>
						</c:if>

						<%-- 페이지 표시(시작페이지~끝페이지) --%>
						<c:forEach var="pageNo" begin="${pvo.beginPage }"
							end="${pvo.endPage }">
							<c:if test="${pageNo == pvo.nowPage }">
								<li class="page-item active"><a class="page-link">${pageNo }<span
										class="sr-only">??</span></a></li>
							</c:if>
							<c:if test="${pageNo != pvo.nowPage }">
								<li class="page-item" aria-current="page"><a
									class="page-link"
									href="${contextPath}/product/productDetail.do?product_id=${vo.product_id }&cPage=${pageNo}&nPage=${pageNo}">${pageNo }</a>
								</li>
							</c:if>
						</c:forEach>

						<%--[다음으로] 사용여부 처리 --%>
						<c:if test="${pvo.endPage >= pvo.totalPage }">
							<li class="page-item disabled"><a class="page-link">Next</a>
							</li>
						</c:if>

						<c:if test="${pvo.endPage < pvo.totalPage }">

							<li class="page-item"><a class="page-link"
								href="${contextPath}/product/productDetail.do?product_id=${vo.product_id }&cPage=${pvo.endPage +1}&nPage=${rePvo.endPage+1}">Next</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
			<!-- pagination -->

		</div>
</section>