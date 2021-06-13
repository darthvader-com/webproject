<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<jsp:include page="/resources/common/headernores.jsp"></jsp:include>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/charts.css/dist/charts.min.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<title>코로나 API</title>

</head>
<body>
	<div class="container" style="margin-top: 50px;">
		<div class="d-flex justify-content-center">
			<h2>지역별 코로나 확진자</h2>
		</div>
		<div class="d-flex justify-content-center">
			<div class="form-inline">
				<div style="margin-bottom: 4px;">
					재난문자 조회 ex)106882
				</div>
				<input type="number" class="form-control" id="no" name="no" aria-describedby="no" maxlength="6"
					style="width: 140px; margin-right: 8px; margin-left: 8px;">
				<button type="button" class="btn btn-primary" onclick="coronadata();">조회</button>
			</div>
		</div>
		<hr>
		<div class="d-flex justify-content-center">
			<p>
				기준일시 ${list[0].STD_DAY}&nbsp;
				<!-- <button type="button" class="btn btn-outline-danger btn-sm" onclick="re();">새로고침</button> -->
				<button type="button" class="btn btn-outline-danger btn-sm" onclick="adminOnly();">새로고침</button>
			</p>
		</div>
		<div class="row" style="margin-bottom: 20px; margin-left: 30px;">
			<div class="col-xs-10">
				<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false"
					aria-controls="collapseExample">그래프보기</button>
				<div class="collapse" id="collapseExample">
					<div class="card card-body">
						<div id="piechart_3d"></div>
					</div>
				</div>
			</div>
		</div>
		<table class="table table-sm">
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
					<td>${item.INF_CNT}</td>
					<td>${item.DEF_CNT}</td>
					<td>${item.ISOL_ING_CNT}</td>
					<td>${item.ISOL_CLEAR_CNT}</td>
					<td>${item.DEATH_CNT}</td>
				</tr>
			</c:forEach>
		</table>
		<div class="row" style="margin-bottom: 100px;">
			<div class="col text-center">
				<button type="button" class="btn btn-secondary" onclick="back();">뒤로가기</button>
			</div>
		</div>
	</div>
	<jsp:include page="/resources/common/footer.jsp"></jsp:include>
</body>

<script type="text/javascript">
	function back() {
		window.history.back();
	}

	function re() {
		window.location.href = "/coronaupdate.do";
	}

	function coronadata() {
		var data = $('#no').val();
		window.location.href = "/coronadata.do?value=" + data;
	}

	<!-- CHART -->
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

      var data = google.visualization.arrayToDataTable([
        ['corona', 'per day'],
		<c:forEach var="item" items="${list}" begin="1">
        	['${item.CITY}', ${item.INF_CNT}],
		</c:forEach>
      ]);

      var options = {
        title: '코로나현황 (총 ${list[0].INF_CNT}명)',
        is3D: true,
        height: '600',
        width: '600',
        pieSliceText: 'none',
      };

      var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
      chart.draw(data, options);
    }

    function adminOnly() {
		alert('관리자만 이용가능합니다.');
	}

</script>

<style>
.container {
	width: 1200px;
	max-width: none !important;
}
</style>

</html>