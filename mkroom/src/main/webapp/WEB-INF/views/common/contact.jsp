<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<%@ include file="../header.jsp" %>

<!-- 상단 -->    
<div class="hero-wrap hero-wrap-2" style="background-image: url('${contextPath}/resources/skillhunt-master/images/header-back.jpg');" data-stellar-background-ratio="0.8">
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text align-items-end justify-content-start">
      <div class="col-md-12 ftco-animate text-center mb-5">
        <h2 class="mb-3 bread">사업문의 / 오시는길</h2>
      </div>
    </div>
  </div>
</div>
<!-- 상단 끝-->
<style>
	tr{
		border-bottom:1px solid #3c0000; 
		height: 70px;
	}
	.table1{
		display: flex;
		justify-content: center;
		align-items: center;
	}
</style>
<section class="ftco-section">
	<div class="board0">
		<div style="text-align:center; justify-content: center; margin-top: 30px; margin-bottom: 50px; background-image: url('${contextPath}/resources/skillhunt-master/images/galaxy.png');" data-stellar-background-ratio="0.1">
			<br><br><br>
			<h3 style="color: #fff; background-color: #101010; padding-top: 20px; padding-bottom: 20px;">사업문의</h3><br>
			<form class="contact-form">
				<div class="form-group" style="display: block;">
					<input type="text" class="form-control" placeholder="성함" id="yourName" name="yourName" maxlength="4" style="width:150px; text-align:center; display:inline-block; margin: 0 auto;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" class="form-control" placeholder="Email" id="yourEmail" name="yourEmail" style="width:250px; text-align:center; display:inline-block; margin: 0 auto;">
				</div>
				<div class="form-group" style="display: block;">
				  <input type="text" class="form-control" placeholder="제목" id="yourSubject" name="yourSubject" style="width:80%; display:block; margin: 0 auto;">
				</div>
				<div class="form-group" style="display: block;">
				  <textarea cols="30" rows="7" class="form-control" placeholder="문의 내용" id="yourMessage" name="yourMessage" style="width:80%; display:block; margin: 0 auto;"></textarea>
				</div><br>
				<div class="form-group" style="display: block;">
				  <button type="button" class="btn btn-primary py-3 px-5" id="btnSendEmail">제출</button><br><br><br>
				</div>
			</form>
		</div>
		<div class="panel" style="padding-top:50px; padding-left:30px; padding-right:30px;">
			<div class="container">
				<div style="text-align: center;">
					<h3>오시는길</h3><br>
				</div>
				<div class="row">
					<div class="col-md-6 table1" style="padding-right: 20px;">
						<table class="table" style="width: 500px; height: 210px;">
							<tbody>
							  <tr>
							    <td>영업시간</td>
							    <td>
							    	평일 10:00~17:00<br>
							    	주말 휴무
							    </td>
						      </tr>
							  <tr>
							    <td>전화번호</td>
							    <td>02-837-9922</td>
							  </tr>
							  <tr>
							    <td>주소</td>
							    <td>서울 구로구 시흥대로163길 33, 주호타워 2층,3층</td>
							  </tr> 
							</tbody>
						</table>
					</div>
					<div class="col-md-6" style="padding-left: 20px;">
						<img style="width: 100%;" alt="${contextPath}/resources/skillhunt-master/images/alt.png" src="${contextPath}/resources/skillhunt-master/images/map.png">
				    </div>
			    </div>
			</div>
		</div>
	</div>
</section>

<script src="https://smtpjs.com/v3/smtp.js"></script>
<script>
  function sendEmail() {
    $.ajax({
      url: "${pageContext.request.contextPath}/sendEmail",
      method : "POST",
      data: JSON.stringify({
        name: $("#yourName").val(),
        email: $("#yourEmail").val(),
        subject: $("#yourSubject").val(),
        message: $("#yourMessage").val()
      }),
      contentType: "application/json",
      beforeSend : function(xhr){
        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
      },
      success: function(result) {
        alert(result);
        window.location.href = window.location.href;
        
      },
      error : function(xhr, status) {
        alert(xhr.responseText);
      }
    });
  }
  $(document).ready(function() {

   $("#btnSendEmail").click(function() {
        sendEmail();
    });
  });
</script>
<%@ include file="../footer.jsp" %>