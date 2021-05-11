<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<title>index</title>
</head>
<body>
	<div class="container" style="padding-top: 50px;">
		<div class="jumbotron">
			<h1>로그인</h1> 
		</div> 
		<c:choose>
			<c:when test="${sessionScope.user == null }">
				<form action="/login.do" method="POST">
					<div class="form-group">
						<label for="id">아이디</label>
						<input type="text" class="form-control" name="id" placeholder="아이디" required="required">
					</div>
					<div class="form-group">
						<label for="pwd">비밀번호</label>
						<input type="password" class="form-control" name="pwd" placeholder="비밀번호" required="required">
					</div>
					<button type="submit" class="btn btn-primary">로그인</button>
					<button type="button" class="btn btn-primary" onclick="signup();">회원가입</button>
					<button type="button" class="btn btn-primary" onclick="passwordfind();">비밀번호 찾기</button>
				</form>
			</c:when>
			<c:when test="${sessionScope.user != null }">
				<hr>
				<div class="card" style="width:300px; margin-bottom: 150px;">
				  <img class="card-img-top" src="/resources/image/profile.jpg" alt="Card image">
				  <div class="card-body">
				    <h4 class="card-title">${user[0].USERNAME} 님 안녕하세요</h4>
				    <p class="card-text">이메일 ${user[0].EMAIL}</p>
				    <p class="card-text">가입일 ${user[0].INSERTDATE}</p>
				    <a href="#" class="btn btn-primary">프로필</a>
				    <a href="/inventory.do" class="btn btn-primary">보관함</a>
					<button type="button" class="btn btn-primary" onclick="logout();">로그아웃</button>
					</div>
				</div>
			</c:when>
		</c:choose>

	</div>
	<script type="text/javascript">
		function signup() {
			window.location.href = "/signup.do"
		}
		
		function logout() {
			window.location.href = "/logout.do"
		}
	</script>

</body>
</html>

