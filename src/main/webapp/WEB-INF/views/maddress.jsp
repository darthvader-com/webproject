<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/common/mobileheader.jsp"></jsp:include>
<title>주소(테스트)</title>
</head>


<body>
	<div class="ui container" style="margin-top: 35px;">
		<h4>날씨용 주소(테스트)</h4>
		<hr>
		<form action="/findaddress.do" method="POST">
			<div class="form-group">
				<label for="adress">동입력</label>
				<input type="text" class="form-control" name="address" minlength= "2" maxlength="10" required="required">
				<small id="exampleInput" class="form-text text-muted">ex) 고척동<br>참고) 날씨용 주소임. 없는 주소도도 있음</small>
			</div>
			<button type="submit" class="btn btn-primary">검색</button>
		</form>
	</div>
</body>

<script type="text/javascript">

</script>
<jsp:include page="/resources/common/prevent.jsp"></jsp:include>
</html>


