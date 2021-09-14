<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<jsp:include page="/resources/common/header.jsp"></jsp:include>
<title>메인페이지</title>
</head>
<body>
	<div class="container">
		<div class="row h-100">
			<div class="col-sm-12 my-auto">
				<div class="card card-block w-70 mx-auto" style="margin-bottom: 0px; border-top: 0px; border-bottom-width: 0px; border-right-width: 0px; border-left-width: 0px;">
					<button class="btn btn-primary" onclick="mindex();" style="margin-bottom: 3px; margin-top: 8px;">Moblie</button>
					<button class="btn btn-primary" onclick="pindex();" style="margin-bottom: 3px; margin-top: 8px;">PC</button>
					<button class="btn btn-primary" onclick="mboard();" style="margin-bottom: 3px; margin-top: 8px;">게시판</button>
					<button class="btn btn-primary" onclick="maddress();" style="margin-bottom: 3px; margin-top: 8px;">주소테스트</button>
					<input class="form-control" type="text" id="input1" placeholder="테스트값입력">
					<button class="btn btn-primary" onclick="ajaxTest();" style="margin-bottom: 3px; margin-top: 8px;">AJAX테스트</button>
				</div>
			</div>
			<img style="margin-top: 10px; margin-bottom: 20px; width: 100%; height: 75%;"  src="/resources/image/darthvader.png" alt="darthvader image">
		</div>
	</div>
	<jsp:include page="/resources/common/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	function mindex() {
		window.location.href = "/mindex.do";
	}

	function pindex() {
		window.location.href = "/pindex.do";
	}

	function maddress() {
		window.location.href = "/maddress.do";
	}

	function mboard() {
		var pwd = prompt("비밀번호 입력");
		$.ajax({
			url : "/boardAjax.do",
			method : "POST",
			data : {
				pwd : pwd,
			},
			success : function(data) {
				if (data == "success") {
					window.location.href="/mboard.do"
				} else {
					alert("비밀번호를 확인하세요");
				}
			},
			error : function(error) {
				alert("에러<br>관리자에게 문의바랍니다.");
			}
		});
	}

 	function ajaxTest() {
 		var getVal = document.getElementById('input1').value;

 		if(getVal == null || getVal == ''){
 			alert('값을 입력하세요');
 		} else {
			var xhr = new XMLHttpRequest();
				xhr.open('POST', '/ajaxtest.do');
				xhr.setRequestHeader('Content-Type', 'application/json');
				var data = {val: getVal};
				xhr.send(JSON.stringify(data));

			xhr.onreadystatechange = function(){
		   		if (xhr.readyState === xhr.DONE) {
				    if (xhr.status === 200 || xhr.status === 201) {
				        alert('테스트성공(입력값: ' + xhr.responseText + ')');
				    } else {
				    	alert('테스트실패');
				    }
				}
			};
 		}
	}

</script>

<style>
html, body {
	height: 100%;
}

.container {
	height: 100%;
}
</style>
<%-- <jsp:include page="/resources/common/prevent.jsp"></jsp:include> --%>
</html>

