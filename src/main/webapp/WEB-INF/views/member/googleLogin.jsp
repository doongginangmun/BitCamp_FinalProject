<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<script>
var googleUser = {};

	var startApp = function() {
		gapi.load('auth2',	function() {
							// Retrieve the singleton for the GoogleAuth library and set up the client.
							auth2 = gapi.auth2
									.init({
										client_id : '1090287714877-qd2ikq55m2grble3eltcrr4h9s1dpu6b.apps.googleusercontent.com',
										cookiepolicy : 'single_host_origin',
									// Request scopes in addition to 'profile' and 'email'
									//scope: 'additional_scope'
									});
							attachSignin(document.getElementById('customBtn'));
						});
	}; 

	function attachSignin(element)  {
		auth2.attachClickHandler(element, {},
		        function(googleUser) {
		    		var id_token = googleUser.getAuthResponse().id_token;
		    		var xhr = new XMLHttpRequest();
		    		xhr.onload = function(){
		    			if(xhr.status ===200 || xhr.status ===201){
		    				var memberInfo = JSON.parse(xhr.responseText);
		    				console.log(memberInfo);		    				
		    				/*member_date 값이 null일 경우 회원가입창으로 null이 아닐 경우 로그인으로  */
		    				if(memberInfo.member_date!=null){		    					
		    					location.href= "${contextPath}/main/main.do";		    					
		    				} else {		    							    					
		    					location.href="${contextPath}/member/snsSignupForm.do";		    					
		    				}		    						    				
		    			} else {
		    				console.error(xhr.responseText);
		    			}
		    		}
		    		xhr.open('POST', '${contextPath}/snsMember/googleLogin.do');
		    		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		    		xhr.send('idtoken=' + id_token);
		    		
		        }, function(error) {
		          console.log(JSON.stringify(error, undefined, 2));
		        });
	}
	
	
	
</script>

<style type="text/css">
#customBtn {
	/* display: inline-block;
	background: white;
	color: #444;
	width: 190px;
	border-radius: 5px;
	border: thin solid #888;
	box-shadow: 1px 1px 1px grey;
	white-space: nowrap; */
	background-color: #DD4B39 !important;
	color: #fff;
}

#customBtn:hover {
	cursor: pointer;
}

span.label {
	font-family: serif;
	font-weight: normal;
}

span.icon {
	background: url('${contextPath}/resources/images/btn_google_light.png')
		transparent 5px 50% no-repeat;
	display: inline-block;
	vertical-align: middle;
	width: 42px;
	height: 42px;
}

span.buttonText {
	display: inline-block;
	vertical-align: middle;
	padding-left: 42px;
	padding-right: 42px;
	font-size: 14px;
	font-weight: bold;
	/* Use the Roboto font that is loaded in the <head> */
	font-family: 'Roboto', sans-serif;
}
</style>