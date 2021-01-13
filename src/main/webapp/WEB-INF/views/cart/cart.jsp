<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script>
    var sell_price;
	var amount;
	var discount;
	var total_price;
	var total_discount;
	var shipping = 3500;
	function add(product_name, cart_id, index) {
		var currentIndex = parseInt(index);
		total_price = parseInt(document.getElementById("total_price").innerText);
		total_discount = parseInt(document.getElementById("total_discount").innerText);

		if (!document.form["amount"][currentIndex]) {
			amount = parseInt(document.form.amount.value) + 1;
			sell_price = parseInt(document.form.sell_price.value);
			discount = parseInt(document.form.discount.value);
		} else {
			amount = parseInt(document.form["amount"][currentIndex].value) + 1;
			sell_price = parseInt(document.form["sell_price"][currentIndex].value);
			discount = parseInt(document.form["discount"][currentIndex].value);
		}
				$.ajax({
					type : "post",
					async : false,
					url : "${contextPath}/cart/plusQuantity.do",
					data : {
						cart_id : cart_id,
						product_name : product_name
					},
					success : function(data, textStatus) {
						if (data.trim() == 'add_success') {

							document.getElementsByName("product_pri")[currentIndex].innerHTML = "<del>"
									+ parseInt(amount * sell_price)
									+ " 원"
									+ "</del>";
							document.getElementsByName("cash")[currentIndex].innerHTML = parseInt(amount
									* (sell_price - discount))
									+ " 원";
							document.getElementsByName("discountTest")[currentIndex].innerHTML = "할인 금액 :"
									+ "<br>"
									+ parseInt(amount * discount)
									+ " 원";
							document.getElementsByName("amount")[currentIndex].value = amount;

							document.getElementById("total_price").innerHTML = parseInt(total_price
									+ (sell_price - discount))
									+ " 원";
							document.getElementById("total_discount").innerHTML = parseInt(total_discount
									+ discount)
									+ " 원";
							document.getElementById("total-price").innerHTML = parseInt(total_price
									+ (sell_price - discount) + shipping)
									+ " 원";
						}
					},
					error : function(data, testStatus) {
						alert("에러발생 ㅠ" + data);
					},
					complete : function(data, textStatus) {
					}
				}); //end ajax
	}
	function del(product_name, cart_id, index) {
		var currentIndex = parseInt(index);
		total_price = parseInt(document.getElementById("total_price").innerText);
		total_discount = parseInt(document.getElementById("total_discount").innerText);

		if (!document.form["amount"][currentIndex]) {
			amount = parseInt(document.form.amount.value)-1;
			if (amount < 1) {
				document.form.amount.value = 1;
				return;
			}
			sell_price = parseInt(document.form.sell_price.value);
			discount = parseInt(document.form.discount.value);
		} else {
			amount = parseInt(document.form["amount"][currentIndex].value) - 1;
			if (amount < 1) {
				amount = 1;
				return;
			}
			sell_price = parseInt(document.form["sell_price"][currentIndex].value);
			discount = parseInt(document.form["discount"][currentIndex].value);
			document.getElementsByName("amount")[currentIndex].value = parseInt(amount);
		}
				$.ajax({
					type : "post",
					async : false,
					url : "${contextPath}/cart/minusQuantity.do",
					data : {
						cart_id : cart_id,
						product_name : product_name
					},
					success : function(data, textStatus) {
						if (data.trim() == 'add_success1') {
							document.getElementsByName("product_pri")[currentIndex].innerHTML = "<del>"
									+ parseInt(amount * sell_price)
									+ " 원"
									+ "</del>";
							document.getElementsByName("cash")[currentIndex].innerHTML = parseInt(amount
									* (sell_price - discount))
									+ " 원";
							document.getElementsByName("discountTest")[currentIndex].innerHTML = "할인 금액 :"
									+ "<br>"
									+ parseInt(amount * discount)
									+ " 원";
							document.form.amount.value = amount;
							document.getElementById("total_price").innerHTML = parseInt(total_price
									- (sell_price - discount))
									+ " 원";
							document.getElementById("total_discount").innerHTML = parseInt(total_discount
									- discount)
									+ " 원";
							document.getElementById("total-price").innerHTML = parseInt(total_price
									- (sell_price - discount) + shipping)
									+ " 원";
						}
					},
					error : function(data, testStatus) {
						alert("에러발생 ㅠ" + data);
					},
					complete : function(data, textStatus) {
					}
				}); //end ajax
	}
	function deleteAllProduct() {
		var delconfirm = confirm("장바구니 항목 전체를 삭제하시겠습니까?");
		if (delconfirm) {
			location.href = "${contextPath}/cart/deleteAllProduct.do";
		}
	}
	function deleteProduct(product_name, cart_id) {
		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/cart/removeCartProduct.do",
			data : {
				product_name : product_name,
				cart_id : cart_id
			},
			success : function(data, textStatus) {
			},
			error : function(data, textStatus) {
				alert("에러ㅠㅠ" + data);
			},
			complete : function(data, textStaus) {
				refreshMemList();
			}
		}); //end ajax
	}
	function refreshMemList() {
		location.reload();
	}
    </script>