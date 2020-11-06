<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="page-info flex flex-justify">
	<div class="auth">
		<span class="noto font16">
			${sessionScope.empBuseoName} ${sessionScope.empGradeName} ${sessionScope.empName} (${sessionScope.empNum}) - 권한 : ${sessionScope.empAuth}		
		</span>
	</div>
	<div class="logout">
		<a href="${pageContext.request.contextPath}/grp_logout" class="noto font16 weight700">로그아웃</a>
	</div>
</div>