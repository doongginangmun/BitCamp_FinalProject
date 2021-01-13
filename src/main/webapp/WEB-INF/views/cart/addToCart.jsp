<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
var quantity="0";
var opt_name;

function changeOption() {
	var selectOpt = document.getElementById("opt");
	var tmp = selectOpt.options[selectOpt.selectedIndex].text;
	var tmp1 = tmp.lastIndexOf("원");
	var num = tmp.indexOf("[");
	var str = tmp.substring(0,num);
	opt_name = str.trim();
}
function changeQuantity() {

	var selectOpt =  document.getElementById("opt_quantity");
	    quantity  = parseInt(selectOpt.options[selectOpt.selectedIndex].text);
}
function add_cart(product_name,quantity,opt_name) {
	if(${not empty optionList} && !opt_name){
		alert("옵션을 선택해주세요");
		return;
	}
	
	if(quantity==0){
		quantity=1;
	}
	if(!opt_name){
		opt_name="";
	}
	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/cart/addProductInCart.do",
		data : {
			product_name:product_name,
			quantity:quantity,
			option_name:opt_name
		},
		success : function(data, textStatus) {
			if(data.trim()=='add_success'){
				alert("카트에 등록되었습니다.");
			}else if(data.trim()=='already_existed'){
				alert("이미 카트에 등록된 상품입니다.");	
			}else if(data.trim()=='logingo'){
				alert("로그인을 먼저 해주세요.");
			}
		},
		error : function(data, textStatus) {
		},
		complete : function(data, textStatus) {
		}
	}); //end ajax	

}
</script>