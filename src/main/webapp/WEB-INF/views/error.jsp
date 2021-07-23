<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<jsp:include page="/resources/common/header.jsp"></jsp:include>
<title>index</title>
</head>
<body>
	<div class="container" style="padding-top: 50px;">
		<h1>에러 페이지</h1>
		<hr>
		<p class="lead">관리자에게 문의바랍니다</p>
		<button type="button" class="btn btn-secondary" onclick="back();">뒤로가기</button>
	</div>
</body>
<script type="text/javascript">
	function back() {
		window.history.back();
	}
</script>
<jsp:include page="/resources/common/prevent.jsp"></jsp:include>
</html>

