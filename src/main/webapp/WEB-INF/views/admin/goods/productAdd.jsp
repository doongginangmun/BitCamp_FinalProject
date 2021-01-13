<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>상품 추가 페이지</title>
<!-- <script type="text/javascript" src="../se2/js/HuskyEZCreator.js" charset="utf-8"></script> -->
<script>
function checkProduct(){
	id = $("#product_id").val();
	
	$.ajax({
		type : "post",
		async : false,
		url : "${contextPath}/admin/checkProduct.do", //호출 후
		dataType : "text",
		data : {id : id},

	    success : function(data, textStatus) { //result로 true,false전달
			if (data == 'false') {
				_id = document.getElementById("_product_id");
				_id.innerHTML = "사용 가능";
				document.getElementById("_product_id").style.color='lime';
			} else {
				_id = document.getElementById("_product_id");
				_id.innerHTML = "사용 불가";
				document.getElementById("_product_id").style.color='red';
			}
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다.");
			ㅣ
		},
		complete : function(data, textStatus) {
			//alert("작업을완료 했습니다");
		}
	  });


}
function checkItem(){
	id = $("#item_num").val();
	
	$.ajax({
		type : "post",
		async : false,
		url : "${contextPath}/admin/checkItem.do", //호출 후
		dataType : "text",
		data : {id : id},

	    success : function(data, textStatus) { //result로 true,false전달
			if (data == 'false') {
				_id = document.getElementById("_item_num");
				_id.innerHTML = "사용 가능";
				document.getElementById("_item_num").style.color='lime';
			} else {
				_id = document.getElementById("_item_num");
				_id.innerHTML = "사용 불가";
				document.getElementById("_item_num").style.color='red';
			}
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다.");
			
		},
		complete : function(data, textStatus) {
			//alert("작업을완료 했습니다");
		}
	  });


}
</script>
</head>


			<div id="middle" class="flex-fill">

				<form action="add.do" method="post" enctype="multipart/form-data">
					<section>
						<label>카테고리 설정</label>
							<div>
								<select required  name="product_category_num" class="form-control bs-select" data-live-search="true" title="선택해주세요">

									<option value="1" class="font-weight-medium">고기</option>
									<option value="2" class="font-weight-medium">채소</option>
									<option value="3" class="font-weight-medium">베이커리</option>
									<!-- <option value="4" class="font-weight-medium">기타</option> -->

								</select>

							
							</div>
					</section>
					<section>
						<label>Product</label>
						<br>
						<div>
							<label>상품 아이디</label>
							<input class="form-control col-md-3" type="text" id="product_id" name="product_id" required="required" oninput="checkProduct()">
							<label id="_product_id"></label>
						</div>
						<div> 
							상품명 <input class="form-control col-md-3" type="text" name="product_name" required="required">
						</div>
						<br><br>
						<div>
							상품 설명
							<textarea name="product_detail"
								class="summernote-editor w-100 h--350" 
								data-min-height="350" data-max-height="2800" data-focus="false"
								data-lang="UTF-8">
							</textarea>
						</div><br><br>
						<div>
							판매 단위 <input class="form-control col-md-3" type="text" name="sales_unit" required="required" ><br><br>
							상품 용량 <input class="form-control col-md-3" type="text" name="product_size" required="required" ><br><br>
							포장 타입 <input class="form-control col-md-3" type="text" name="packing_type" required="required"	><br><br>
							거래처 <input class="form-control col-md-3" type="text" name="supplier" required="required"><br><br>
						</div>
					</section>
					<section>
						<label>IMAGE</label>
						<br>
						<div>
							상품 이미지 <input type="file" name="image" required="required"><br><br> 
							상품 상세 이미지 <input type="file" name="detail_image" required="required"><br><br>
						</div>
					</section>
					<section>
						<label>ITEM</label>
						<br>
						<div>
							제품 번호 <input class="form-control col-md-3" type="text" id="item_num" name="item_num" required="required" oninput="checkItem()">
							<label id="_item_num"></label>
							<br><br>
							
							등록 날짜 <input class="form-control col-md-3" type="date" name="reg_date" required="required" ><br><br>

							재고 <input class="form-control col-md-3" type="text" name="stock" required="required" ><br><br>
							
							단위 가격 <input class="form-control col-md-3" type="text" name="unit_price" required="required" ><br><br>

							가격 <input class="form-control col-md-3" type="text" name="price" required="required" ><br><br> 
							
							할인율 <input class="form-control col-md-3" type="text" name="discount" required="required" ><br><br>

							판매량 <input class="form-control col-md-3" type="text" name="sales" readonly value="0"><br><br>
						</div>
					</section>
		
					<button type="submit" value="상품 추가" class="btn btn-primary"><i class="fi fi-check"></i>상품추가</button> <input type="reset" value="리셋" class="btn btn-primary">

				</form>

			</div>

