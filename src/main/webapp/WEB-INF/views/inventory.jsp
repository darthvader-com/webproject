<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<title>보관함</title>

</head>
<body>
	<div class="container" style="margin-top: 50px;">
		<div class="jumbotron">
			<h3>보관함</h3>
		</div>
		<div class="card" style="width: 300px; margin-bottom: 300px;">
			<img class="card-img-top" width="200" height="200" src="/resources/image/${itemList[0].ITEM_IMAGE1}" alt="Card image">
			<div class="card-body">
				<h4 class="card-title">${itemList[0].ITEM_NAME}(+${itemList[0].ITEM_LEVEL})</h4>
				<p class="card-text">
				<hr>
				${itemList[0].ITEM_INFO}
				<p class="card-text">
					공격력 ${itemList[0].ITEM_DMG}
					<br>
					방어력 ${itemList[0].ITEM_DEF}
				</p>
				<!-- <div class="alert alert-danger" role="alert">
					 <a href="#" class="alert-link">an example link</a>  -->
				<!--강화실패시 없애버림<br> -->
			</div>
			<button type="button" class="btn btn-secondary" onclick="enchant();" style="margin-bottom: 5px">강화하기[성공확률 50%]</button>
			<input type="hidden" id="userNo" value="${itemList[0].USER_NO}">
			<input type="hidden" id="itemKey" value="${itemList[0].ITEM_KEY}">
			<button type="button" class="btn btn-secondary" onclick="back();">뒤로가기</button>
		</div>
	</div>
	<hr>
</body>

<script type="text/javascript">
	function back() {
		window.history.back();
	}

	function enchant() {
		var userNo = $('#userNo').val(), itemKey = $('#itemKey').val();
		$.ajax({
			url : "/enchant.do",
			method : "POST",
			data : {
				userNo : userNo,
				itemKey : itemKey
			},
			success : function(data) {
				if(data == "success"){
					alert('강화성공');
					window.location.reload();
				} else {
					alert('강화실패');
					window.location.reload();
				}
			},
			error : function(error) {
				alert("에러<br>관리자에게 문의바랍니다.");
			}
		});
	}
</script>

</html>