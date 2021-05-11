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
		<h3>회원가입</h3>
		<hr>
		<form action="/signupgo.do" method="post">
			<div class="form-group">
				아이디
				<br>
				<input class="form-control" type="text" name="userId" maxlength="20" required="required"></input>
				비밀번호
				<input class="form-control" type="password" name="userPwd" maxlength="20" required="required"></input>
				비밀번호 확인
				<input class="form-control" type="password" name="userPwd" maxlength="20" required="required"></input>
				이름
				<input class="form-control" type="text" name="userName" maxlength="10" required="required"></input>
				이메일
				<input class="form-control" type="email" name="email" maxlength="25" required="required"></input>
				<br>
				<button class="btn btn-primary" type="button" onclick="back();">취소</button>
				<button class="btn btn-primary" type="submit">완료</button>
			</div>
		</form>
	</div>
</body>

<script type="text/javascript">
	function back() {
		window.history.back();
	}
</script>

</html>