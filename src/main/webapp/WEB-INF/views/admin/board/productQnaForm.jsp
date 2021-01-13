<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"   isELIgnored="false"
   %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
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

						<h1 class="h4 mt-4 mb-0 px-3 font-weight-normal">PRODUCT Q&A</h1><br>
						<p> &nbsp;&nbsp;&nbsp;&nbsp;상품 문의글 입니다.<br>&nbsp;&nbsp;&nbsp;&nbsp;
					</div>


					<form novalidate class="bs-validate" method="post" 
					action= "${contextPath }/admin/productQnaReUpdateForm.do"
					enctype="multipart/form-data">

						<!--
							
							PRODUCT DETAIL

						-->
						<section>

							<div class="row gutters-sm">

								<div class="col-12 col-lg-12 col-xl-8 mb-5">

									<!--
										PRODUCT TITLE
									-->
									<div class="form-label-group mb-3">
										<table style="color: gray;" class="table">
											<tbody>
												<tr>
													<th scope="row" width="30%">작성자</th>
													<td width="70%">${qna.member_id }</td>
												</tr>
												<tr>
													<th scope="row">상품아이디</th>
													<td>${qna.product_id }</td>
												</tr>
												<tr>
													<th scope="row">작성일</th>
													<td>${qna.reg_date }</td>
												</tr>
												<tr>
													<th scope="row">제목</th>
													<td>${qna.title }</td>
												</tr>
											</tbody>
										</table>
										<input type="hidden" name="member_id" value="${qna.member_id }">
										<input type="hidden" name="product_id" value="${qna.product_id }">
										<input type="hidden" name="product_qna_num" value="${qna.product_qna_num }">
										<input type="hidden" name="title" value="${qna.title }">
										<input type="hidden" name="contents" value="${qna.contents }">
										
										
										<table style="color:gray; class="table">
											<tr>
												<td>
													${qna.contents }
												</td>
											</tr>
											<tr>
												<td>
													<c:if test="${not empty qna.image1}">
														<img src="${contextPath}/resources/images/product_qna/${qna.image1}">
													</c:if>
													<c:if test="${not empty qna.image2}">
														<img src="${contextPath }/resources/images/product_qna/${qna.image2}">
													</c:if>
													<c:if test="${not empty qna.image3}">
														<img src="${contextPath }/resources/images/product_qna/${qna.image3}">
													</c:if>
												</td>
											</tr>
										</table>
									</div>
									
									
											
											<br><br>
											<c:if test="${qna.member_id != 'admin' }">
											<a href="${contextPath }/admin/productQnaReForm.do?product_id=${qna.product_id}&parent_num=${qna.product_qna_num}&title=${qna.title}">
												<button type="button" class="btn btn-purple btn-soft mb-1">
													답변하기
												</button>
											</a>
											</c:if>
											<c:if test="${qna.member_id == 'admin' }">
												<button type="submit" class="btn btn-purple btn-soft mb-1">
													수정하기
												</button>
											</c:if>
											
											<a href="${contextPath }/admin/productQnaDelete.do?product_qna_num=${qna.product_qna_num}">
												<button type="button" class="btn btn-purple btn-soft mb-1">
													삭제하기
												</button>
											</a>
											<a href="${contextPath }/admin/productQnaList.do">
												<button type="button" class="btn btn-purple btn-soft mb-1">
													목록으로
												</button>
											</a> 
								</div>


						</section>

					</form>

				</div>
				<!-- /MIDDLE -->

			