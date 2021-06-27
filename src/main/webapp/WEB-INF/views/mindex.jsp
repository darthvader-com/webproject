<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/common/mobileheader.jsp"></jsp:include>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/charts.css/dist/charts.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<title>코로나19현황 Mobile</title>
</head>


<style>
.tooltip-m {
  position: relative;
  display: inline-block;
  border-bottom: 1px dotted black;
}

.tooltip-m .tooltiptext {
  visibility: hidden;
  width: 55px;
  background-color: rgba(0, 0, 0, 0.7);
  color: white;
  text-align: center;
  border-radius: 20px;
  padding: 5px 0;
  position: absolute;
  z-index: 1;
  top: 0%;
  left: 0%;
  margin-left: 0px;
}

.tooltip-m:hover .tooltiptext {
  visibility: visible;
}
</style>

<body>
	<ons-page>
		<ons-toolbar>
		    <div class="left">
    			<ons-toolbar-button onclick="back();">&lt;</ons-toolbar-button>
   		    </div>
			<div class="center">지역별 코로나19 현황(표)</div>
		    <div class="right">
    			<ons-toolbar-button onclick="notopenClick();"><ons-icon icon="fa-sign-in-alt"></ons-icon></ons-toolbar-button>
   		    </div>
		</ons-toolbar>
		<ons-tabbar swipeable position="auto">
			<ons-tab page="tab1.html" label="지역별 코로나19 현황(표)" icon="fa-table" active></ons-tab>
		    <ons-tab page="tab2.html" label="지역별 코로나19 현황(그래프)" icon="fa-chart-bar"></ons-tab>
		</ons-tabbar>
	</ons-page>

	<template id="tab1.html">
		<ons-page id="Tab1">
			<p style="text-align: center;">
				<div style="text-align: center; margin-bottom: 10px;">
   				    <span class="input-group-text" id="caldiv" style="margin-bottom: 10px;">
				    	기준일시<input type="text" class="form-control" value="${now}" style="margin-left: 22px; margin-right: 22px;" readonly="readonly" data-input/>
				    	<a class="input-button"  title="toggle" data-toggle><i class="fa fa-calendar" id="cal"></i></a>
				    </span>
					<b>[총 ${list[0].INF_CNT}명]</b>
					<%--<ons-toolbar-button onclick="redoClick();"><ons-icon icon="fa-redo"></ons-icon></ons-toolbar-button>--%>
				</div>
				<table class="table table-sm">
					<tr>
						<th>발생<br/>지역</th>
						<th>신규<br/>확진자</th>
						<th>누적<br/>확진자</th>
						<th>격리<br/>중</th>
						<th>격리<br/>해제</th>
						<th>총<br/>사망자</th>
					</tr>
					<c:forEach var="item" items="${list}" begin="0">
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
			</p>
		</ons-page>
	</template>

	<template id="tab2.html">
		<ons-page id="Tab2">
			<p style="text-align: center;">
			 	<div style="text-align: center; margin-bottom: 10px;">기준일시 ${list[0].STD_DAY}&nbsp;<ons-toolbar-button onclick="redoClick();"><ons-icon icon="fa-redo"></ons-icon></ons-toolbar-button></div>
				<table class="charts-css bar show-labels show-data-axes data-spacing-5 show-data-on-hover" style="height: 100%; width: 95%; margin-left: 0px;">
					<c:forEach var="item" items="${list}" begin="0">
						<tr>
						 	<th scope="row">${item.CITY}</th>
							<td class="tooltip-m" style="--size: calc( ${item.INF_CNT} / ${list[0].INF_CNT} )"><!-- <span class="data">${item.INF_CNT} </span> --> <span class="tooltiptext" style="">${item.INF_CNT}명</span></td>
						</tr>
					</c:forEach>
				</table>
			</p>
		</ons-page>
	</template>

	<%--
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
	 --%>
	 <template id="alert_redo.html">
	  <ons-alert-dialog id="alert_redo" modifier="rowfooter">
	    <div class="alert-dialog-title">안내</div>
	    <div class="alert-dialog-content">
	      관리자만 이용가능합니다.
	    </div>
	    <div class="alert-dialog-footer">
	      <ons-alert-dialog-button onclick="redoClose();">확인</ons-alert-dialog-button>
	    </div>
	  </ons-alert-dialog>
	</template>

	 <template id="alert_notopen.html">
	  <ons-alert-dialog id="alert_notopen" modifier="rowfooter">
	    <div class="alert-dialog-title">안내</div>
	    <div class="alert-dialog-content">
	      서비스 준비중입니다.
	    </div>
	    <div class="alert-dialog-footer">
	      <ons-alert-dialog-button onclick="notopenClose();">확인</ons-alert-dialog-button>
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

	var notopenClick = function() {
		var dialog = document.getElementById('alert_notopen');

		if (dialog) {
		  dialog.show();
		} else {
		  ons.createElement('alert_notopen.html', { append: true }).then(function(dialog) {
		      dialog.show();
		    });
		}
	};

	var redoClose = function() {
			document.getElementById('alert_redo').hide();
	};

	var notopenClose = function() {
			document.getElementById('alert_notopen').hide();
	};


	var redoCorona = function() {
		window.location.href = "/coronaupdate.do";
	};

	var back = function() {
		window.location.href = "/";
	}

	document.addEventListener('prechange', function(event) {
		document.querySelector('ons-toolbar .center').innerHTML = event.tabItem.getAttribute('label');
	});

	// 달력
	$(function(){
		flatpickr.localize(flatpickr.l10ns.ko);

		flatpickr($("#caldiv"), {
			wrap: true,
		    local: 'ko',
		    dateFormat: "Y년 m월 d일",
		    disableMobile: "true",
		    onChange: function(selectedDates, dateStr, instance) {
		    	var date = dateStr.substr(0, 4) + dateStr.substr(5, 3) + dateStr.substr(9, 3);
		    	date = date.replace(/ /g,"");
		    	window.location.href = "/getcorona.do?date=" + date;
		    },
		    onOpen: [
		        function(selectedDates, dateStr, instance){}
		    ],
		    onClose: function(selectedDates, dateStr, instance){}
		});
	});

</script>

</html>


