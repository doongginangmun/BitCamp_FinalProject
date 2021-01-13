<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp09095257'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : "${orderVO.pg}",
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '쩝쩝박사:결제테스트',
            amount : "${orderVO.totalPrice}",
            buyer_email : "${orderVO.email}",
            buyer_name : "${orderVO.member_name}",
            buyer_tel : "${orderVO.phone}",
            buyer_addr : "${orderVO.address}",
            buyer_postcode : "${orderVO.zipNo}"
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "${contextPath}/orders/addOrder.do", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                    	order_num : rsp.imp_uid,
                        totalPrice : rsp.paid_amount,
                        apply_num : rsp.apply_num,
                        order_status : rsp.status,
                        pg: rsp.pg_provider,
                        paid_at : rsp.paid_at, 
                        member_name: rsp.buyer_name,
                        email: rsp.buyer_email,
                        phone : rsp.buyer_tel,
                        address: rsp.buyer_addr,
                        zipNo: rsp.buyer_postcode,
                        delivery_request: "${orderVO.delivery_request}"
                                                
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                location.href='${contextPath}/orders/paySuccess.do?order_num='+rsp.imp_uid;
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href='${contextPath}/orders/payFail.do';
                alert(msg);
            }
        });
        
    });
    </script>