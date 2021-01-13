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

	<!--

						PAGE TITLE
					-->
	<div class="page-title bg-transparent b-0">

		<h1 class="h4 mt-4 mb-0 px-3 font-weight-normal" style="padding-left: 1.5rem !important;">1:1 문의</h1>

	</div>
	
	<section class="py-4 mb-5" style="padding:0;">
	
		<div class="container" style="margin:0; padding:0;">

			<div class="col-12 col-lg-10 offset-lg-1" style="margin:0;">

				<div class="p-4 shadow-xs bg-white rounded" style="padding:0;">

					<div class="border-bottom pb-3 mb-5">
						<h1 class="h2 h3-xs" style="padding-bottom:5px;">${memQ.title }</h1>

						<nav aria-label="breadcrumb">
							<ol class="breadcrumb fs--14">
								<li class="breadcrumb-item">카테고리: ${memQ.qna_category_name }</li>
								<li class="breadcrumb-item">작성자: ${memQ.member_id }</li>
								<li class="breadcrumb-item">주문번호: ${memQ.order_num}</li>
							</ol>
							<ol class="breadcrumb fs--14">
								<li class="breadcrumb-item">이메일: ${memQ.email}</li>
								<li class="breadcrumb-item">전화번호: ${memQ.phone }</li>
							</ol>
						</nav>

					</div>

					<div class="article-format">

						<p class="lead" style="height: 100px">${memQ.contents }</p>
						
						<p class="lead">
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
						</p>

						<p class="border-top py-3 m-0 text-muted fs--13">Last Update:
							${memQ.reg_date }</p>

					</div>
					
					
					<c:if test="${memQ.parent_num == 0 }">
						<button type="button" class="btn btn-primary btn-soft-static mb-1"
							onclick="location.href='${contextPath}/adminboard/memqAdminInsert.do?cPage=${paging.nowPage}&member_qna_num=${memQ.member_qna_num }&member_id=${memQ.member_id }&cPage=${paging.nowPage}'">
							답변하기
						</button>
					</c:if>
					
					<c:if test="${vo.daterange == null }">
						<button type="button" class="btn btn-secondary btn-soft-static mb-1" 
							onclick="location.href='${contextPath }/adminboard/memberQnaList.do?cPage=${paging.nowPage}'">
							목록
						</button>
					</c:if>
					
					<c:if test="${vo.daterange != null }">
						<button type="button" class="btn btn-secondary btn-soft-static mb-1" 
							onclick="location.href='${contextPath }/adminboard/memberQnaList.do?cPage=${paging.nowPage}&daterange=${vo.daterange}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}'">
							목록
						</button>
					</c:if>
					
					<c:if test="${memQ.parent_num != 0 }">
						<button type="button" class="btn btn-primary btn-soft-static mb-1"
							onclick="location.href='${contextPath}/adminboard/memqAdminUpdate.do?member_qna_num=${memQ.member_qna_num}&member_id=${memQ.member_id }&cPage=${paging.nowPage}'">
							수정
						</button>
					</c:if>
					
					<button type="button" class="btn btn-danger btn-soft-static mb-1"
						onclick="location.href='${contextPath }/adminboard/memqDelete.do?member_qna_num=${memQ.member_qna_num}&cPage=${paging.nowPage}'">
						삭제
					</button>

				</div>


			</div>

		</div>
	</section>

</div>
<!-- /MIDDLE -->