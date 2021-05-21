<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<title>코로나 API</title>

</head>
<body>
	<div class="container" style="margin-top: 50px;">
		<div class="d-flex justify-content-center">
			<h2>지역별 코로나 확진자</h2>
		</div>
		<div class="d-flex justify-content-center">
			<p>${year}년 ${month}월 ${date}일</p>
		</div>
		<table class="table table-striped">
			<tr>
				<th>지역</th>
				<th>신규확진자</th>
				<th>누적확진자</th>
				<th>완치자</th>
				<th>사망자</th>
			</tr>
			<c:forEach var="item" items="${list}">
				<tr>
					<td>${item.city}</td>
					<td>${item.incDec}</td>
					<td>${item.defCnt}</td>
					<td>${item.isolClearCnt}</td>
					<td>${item.deathCnt}</td>
				</tr>
			</c:forEach>
		</table>
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