<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="/WEB-INF/views/common/daumZip.jsp" />



			<!-- MIDDLE -->
			<div id="middle" class="flex-fill">

				<!--

						PAGE TITLE
					-->
				<div class="page-title bg-transparent b-0">

					<h1 class="h4 mt-4 mb-0 px-3 font-weight-normal">계정 설정</h1>

				</div>




				<form novalidate class="bs-validate d-block mb-7" method="post"
					action="${contextPath}/admin/member/modifyMemberInfo.do"
					enctype="multipart/form-data">

					<div class="row gutters-sm mb-3">





						<div class="col-12 mb-3">

							<!-- portlet -->
							<div class="portlet">

								<!-- portlet : header -->
								<div class="portlet-header">
									<span
										class="d-block text-dark text-truncate font-weight-medium">
										회원정보 </span>
								</div>
								<!-- /portlet : header -->


								<!-- portlet : body -->
								<div class="portlet-body">

									<div class="row gutters-sm d-flex align-items-center">

										<div class="col-12 col-md-6">

											<div class="form-label-group mt-3">
												<input required id="member_id" name="member_id" type="text"
													value="${member_info.member_id }" class="form-control"
													readonly> <label for="member_id">아이디</label>
											</div>

										</div>

										<div class="col-12 col-md-6">

											<div class="form-label-group mt-3">
												<input required id="member_name" name="member_name"
													type="text" value="${member_info.member_name }"
													class="form-control"> <label for="member_name">이름</label>
											</div>

										</div>

										<div class="col-12 col-md-6">

											<div class="form-label-group mt-3">
												<input id="email" name="email" type="email"
													value="${member_info.email }" class="form-control">
												<label for="email">이메일</label>
											</div>

										</div>

										<div class="col-12 col-md-6">

											<div class="form-label-group mt-3">
												<input id="phone" name="phone" type="tel"
													value="${member_info.phone }" class="form-control">
												<label for="account_phone_number">휴대폰 번호</label>
											</div>

										</div>

										<div class="col-12 col-md-6">

											<div class="form-label-group mt-3">
												<input id="member_date" name="member_date" type="date"
													value="${member_info.member_date }" class="form-control"
													readonly> <label for="member_date">가입일</label>
											</div>

										</div>

										<div class="col-12 col-md-6">

											<div class="form-label-group mt-3">
												<input id="birthday" name="birthday" type="date"
													value="${member_info.birthday }" class="form-control">
												<label for="birthday">생일</label>
											</div>

										</div>

										
										<div class="col-12 col-md-6">

											<div class="form-label-group mt-3">
												<input id="point" name="point" type="number"
													value="${member_info.point }" class="form-control">
												<label for="point">포인트</label>
											</div>

										</div>

										<div class="col-12 col-md-3">

											<div class="form-label-group mt-3">
												<input class="form-control" type="text" id="member_grade"
													data-toggle="dropdown" aria-expanded="true"
													<c:choose>
													<c:when test="${member_info.member_id eq 'admin' }">
													value="관리자"
													</c:when>
													<c:when test="${member_info.pre_score >10000}">
													value="우수회원"
													</c:when>
													<c:otherwise>
													value="일반회원"
													</c:otherwise>
													</c:choose>
													readonly> <label for="member_grade">회원등급</label>
											</div>

										</div>

										<div class="col-12 col-md-3">

											<div class="form-label-group mt-3">
												<input id="pre_score" name="pre_score" type="number"
													value="${member_info.pre_score }" class="form-control"
													> <label for="pre_score">전월 실적</label>
											</div>

										</div>


										<div class="col-3">

											<div class="form-label-group mt-3">
												<input placeholder="Address" id="zipNo" name="zipNo"
													type="text" value="${member_info.zipNo }"
													class="form-control col-md-9"
													style="margin-bottom: 0; display: inline-block"> <label
													for="zipNo">우편번호</label> <a class="btn btn-primary"
													href="javascript:execDaumPostcode()"
													style="margin-bottom: 4px">검색</a>

											</div>

										</div>


										<div class="col-3">

											<div class="form-label-group mt-3">
												<input placeholder="Address" id="load_address"
													name="load_address" type="text"
													value="${member_info.load_address }" class="form-control">
												<label for="load_address">도로명 주소</label>
											</div>

										</div>
										<div class="col-3">

											<div class="form-label-group mt-3">
												<input placeholder="address" id="jibun_address"
													name="jibun_address" type="text"
													value="${member_info.jibun_address }" class="form-control">
												<label for="jibun_address">지번 주소</label>
											</div>

										</div>
										<div class="col-3">

											<div class="form-label-group mt-3">
												<input placeholder="address" id="rest_address"
													name="rest_address" type="text"
													value="${member_info.rest_address }" class="form-control">
												<label for="rest_address">나머지 주소</label>
											</div>

										</div>


									</div>

								</div>
								<!-- /portlet : body -->

							</div>
							<!-- /portlet -->

						</div>

					</div>


					<button type="submit" class="btn btn-primary"
						onclick="fn_modify_member()">
						<i class="fi fi-check"></i> 회원정보 변경
					</button>
					<script type="text/javascript">
						function fn_modify_member() {
							const result = confirm("변경하시겠습니까?");
						}
					</script>

					<!-- 회원삭제 버튼 -->
					<a
						href="${contextPath}/admin/member/deleteMember.do?member_id=${member_info.member_id}"
						class="js-ajax-confirm btn btn-danger"
						data-ajax-confirm-size="modal-md"
						data-ajax-confirm-centered="false"
						data-ajax-confirm-callback-function='function(){windWow.location.href = "${contextPath}/admin/member/memberList.do";}'
						data-ajax-confirm-mode="json" data-ajax-confirm-method="GET"
						data-ajax-confirm-title="Please Confirm"
						data-ajax-confirm-body="Are you sure? Delete this item?"
						data-ajax-confirm-btn-yes-text="Confirm"
						data-ajax-confirm-btn-yes-class="btn-sm btn-danger"
						data-ajax-confirm-btn-yes-icon="fi fi-check"
						data-ajax-confirm-btn-no-text="Cancel"
						data-ajax-confirm-btn-no-class="btn-sm btn-light"
						data-ajax-confirm-btn-no-icon="fi fi-close" rel="nofollow"> <i
						class="fi fi-shield-ok"></i> 회원삭제
					</a>



				</form>

			</div>
			<!-- /MIDDLE -->
	<script src="${contextPath}/resources/assets/js/core.js"></script>
