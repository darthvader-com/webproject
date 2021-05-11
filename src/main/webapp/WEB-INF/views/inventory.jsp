<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<title>회원가입</title>

</head>
<body>
	<div class="container" style="margin-top: 50px;">
		<h3>보관함</h3>
		<div class="card" style="width: 300px; margin-bottom: 300px;">
			<img class="card-img-top" width="200" height="200" src="/resources/image/sword2.jpg" alt="Card image">
			<div class="card-body">
				<h4 class="card-title">파멸적 칼(+1)</h4>
				<p class="card-text">
				<hr>
				부엌에서 쓰는 칼.<br>
				말안들으면 쑤셔버림. (※사망주의)
				</p>
				<p class="card-text">공격력 10</p>
				<div class="alert alert-danger" role="alert">
					<!-- <a href="#" class="alert-link">an example link</a>  -->
					강화실패시 없애버림<br>
					DELETE FROM TINVENTORY A WHERE A.USER_ID = "apple" AND A.ITEM_NAME = "sword1";
				</div>
				<button type="button" class="btn btn-secondary" onclick="back();" style="margin-bottom: 5px">강화하기[성공확률 0%]</button> 
				<button type="button" class="btn btn-secondary" onclick="back();">없애기[성공확률 100%]</button>
			</div>
		</div>
		<hr>
	</div>
</body>

<script type="text/javascript">
	function back() {
		window.history.back();
	}
</script>

</html>