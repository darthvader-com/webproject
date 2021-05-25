<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<jsp:include page="/resources/common/header.jsp"></jsp:include>
<title>index</title>
</head>
<body>
	<div class="container" style="padding-top: 50px;">
		<div class="jumbotron">
			<h1>로그인</h1>
		</div>
		<button type="button" class="btn btn-primary" onclick="corona();" style="margin-bottom: 15px;">코로나 API</button>
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
				<div class="card" style="width: 300px; margin-bottom: 150px;">
					<img class="card-img-top" src="/resources/image/profile.jpg" alt="Card image">
					<div class="card-body">
						<h4 class="card-title">${user[0].USERNAME}님안녕하세요</h4>
						<p class="card-text">이메일 ${user[0].EMAIL}</p>
						<p class="card-text">가입일 ${user[0].INSERTDATE}</p>
						<a href="#" class="btn btn-primary">프로필</a>
						<a href="<c:url value="/inventory.do"><c:param name="userNo" value="${user[0].USERNO}"></c:param></c:url>" class="btn btn-primary">보관함</a>
						<button type="button" class="btn btn-primary" onclick="logout();">로그아웃</button>
						<hr>
					</div>
				</div>
			</c:when>
		</c:choose>
	</div>
	<jsp:include page="/resources/common/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	function signup() {
		window.location.href = "/signup.do"
	}

	function logout() {
		window.location.href = "/logout.do"
	}

	function corona() {
		window.location.href = "/corona.do"
	}
</script>
</html>

