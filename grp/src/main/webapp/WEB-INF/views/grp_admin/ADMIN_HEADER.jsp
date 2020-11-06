<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.empNum == null}">
	<script>
		alert("등록된 사용자가 아닙니다. \n관리자에게 문의하세요.");
		location.href="${pageContext.request.contextPath}/grp_login";
	</script>
</c:if>

<c:if test="${sessionScope.empAuth < sessionScope.comAuth}">
	<script>
		alert("접근권한이 없습니다. \n관리자에게 문의하세요.");
		location.href="${pageContext.request.contextPath}";
	</script>
</c:if>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GREEN GROUPWARE SYSTEM</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.treeview.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
        integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.treeview.js"></script>
    <script src="${pageContext.request.contextPath}/js/treeview.js"></script>
    <script src="${pageContext.request.contextPath}/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/js/tab.js"></script>
</head>