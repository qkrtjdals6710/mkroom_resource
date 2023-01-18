<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>booking Info</title>
</head>
<body>

<table class="questTest" style="width:100%;text-align:center;" > 
	<thead>
		<tr>
			<th colspan="6" style="text-align:center;">${username} 님의 예약 목록</th>
		</tr>
		<tr>
			<th style="text-align:center;">bookingNum</th>
			<th style="text-align:center;">todayDate</th>
			<th style="text-align:center;">branchLoation</th>
			<th style="text-align:center;">questName</th>
			<th style="text-align:center;">selectTime</th>
			<th style="text-align:center;">teamMember</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${bookingList}" var="bList">
			<tr class="moveBookingDetail" data-questname='<c:out value="${bList.questName}"/>' data-location='<c:out value="${bList.branchLocation}"/>' >
				<td><c:out value="${bList.bookingNum}"/></td>
				<td><c:out value="${bList.todayDate}"/></td>
				<td><c:out value="${bList.branchLoation}"/></td>
				<td><c:out value="${bList.questName}"/></td>
				<td><c:out value="${bList.selectTime}"/></td>
				<td><c:out value="${bList.teamMember}"/></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<!-- <form id="frm" action="">

</form> -->



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

	var frm = $("#frm");
	
	$(".moveBookingDetail").on("click", function(e){
		frm.append("<input type='hidden' name='questName' value='" + $(this).data("questname") + "'/>");
		frm.append("<input type='hidden' name='branchLocation' value='" + $(this).data("location") + "'/>");
		frm.attr("action", "${contextPath}/booking/detail");
		frm.attr("method", "post");
		frm.submit();
	});
	
	
	
</script>

</body>
</html>