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

		<h1 class="h4 mt-4 mb-0 px-3 font-weight-normal">FAQ 수정</h1>

	</div>

	<form novalidate class="bs-validate" method="post" action="${contextPath }/adminboard/faqUpdating.do"
		enctype="multipart/form-data">
		<input type="hidden" name="faq_num" value="${faq.faq_num }">
		<input type="hidden" name="cPage" value="${paging.nowPage}">

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
						<input required placeholder="Product Title" id="product_title"
							name="title" type="text" value="${faq.title }" class="form-control" style="padding-top: 6px">
					</div>
					<div class="form-label-group mb-3">
						<select name="qna_category_num" class="form-control" style="padding-top: 6px">
							<option value="${faq.qna_category_num }" selected>${faq.qna_category_name }</option>
							<option value="1">배송지연/불만</option>
							<option value="2">반품문의</option>
							<option value="4">환불문의</option>
							<option value="5">주문결제문의</option>
							<option value="6">회원정보문의</option>
							<option value="7">교환문의</option>
							<option value="8">기타문의</option>
						</select>
					</div>



					<!--
									Note: if data-lang is changed, also the javascript 
									file need to be loaded. You can include the language
									file from gulp.config__vendors.js and add here!

									+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
									To upload the image, add your server-side script path:
										data-ajax-url="upload.php" 
										data-ajax-params="['action','upload']['param2','value2']"

									The upload script should return a valid image full URL
									like this: https://www.mydomain.com/upload/image.jpg
									data-ajax-params are optional and used as identifiers by your backend.
									+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
									-->
					<textarea name="contents"
						class="summernote-editor w-100 h--350"
						data-min-height="350"
						data-max-height="2800" data-focus="false" data-lang="en-US"
						data-ajax-url="_ajax/demo.summernote.php"
						data-ajax-params="['action','editor:image:upload']"
						data-toolbar='[
												["style", ["style"]],
												["font", ["bold", "italic", "underline", "clear"]],
												["fontname", ["fontname"]],
												["color", ["color"]],
												["para", ["ul", "ol", "paragraph"]],
												["table", ["table"]],
												["insert", ["link", "picture", "hr"]],
												["view", ["codeview"]],
												["help", ["help"]]
											]'>${faq.contents }</textarea>
					<small class="text-gray-400">* shift + enter = new line</small>

				</div>

			</div>

		</section>

		<!-- 
							SUBMIT BUTTON 
						-->
		<button type="submit" class="btn btn-primary">
			<i class="fi fi-check"></i> 저장
		</button>

	</form>


</div>
<!-- /MIDDLE -->