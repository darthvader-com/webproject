<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<jsp:include page="/resources/common/header.jsp"></jsp:include>
<title>코로나 재난문자 데이터</title>

</head>
<body>
	<div class="container" style="margin-top: 50px;">
		<div class="d-flex justify-content-center">
			<h2>코로나 재난문자 데이터</h2>
		</div>
		<hr>
		발송시간 : ${list[0].time}
		<hr>
		내용 : ${list[0].content}
		<hr>
		<div class="d-flex justify-content-center" style="margin-top: 20px; margin-bottom: 30px;">
			<button type="button" class="btn btn-secondary" onclick="back();">뒤로가기</button>
		</div>
	</div>
</body>

<script type="text/javascript">
	function back() {
		window.history.back();
	}

</script>

</html>