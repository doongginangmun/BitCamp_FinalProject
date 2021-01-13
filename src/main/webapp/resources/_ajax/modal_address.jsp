<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- 

		SHIPPING ADDRESS 

	-->
<script
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
	//load함수를 이용하여 core스크립트의 로딩이 완료된 후, 우편번호 서비스를 실행합니다.
	function execDaumPostcode() {
		daum.postcode.load(function() {
					new daum.Postcode(
							{
								oncomplete : function(data) {
									// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
									// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
									var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
									var extraRoadAddr = ''; // 도로명 조합형 주소 변수

									// 법정동명이 있을 경우 추가한다. (법정리는 제외)
									// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
									if (data.bname !== ''
											&& /[동|로|가]$/g.test(data.bname)) {
										extraRoadAddr += data.bname;
									}
									// 건물명이 있고, 공동주택일 경우 추가한다.
									if (data.buildingName !== ''
											&& data.apartment === 'Y') {
										extraRoadAddr += (extraRoadAddr !== '' ? ', '
												+ data.buildingName
												: data.buildingName);
									}
									// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
									if (extraRoadAddr !== '') {
										extraRoadAddr = ' (' + extraRoadAddr
												+ ')';
									}
									// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
									if (fullRoadAddr !== '') {
										fullRoadAddr += extraRoadAddr;
									}

									// 우편번호와 주소 정보를 해당 필드에 넣는다.
									document.getElementById('zipNo').value = data.zonecode; //5자리 새우편번호 사용
									document.getElementById('load_address').value = fullRoadAddr; //도로명 주소
									document.getElementById('jibun_address').value = data.jibunAddress; //지번주소

									// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
									if (data.autoRoadAddress) {
										//예상되는 도로명 주소에 조합형 주소를 추가한다.
										var expRoadAddr = data.autoRoadAddress
												+ extraRoadAddr;
										document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
												+ expRoadAddr + ')';

									} else if (data.autoJibunAddress) {
										var expJibunAddr = data.autoJibunAddress;
										document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
												+ expJibunAddr + ')';
									} else {
										document.getElementById('guide').innerHTML = '';
									}

								}
							}).open();
				});
	}
</script>

<form novalidate class="bs-validate" method="post"
	action="${contextPath}/myaccount/modifyAddressInfo.do">
	<div class="modal-header">
		<h2 class="modal-title fs--18 m-0">주소</h2>

		<button type="button" class="close pointer" data-dismiss="modal"
			aria-label="Close">
			<span class="fi fi-close fs--18" aria-hidden="true"></span>

		</button>
	</div>
	<div class="modal-body">

		<div class="row">

			<div class="col-12 col-sm-6 col-lg-6">

				<div class="form-label-group mb-3">
					<input required placeholder="zipNo" id="zipNo" name="zipNo"
						type="text" class="form-control"> <label for="zipNo">우편번호</label>
				</div>

			</div>

			<div class="col-12 col-sm-6 col-lg-6">

				<div class="form-label-group mb-3">
					<a href="javascript:execDaumPostcode()">우편번호검색</a>
				</div>

			</div>






			<div class="col-12 col-sm-12 col-lg-12 mb--20">

				<div class="form-label-group mb-3">
					<input required placeholder="load_address" id="load_address"
						name="load_address" type="text" class="form-control"> <label
						for="load_address">도로명 주소</label>
				</div>

				<div class="form-label-group mb-3">
					<input required placeholder="jibun_address" id="jibun_address"
						name="jibun_address" type="text" class="form-control"> <label
						for="jibun_address">지번 주소</label>
				</div>

				<div class="form-label-group mb-3">
					<input placeholder="rest_address" id="rest_address"
						name="rest_address" type="text" class="form-control"> <label
						for="rest_address">나머지 주소</label>
				</div>

			</div>







			<!-- <div class="col-12 col-sm-6 col-lg-6">

					<div class="form-label-group mb-3">
						<input placeholder="City/Town" id="addr_city" name="addr_city" type="text" class="form-control">
						<label for="addr_city">City/Town</label>
					</div>

				</div>


				<div class="col-12 col-sm-6 col-lg-6">

					<div class="form-label-group mb-3">
						<input placeholder="Apt, Suite, Unit, Building, Floor, etc" id="addr_address_2" name="addr_address_2" type="text" class="form-control">
						<label for="addr_address_2">나머지 주소</label>
					</div>

				</div>



					
						based on `SOW : Ajax Select` plugin 
						documentation/plugins-sow-ajax-select.html
					
					<select name="addr_country" class="form-control js-ajax bs-select" data-ajax-target="#addr_state" data-live-search="true">
						<option value="0">Select Contry...</option>
						<option value="1">United States</option>
						<option value="2">Romania</option>
					</select>

				</div>



					
						based on `SOW : Ajax Select` plugin 
						documentation/plugins-sow-ajax-select.html
					
					<select name="addr_state" id="addr_state" class="form-control bs-select" disabled=""
						data-ajax-url="_ajax/select_ajax_state_list.php" 
						data-ajax-method="GET" 
						data-ajax-params="['action','get_state_list']['param2','value2']" 
						data-live-search="true">
						<option value="">Select Country First</option>
					</select>

				</div> -->

		</div>

	</div>

	<div class="modal-footer">
		<button type="submit" class="btn btn-sm btn-primary"
			onclick="save_Changes()">
			<i class="fi fi-check"></i> 변경사항 저장
		</button>
		<script type="text/javascript">
			function save_Changes() {
				const result = confirm("변경되었습니다");
			}
		</script>

		<a href="#" class="btn btn-sm btn-secondary" data-dismiss="modal">
			<i class="fi fi-close"></i> 취소
		</a>
	</div>

</form>