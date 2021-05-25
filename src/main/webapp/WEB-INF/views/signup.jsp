<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<jsp:include page="/resources/common/header.jsp"></jsp:include>
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