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
<title>list</title>

</head>
<body>
	<div class="container" style="margin-top: 50px;">
		<h2>지역별 코로나 확진자</h2>
		<p>5월 19일 확진자수</p>
		<table class="table table-striped">
			<tr>
				<th>도시</th>
				<th>오늘 확진자수</th>
				<th>총 확진자수</th>
				<th>완치자수</th>
				<th>사망자</th>
			</tr>
			<c:forEach var="item" items="${list}">
				<tr>
					<td>${item.city}</td>
					<td>${item.incDec}명</td>
					<td>${item.defCnt}명</td>
					<td>${item.isolClearCnt}명</td>
					<td>${item.deathCnt}명</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>

<script type="text/javascript">
	
</script>

</html>