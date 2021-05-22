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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<title>코로나 API</title>

</head>
<body>
	<div class="container" style="margin-top: 50px;">
		<div class="d-flex justify-content-center">
			<h2>지역별 코로나 확진자</h2>
		</div>
		<div class="d-flex justify-content-center">
			<p>기준일시 ${list[0].STD_DAY}</p>
		</div>
		<table class="table table-striped">
			<tr>
				<th>지역</th>
				<th>신규확진자</th>
				<th>누적확진자</th>
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
		<div align="center">
			<div id="piechart_3d" style="width: 900px; height: 500px;"></div>
		</div>
		<div class="d-flex justify-content-center" style="margin-top: 20px; margin-bottom: 30px;">
			<button type="button" class="btn btn-secondary" onclick="back();">뒤로가기</button>
		</div>
	</div>
</body>

<script type="text/javascript">
	function back() {
		window.history.back();
	}
	
	<!-- CHART -->
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

      var data = google.visualization.arrayToDataTable([
        ['corona', 'per day'],
		<c:forEach var="item" items="${list}" begin="1">
        	['${item.CITY}', ${item.INC_DEC}],
		</c:forEach>
      ]);

      var options = {
        title: '코로나현황 (총 ${list[0].INC_DEC}명)',
        is3D: true,
      };

      var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
      chart.draw(data, options);
    }
	
</script>

</html>