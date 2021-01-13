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

		<h1 class="h4 mt-4 mb-0 px-3 font-weight-normal">회원문의 답변 등록</h1>

	</div>

	<form novalidate class="bs-validate" method="post" action="${contextPath }/adminboard/memqAdminAdd.do"
		enctype="multipart/form-data">
		<input type="hidden" name="member_id" value="${memberInfo.member_id }">
		<input type="hidden" name="email" value="${memberInfo.email }">
		<input type="hidden" name="phone" value="${memberInfo.phone }">
		<input type="hidden" name="member_qna_num" value="${memQ.member_qna_num }">
		<input type="hidden" name="cPage" value="${cPage}">
		<input type="hidden" name="action" value="memqAdminAdd">
		
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
							name="title" type="text" value="${memQ.title }" class="form-control">
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
											]'>${memQ.contents }</textarea>
					<small class="text-gray-400">* shift + enter = new line</small>

				</div>


				<div class="col-12 col-lg-12 col-xl-4 mb-5">

					<!--
										PRODUCT IMAGES
									-->
					<div class="clearfix bg-light p-2 mb-2 rounded">

						<label class="btn btn-warning cursor-pointer position-relative">

							<input name="file" multiple="multiple" type="file"
							data-file-ext="jpg,jpeg,png"
							data-file-max-size-kb-per-file="3072"
							data-file-max-size-kb-total="30720"
							data-file-max-total-files="10" data-file-ext-err-msg="Allowed:"
							data-file-exist-err-msg="File already exists:"
							data-file-size-err-item-msg="File too large!"
							data-file-size-err-total-msg="Total allowed size exceeded!"
							data-file-size-err-max-msg="Maximum allowed files:"
							data-file-toast-position="top-center"
							data-file-preview-container=".js-file-preview-container"
							data-file-preview-img-height="100"
							data-file-preview-show-info="true"
							data-file-btn-clear="a.js-file-btn-clear"
							data-file-preview-img-cover="true"
							data-file-preview-class="shadow-md my-2 mr-3 rounded float-start"
							class="custom-file-input absolute-full"> 
							<span class="group-icon"> 
								<i class="fi fi-arrow-upload"></i> 
								<i class="fi fi-circle-spin fi-spin"></i>
							</span> 
							<span>Upload Images</span>

						</label>

						<!-- remove button -->
						<a href="#" title="Clear Files" data-toggle="tooltip"
							class="js-file-btn-clear hide btn btn-secondary mb-2"> <i
							class="fi fi-close m-0"></i>
						</a>

						<!-- info -->
						<small class="d-block text-muted"> Upload up to 10 product
							images (jpg, jpeg, png). </small>

						<!--
												
											Container : files are pushed here!
											.hide-empty = container hidden if empty

										-->
						<div
							class="js-file-preview-container d-inline-block position-relative clearfix hide-empty">
							<!-- container -->
						</div>

					</div>




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