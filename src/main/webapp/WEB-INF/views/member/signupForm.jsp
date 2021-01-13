<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="/WEB-INF/views/common/daumZip.jsp" />
<script>

	function fn_overlapped() { //id 중복체크
		var _id = $("#_member_id").val();
		if (_id == '') {
			alert("ID를 입력하세요");
			return;
		}
		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/member/overlapped.do", //호출 후
			dataType : "text", 
			data : {id : _id}, 
			success : function(data, textStatus) { //result로 true,false전달
				if (data == 'false') {
					alert("사용할 수 있는 ID입니다.");
					$('#btnOverlapped').prop("disabled", true);
					$('#_member_id').prop("disabled", true);
					$('#member_id').val(_id);
				} else {
					alert("사용할 수 없는 ID입니다.");
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
	
	function chkId(){//이메일 형식 체크하기	
		var email = document.getElementById("email").value;
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
				if(exptext.test(email)==false){
					//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
					alert("이 메일 형식이 올바르지 않습니다. \n 올바른 전자 메일 주소를 입력해주세요(알파벳+숫자@알파벳+숫자)");
					document.addjoin.email.focus();
					return false;
				}else{
					alert("사용이 가능합니다.");
				}
	}
	
	var compare_result = false;
	
	function fn_compare_pwd(){ //비밀번호 확인 체크폼
		var pwd1 = $("#password_check1").val();
		var pwd2 = $("#password_check2").val();
		var s_result = $('#s_result');
		/*<span style = "text-size:10px; color: blue;" id = "s_result" >동일한 비밀번호를 입력해주세요</span>  */
		if(pwd1 == pwd2){
			//alert(pwd1);
			//alert(pwd2);
			compare_result = true;
			 $('#s_result').text("✔  비밀번호가 일치합니다.");
			 $('#s_result').css('color','green')
		}else{
			compare_result = false;
			 $('#s_result').text("✖ 비밀번호가 일치하지 않습니다.");
			 $('#s_result').css('color','red')
		}
	}

	function fn_join_member(){ //가입하기 누른 후 비밀번호 불일치 시에 
		if(compare_result == true){
			//회원 가입 요청
			alert("회원 가입을 진행합니다.");
		}else{
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
	} 
</script>


	<div id="wrapper">
	
		<!-- PAGE TITLE -->
		<section class="bg-light p-0">
			<div class="container py-5">

				<h1 class="h3">회원가입</h1>

				<nav aria-label="breadcrumb">
					<ol class="breadcrumb fs--14">
						<li class="breadcrumb-item"><a href="${contextPath}/main/main.do">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Account</li>
					</ol>
				</nav>

			</div>
		</section>
		<!-- /PAGE TITLE -->



		<!-- FORM -->
		<section>
			<div class="container">


				<div class="row">

					<div
						class="col-12 col-sm-8 col-md-8 col-lg-6 offset-sm-2 offset-md-2 offset-lg-3">

						<!-- optional class: .form-control-pill -->
						<form class="bs-validate p-5 rounded shadow-xs" novalidate
							method="post" action="${contextPath}/member/addMember.do"
							data-error-toast-text="<i class='fi fi-circle-spin fi-spin float-start'></i> Please, complete all required fields!"
							data-error-toast-delay="3000"
							data-error-toast-position="top-right">


							<!--
								<p class="text-danger">
									Ups! Please check again
								</p>
								-->


							<div class="form-label-group mb-3">
								<input required placeholder="_member_id" id="_member_id"
									name="_member_id" type="text" label="아이디"
									class="form-control col-md-9"
									style="margin-bottom: 0; display: inline-block"> <label
									for="_member_id">아이디</label>
									<input type = "hidden" name = "member_id" id ="member_id" />
									 <a class="btn btn-primary" href="javascript:fn_overlapped()">중복확인</a>
							</div>


							<div class="input-group-over">
								<div class="form-label-group mb-3">
									<input required placeholder="Password" name ="password" 
											id="password_check1" type="password" class="form-control"> 
									<label for="password">비밀번호(영문 숫자 6~15자 이내)</label>
								</div>
								
								<div class="input-group-over">
									<div class="form-label-group mb-3">
										<input required placeholder="Password_check" name = "Password_check"
											id="password_check2" type="password" class="form-control" onKeyUp = "fn_compare_pwd()">
										<label for="Password_check">비밀번호 확인</label>
										
										<span style = "text-size:10px; color: rgba(0, 0, 255, 0.411);" id = "s_result" >동일한 비밀번호를 입력해주세요</span>
									</p>
									</div>
									
									
									
									<div class="form-label-group mb-3">
										<input required placeholder="Member Name" id="member_name"
											name="member_name" type="text" class="form-control">
										<label for="member_name">이름</label>
									</div>

									<div class="form-label-group mb-3">
										<input required placeholder="Email" id="email" name="email"
											type="text" label="아이디" class="form-control col-md-9"
											style="margin-bottom: 0; display: inline-block"> <label
											for="email">이메일</label> 
											<a class="btn btn-primary"
											href="javascript:chkId()">중복확인</a>
									</div>

									<div class="form-label-group mb-3">
										<input required placeholder="Phone" id="phone" name="phone"
											type="tel" class="form-control"> <label for="phone">휴대폰
											번호</label>
									</div>

									<div class="form-label-group mb-3">
										<input required placeholder="Address" id="zipNo"
											name="zipNo" type="number" class="form-control"> <label
											for="zipNo">우편번호</label>
										<a href="javascript:execDaumPostcode()">우편번호검색</a>
									</div>

									<div class="form-label-group mb-3">
										<input required placeholder="Address" id="load_address"
											name="load_address" type="text" class="form-control"> <label
											for="load_address">도로명 주소</label>

									</div>

								</div>
								<div class="form-label-group mb-3">
									<input required placeholder="Address" id="jibun_address"
										name="jibun_address" type="text" class="form-control"> <label
										for="jibun_address">지번 주소</label>

								</div>

								<div class="form-label-group mb-3">
									<input required placeholder="Address" id="rest_address"
										name="rest_address" type="text" class="form-control"> <label
										for="rest_address">나머지 주소</label>

								</div>
								<div class="form-label-group mb-3">
									<input required placeholder="Birthday" id="birthday"
										name="birthday" type="date" class="form-control"> <label
										for="birthday">생년월일</label>
								</div>

							</div>


							<!-- GDPR CONSENT -->
							<div class="clearfix bg-light position-relative rounded p-4 mb-4">


								<label class="form-checkbox form-checkbox-primary"> <input
									required type="checkbox" name="checkbox"> <i></i> <span>
										본인은 만 14세 이상이며, <a href="page-terms-and-conditions.html"
										target="_blank">이용약관</a> 내용을 확인하였으며 이에 동의합니다.
								</span>
								</label>

							</div>
							<!-- /GDPR CONSENT -->

							<div class="row">

								<div class="col-12">
									<button type="submit" class="btn btn-primary btn-block" onClick = "fn_join_member()">
										가입하기</button>

								</div>
							</div>

						</form>

					</div>

				</div>


			</div>
		</section>
		<!-- /FORM -->


