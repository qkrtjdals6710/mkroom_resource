<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	private String userId;
	private String userPw;
	private String userName;
	private String phoneNumber;
	private String email;
	private Timestamp regDate;
	private Timestamp modDate;
	private long discountCoupon;
	private long questPoint;
	private String dropFlg;
	private String enabled;
	 -->
<c:forEach var="member" items="${memberList}">
	<p>
		<c:out value="${member.userId }" />
	</p>
	<p>
		<c:out value="${member.userPw }" />
	</p>
	<p>
		<c:out value="${member.userName }" />
	</p>
	<p>
		<c:out value="${member.phoneNumber }" />
	</p>
	<p>
		<c:out value="${member.email }" />
	</p>
	<p>
		<c:out value="${member.regDate }" />
	</p>
	<p>
		<c:out value="${member.modDate }" />
	</p>
	<p>
		<c:out value="${member.discountCoupon }" />
	</p>
	<p>
		<c:out value="${member.questPoint }" />
	</p>
	<p>
		<c:out value="${member.dropFlg }" />
	</p>
	<p>
		<c:out value="${member.enabled }" />
	</p>

</c:forEach>



</body>
</html>