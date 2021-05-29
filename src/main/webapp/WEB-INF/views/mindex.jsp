<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/common/mobileheader.jsp"></jsp:include>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/charts.css/dist/charts.min.css">
</head>

<body>
	<ons-page>
		<ons-toolbar>
		    <div class="left">
    			<ons-toolbar-button id="back">&lt;</ons-toolbar-button>
   		    </div>
			<div class="center">표</div>
		    <div class="right">
    			<ons-toolbar-button onclick="redoClick();"><ons-icon icon="fa-redo"></ons-icon></ons-toolbar-button>
   		    </div>
		</ons-toolbar>
		<ons-tabbar swipeable position="auto">
			<ons-tab page="tab1.html" label="표" icon="fa-table" active></ons-tab>
		    <ons-tab page="tab2.html" label="그래프" icon="fa-chart-bar"></ons-tab>
		</ons-tabbar>
	</ons-page>

	<template id="tab1.html">
		<ons-page id="Tab1">
			<p style="text-align: center;">
				<div style="text-align: center; margin-bottom: 10px;">기준일시 ${list[0].STD_DAY}</div>
				<table class="table table-sm">
					<tr>
						<th>지역</th>
						<th>신규</th>
						<th>누적</th>
						<th>격리</th>
						<th>격리해제</th>
						<th>총사망자</th>
					</tr>
					<c:forEach var="item" items="${list}" begin="1">
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
			</p>
		</ons-page>
	</template>

	<template id="tab2.html">
		<ons-page id="Tab2">
			<p style="text-align: center;">
			 	<div style="text-align: center; margin-bottom: 10px;">기준일시 ${list[0].STD_DAY}</div>
				<table class="charts-css show-data-on-hover bar show-labels show-data-axes" style="height: 100%; width: 95%; margin-left: 0px;">
					<c:forEach var="item" items="${list}" begin="1">
						<tr>
						 	<th scope="row">${item.CITY}</th>
							<td style="--size: calc( ${item.INC_DEC} / ${list[1].INC_DEC})"><span class="data">${item.INC_DEC}</span></td>
						</tr>
					</c:forEach>
				</table>
			</p>
		</ons-page>
	</template>

	<template id="alert_redo.html">
	  <ons-alert-dialog id="alert_redo" modifier="rowfooter">
	    <div class="alert-dialog-title">안내</div>
	    <div class="alert-dialog-content">
	      오늘 날짜 데이터로 새로고침하시겠습니까?
	    </div>
	    <div class="alert-dialog-footer">
	      <ons-alert-dialog-button onclick="redoCorona();">새로고침</ons-alert-dialog-button>
	      <ons-alert-dialog-button onclick="redoClose();">취소</ons-alert-dialog-button>
	    </div>
	  </ons-alert-dialog>
	</template>
</body>

<script type="text/javascript">

	var redoClick = function() {
		var dialog = document.getElementById('alert_redo');

		if (dialog) {
		  dialog.show();
		} else {
		  ons.createElement('alert_redo.html', { append: true }).then(function(dialog) {
		      dialog.show();
		    });
		}
	};

	var redoClose = function() {
 		document.getElementById('alert_redo').hide();
	};

	var redoCorona = function() {
		window.location.href = "/coronaupdate.do";
	};

	$(function() {
		$('#back').on('click', function(e) {
			window.history.back();
		})
	});

	document.addEventListener('prechange', function(event) {
		document.querySelector('ons-toolbar .center').innerHTML = event.tabItem.getAttribute('label');
	});

</script>

</html>

