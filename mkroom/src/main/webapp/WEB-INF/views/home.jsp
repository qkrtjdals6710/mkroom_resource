<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<script src="https://code.jquery.com/jquery-3.6.2.min.js" ></script>
</head>
<body>
<h1>

<p>

	<a href="${pageContext.request.contextPath }/member/register">register 회원가입</a>

</p>

<p>
	<a href="${pageContext.request.contextPath }/login">login 로그인</a>
</p>

<!-- security-context.xml의 logout-process-url과 일치 -->
<security:authorize access="hasRole('MEMBER')">
	<p>Member입니다.</p>
	<form:form action="${pageContext.request.contextPath }/logout" method="POST">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		<button id="btnLogout" type="button">로그아웃</button>
		
			
		
	</form:form>
</security:authorize>
<security:authorize access="hasRole('MEMBER')">
	<security:authentication var="principal" property="principal" />
		
	<p>Member ${principal.username}입니다.</p>
	<a href="${pageContext.request.contextPath}/member/detail?userId=${principal.username}">detail 내정보</a>
</security:authorize>

<script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
<script>
$("#btnLogout").click(function() {
	if (!confirm("로그아웃 하시겠습니까?")) {
		return;
	}
	
	$(this).parent("form").submit();
})

</script>



</body>
</html>
