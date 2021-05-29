<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<jsp:include page="/resources/common/mobileheader.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/chart.js@3.3.0/dist/chart.min.js"></script>
<title>코로나 API</title>
</head>
<body>
	<div data-role="page" id="pageone">
		<div data-role="header">
			<h1>지역별 코로나 확진자</h1>
		</div>
		<div data-role="main" class="ui-content">
			<!-- <h2>코로나</h2>   -->
			<canvas id="myChart" width="400" height="400"></canvas>
			<table class="table table-sm">
				<tr>
					<th>지역</th>
					<th>신규</th>
					<th>누적</th>
					<th>격리중</th>
					<th>격리해제</th>
					<th>총사망자</th>
				</tr>
				<c:forEach var="item" items="${list}">
					<tr>
						<td>${item.CITY}</td>
						<td>${item.INC_DEC}</td>
						<td>${item.DEF_CNT}</td>
						<td>${item.ISOL_ING_CNT}</td>
						<td>${item.ISOL_CLEAR_CNT}</td>
						<td>${item.DEATH_CNT}</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<button class="ui-btn" onclick="back();">뒤로가기</button>
		</div>

		<div data-role="footer">
			<h1>테스트</h1>
		</div>
	</div>
</body>

<script type="text/javascript">
	function back() {
		window.history.back();
	}

	var ctx = document.getElementById('myChart').getContext('2d');
	var myChart = new Chart(ctx, {
		type : 'bar',
		data : {
			labels : [<c:forEach var="item" items="${list}" begin="1">'${item.CITY}',</c:forEach>],
			datasets : [ {
				data : [<c:forEach var="item" items="${list}" begin="1">${item.INC_DEC},</c:forEach>],
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)' ],
				borderColor : [ 'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)' ],
				borderWidth : 2,
				offset : false
			} ]
		},
		options : {
			indexAxis: 'y',
			scales : {
				x : {
					beginAtZero : true
				}
			}
		}
	});
</script>
</html>

