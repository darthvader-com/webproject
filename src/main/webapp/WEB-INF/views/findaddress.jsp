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
		<form action=/findaddress.do method="POST">
			<div class="form-group">
				<label for="adress">동입력</label>
				<input type="text" class="form-control" name="address" minlength= "2" maxlength="10" required="required">
				<small id="exampleInput" class="form-text text-muted">ex) 고척동<br>참고) 날씨용 주소임. 없는 주소도도 있음</small>
			</div>
			<button type="submit" class="btn btn-primary">검색</button>
		</form>
		<hr>
		<span style="font-weight: 600; color: blue;">${resultAddress}</span> <span style="font-weight: 600;">[${size}건]</span>의 검색결과입니다
		<hr>

		<table class="table table-sm">
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">시</th>
		      <th scope="col">구</th>
		      <th scope="col">동</th>
		      <th scope="col">X축</th>
		      <th scope="col">Y축</th>
		    </tr>
		  </thead>
		  <tbody>
			<c:forEach var="item" items="${list}" begin="0">
				<tr>
					<td>${item.NO}</td>
					<td>${item.CITY}</td>
					<td>${item.COUNTY}</td>
					<td>${item.DISTRICT}</td>
					<td>${item.XAXIS}</td>
					<td>${item.YAXIS}</td>
				</tr>
			</c:forEach>
		  </tbody>
		</table>
	</div>
</body>

<script type="text/javascript">

</script>
<jsp:include page="/resources/common/prevent.jsp"></jsp:include>
</html>


