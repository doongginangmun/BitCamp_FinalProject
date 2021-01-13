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

		<h1 class="h4 mt-4 mb-0 px-3 font-weight-normal" style="padding-left: 1.5rem !important;">자주하는 질문</h1>

	</div>
	
	<section class="py-4 mb-5" style="padding:0">
	
		<div class="container" style="margin:0; padding:0;">

			<div class="col-12 col-lg-10 offset-lg-1" style="margin:0">

				<div class="p-4 shadow-xs bg-white rounded" style="padding:0">

					<div class="border-bottom pb-3 mb-5">
						<h1 class="h2 h3-xs" style="padding-bottom:5px">${faq.title }</h1>

						<nav aria-label="breadcrumb">
							<ol class="breadcrumb fs--14">
								<li class="breadcrumb-item">카테고리: ${faq.qna_category_name }</li>
								<li class="breadcrumb-item">작성자: ${member_id }</li>
							</ol>
						</nav>

					</div>

					<div class="article-format" style="border-bottom: 1px solid #dde4ea; margin-bottom: 10px;">

						<p class="lead" style="margin-left:14px">${faq.contents }</p>

					</div>
					
					<c:if test="${vo.searchKeyword == null }">
						<button type="button" class="btn btn-secondary btn-soft-static mb-1" 
							onclick="location.href='${contextPath }/adminboard/faqList.do?cPage=${paging.nowPage}'">
							목록
						</button>
					</c:if>
					
					<c:if test="${vo.searchKeyword != null }">
						<button type="button" class="btn btn-secondary btn-soft-static mb-1" 
							onclick="location.href='${contextPath }/adminboard/faqList.do?cPage=${paging.nowPage}&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}'">
							목록
						</button>
					</c:if>
					
					<button type="button" class="btn btn-primary btn-soft-static mb-1"
						onclick="location.href='${contextPath }/adminboard/faqUpdate.do?faq_num=${faq.faq_num}&cPage=${paging.nowPage}'">
						수정
					</button>
					<button type="button" class="btn btn-danger btn-soft-static mb-1"
						onclick="location.href='${contextPath }/adminboard/faqDelete.do?faq_num=${faq.faq_num}'">
						삭제
					</button>

				</div>


			</div>

		</div>
	</section>

</div>
<!-- /MIDDLE -->