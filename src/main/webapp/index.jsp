<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<jsp:include page="/resources/common/header.jsp"></jsp:include>
<title>Superfantastic</title>
</head>
<body>
	<div class="container">
		<div class="row h-100">
			<div class="col-sm-12 my-auto">
				<div class="card card-block w-25 mx-auto" style="margin-bottom: 20px; border-top: 0px; border-bottom-width: 0px; border-right-width: 0px; border-left-width: 0px;">
					<button class="btn btn-default" onclick="mindex();" style="margin-bottom: 10px;">Moblie</button>
					<button class="btn btn-default" onclick="pindex();">PC</button>
				</div>
			</div>
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
</script>

<style>
html, body {
	height: 100%;
}

.container {
	height: 100%;
}
</style>

</html>

