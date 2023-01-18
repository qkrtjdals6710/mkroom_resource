<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    
<p>
    merchant_uid(DB에서 전달받아야하는 고유한 주문번호): <input type="text" name="merchant_uid" id="merchant_uid">
</p>
<p>
    name: <input type="text" name="name" id="name">
</p>
<p>
    amount: <input type="text" name="amount" id="amount">
</p>

<!-- 구매자 데이터 -->
<p>
    buyer_id: <input type="text" name="buyer_id" id="buyer_id" value='<c:out value="${member.userId}" />' readonly>
</p>
<p>
    buyer_name: <input type="text" name="buyer_name" id="buyer_name" value='<c:out value="${member.userName}" />'>
</p>
<p>
    buyer_tel: <input type="text" name="buyer_tel" id="buyer_tel" value='<c:out value="${member.phoneNumber}" />'>
</p>
<p>
    buyer_email: <input type="text" name="buyer_email" id="buyer_email" value='<c:out value="${member.email}" />'>
</p>
<p>
    buyer_addr: <input type="text" name="buyer_addr" id="buyer_addr">
</p>
<p>
    buyer_postcode: <input type="text" name="buyer_postcode" id="buyer_postcode">
</p>


<button type="button" onclick="requestPay()">requestPay</button>

<hr>

</body>


<!--  references: https://chai-iamport.gitbook.io/iamport/auth/guide/1. -->
<!-- 1. 아임포트 라이브러리 추가하기 -->
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>

// 2. 결제준비하기
// 가맹점 식별코드
const IMP = window.IMP;
IMP.init("imp72426407") // 관리자콘솔에서 확인가능

// 3. 결제요청하기
function requestPay() {
    IMP.request_pay({ // object
        // 관리자콘솔
        // https://admin.iamport.kr/integration
        // 아이디: mkroom@mkroom.com
        // 비밀번호: QWERqwer123

        // api-setting 
        // PG사 코드표 참조 
        // https://chai-iamport.gitbook.io/iamport/tip/pg-2  
        // 결제채널 이름: kakaopay 가맹점코드(CID): TC0ONETIME
        pg: "kakaopay.TC0ONETIME",  // 관리자 콘솔에서 확인가능
        pay_method: "card",
        // 제품
        merchant_uid: $("#merchant_uid").val(), // 주문번호 "ORD20180131-0000011"
        name: $("#name").val(), // 제품명 사과
        amount: $("#amount").val(), // 금액 1000 (1000원)
        // 구매자 데이터
        buyer_name: $("#buyer_name").val(),
        buyer_tel: $("#buyer_tel").val(),
        buyer_email: $("#buyer_email").val(),
        buyer_addr: $("#buyer_addr").val(),
        buyer_postcode: $("#buyer_postcode").val()
    }, function(rsp) { // callback
    	
        if (rsp.success) {
            // 결제 성공시
            // 요청이 성공했을 경우
            // 결제번호(imp_uid)와 금액을 서버에 전달하여 클라이언트단에서 위조를 검증합니다
         	debugger;
            $.ajax({
	        	url: "${pageContext.request.contextPath}/payment/verify/" + rsp.imp_uid + "/" + rsp.paid_amount,
                method: "GET",
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
              	},
              	success: function(payment) {
                    console.log(payment.querySelector("impUid").textContent);
                    console.log(payment.querySelector("merchantUid").textContent);
                    console.log(payment.querySelector("name").textContent);
                    console.log(payment.querySelector("amount").textContent);
                    console.log(new Date(parseInt(payment.querySelector("paidAt").textContent)));
                    console.log(payment.querySelector("buyerName").textContent);
                    console.log(payment.querySelector("buyerTel").textContent);
                    console.log(payment.querySelector("buyerEmail").textContent);
                    console.log(payment.querySelector("buyerAddr").textContent);
                    console.log(payment.querySelector("buyerPostcode").textContent);
                    
                    alert("결제가 성공되었습니다")
                    debugger;
                },

                error: function(xhr, staus) {
                	alert("검증되지 않은 결제입니다")
                	debugger;
                }
	        });
            
            
            
        } else {
            // 결제 실패로직
        	alert("결제가 실패했습니다");
        }

    })
}


</script>

</html>