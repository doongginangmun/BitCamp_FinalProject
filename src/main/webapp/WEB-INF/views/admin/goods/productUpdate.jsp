<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 추가 페이지</title>
</head>


			<div id="middle" class="flex-fill">

				<form action="update.do" method="post" enctype="multipart/form-data">
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
						<div>
							상품 아이디 <input class="form-control col-md-3" type="text" name="product_id" readonly value="${one[0].product_id}"> 
						</div>
						<br>
						<div>
							상품명 <input class="form-control col-md-3" type="text" name="product_name" required="required" value="${one[0].product_name}">
						</div>
						<br><br>
						<div>
							상품 설명
							<textarea name="product_detail"
								class="summernote-editor w-100 h--350" data-placeholder="상품 설명"
								data-min-height="350" data-max-height="2800" data-focus="false"
								data-lang="UTF-8">
							</textarea>
						</div>
						<br><br>
						<div>
							판매 단위 <input class="form-control col-md-3" type="text" name="sales_unit" required="required" value="${one[0].sales_unit}"><br><br> 
							상품 용량 <input class="form-control col-md-3" type="text" name="product_size" required="required" value="${one[0].product_size}"><br><br>
							포장 타입 <input class="form-control col-md-3" type="text" name="packing_type" required="required"	value="${one[0].packing_type}"><br><br> 
							거래처 <input class="form-control col-md-3" type="text" name="supplier" required="required"	value="${one[0].supplier}"><br><br>
						</div>
					</section>
					<section>
						<label>IMAGE</label><br>
						<div>
							상품 이미지 <input type="file" name="image" required="required"><br><br> 
							상품 상세 이미지 <input type="file" name="detail_image" required="required"><br><br>
						</div>
					</section>
					<section>
						<label>ITEM</label>
						<div>
							제품 번호 <input class="form-control col-md-3" type="text" name="item_num" readonly value="${one[0].item_num}"><br><br>
							
							등록 날짜 <input class="form-control col-md-3" type="date" name="reg_date" required="required" value="${one[0].reg_date}"><br><br>

							재고 <input class="form-control col-md-3" type="text" name="stock" required="required" value="${one[0].stock}"><br><br>
							
							단위 가격 <input class="form-control col-md-3" type="text" name="unit_price" required="required" value="${one[0].unit_price}"><br><br>

							가격 <input class="form-control col-md-3" type="text" name="price" required="required" value="${one[0].price}"><br><br> 
							
							할인율 <input class="form-control col-md-3" type="text" name="discount" required="required" value="${one[0].discount}"><br><br>

							판매량 <input class="form-control col-md-3" type="text" name="sales" readonly value="${one[0].sales}"><br><br>
						</div>
					</section>
					<button type="submit" value="상품 추가" class="btn btn-primary"><i class="fi fi-check"></i>수정</button>
				</form>

			</div>

		