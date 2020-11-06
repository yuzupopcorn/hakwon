<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="/WEB-INF/views/include/HEADER.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fullpage.css">


<style>
header {
	width: 100%;
	height: 110px;
	color: #fff;
	position: fixed;
	top: 0;
	left: 0;
	z-index: 9999;
	line-height: 110px;
	padding: 0 50px;
}

.logo {
	width: 15%;
}

.login {
	width: 15%;
	text-align: right;
}

.bg {
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	width: 100%;
	height: 100vh;
}

.firstPage-content {
	text-align: center;
	width: 800px;
	margin: 0 auto;
}

.firstPage-content h3 {
	font-size: 24px;
	margin-bottom: 200px;
	animation: rundown 1s 0.5s forwards;
	opacity: 0;
}

.firstPage-content h2 {
	font-size: 60px;
	opacity: 0;
	animation: runup 1s 0.5s forwards;
	margin-top: 50px;
}

@keyframes runup { 100% {
	opacity: 1;
	margin: 0;
}

}
@keyframes rundown { 100% {
	opacity: 1;
	margin-bottom: 20px;
}
}
</style>

<body>
	<header>
		<div class="nav">
			<div class="flex flex-justify">
				<div class="logo">
					<h1 class="roboto" style="font-size: 30px;">
						<a href="${pageContext.request.contextPath}">${comMainLogo}</a>
					</h1>
				</div>
				<div class="navbar">
				<ul id="menu" class="flex flex-justify">
				<c:forTokens items="${comMenu}" delims=";" var="menu" varStatus="status">
					<li class="noto weight700 m-lr20 font20" style="margin: 0 30px;" data-menuanchor="${status.index+1}stPage"><a href="#${status.index+1}Page">${menu}</a></li>
				</c:forTokens>
				</ul>
				<!-- 
					<ul id="menu" class="flex flex-justify">
						<li class="noto weight700 m-lr20 font20" style="margin: 0 30px;"
							data-menuanchor="1stPage"><a href="#1stPage">회사소개</a></li>
						<li class="noto weight700 m-lr20 font20" style="margin: 0 30px;"
							data-menuanchor="2ndPage"><a href="#2ndPage">고객센터</a></li>
						<li class="noto weight700 m-lr20 font20" style="margin: 0 30px;"
							data-menuanchor="3rdPage"><a href="#3rdPage">포트폴리오</a></li>
						<li class="noto weight700 m-lr20 font20" style="margin: 0 30px;"
							data-menuanchor="4thPage"><a href="#4thPage">서비스</a></li>
						<li class="noto weight700 m-lr20 font20" style="margin: 0 30px;"
							data-menuanchor="5thPage"><a href="#5thPage">제품소개</a></li>
					</ul>
					 -->
				</div>
				<div class="login noto font16">
				<c:if test="${sessionScope.empName == null}">
					<a href="${pageContext.request.contextPath}/grp_login">로그인</a>
				</c:if>
				<c:if test="${sessionScope.empName != null}">
					${sessionScope.empName}
					<a href="${pageContext.request.contextPath}/grp_logout">로그아웃</a>
				</c:if> 
				</div>
			</div>
		</div>

	</header>
	<div id="fullpage">
		<div class="section bg"
			style="background-image: url(${pageContext.request.contextPath}/images/main/img1.jpg); background-color: rgba(0, 0, 0, 0.2); background-blend-mode: soft-light;">
			<div class="firstPage-content">
				<h3 class="noto f6">${comMainUp}</h3>
				<h2 class="roboto f6">${comMainDown}</h2>
			</div>
		</div>
		<div class="section bg"
			style="background-image: url(${pageContext.request.contextPath}/images/main/img2.jpg);">
			<h1>2</h1>
		</div>
		<div class="section bg"
			style="background-image: url(${pageContext.request.contextPath}/images/main/img3.jpg);">
			<h1>3</h1>
		</div>
		<div class="section bg"
			style="background-image: url(${pageContext.request.contextPath}/images/main/img4.jpg);">
			<h1>4</h1>
		</div>
		<div class="section bg"
			style="background-image: url(${pageContext.request.contextPath}/images/main/img5.jpg);">
			<h1>5</h1>
		</div>
	</div>
</body>
<script src="${pageContext.request.contextPath}/js/fullpage.js"></script>
<script>
	$(function() {
		$("#fullpage").fullpage(
				{
					navigation : true,
					easingcss3 : 'cubic-bezier(0.175, 0.585, 0.820, 1.275)',
					menu : '#menu',
					anchors : [ '1Page', '2Page', '3Page', '4Page', '5Page' ],
					scrollingSpeed : 500
				});
	});
</script>

</html>