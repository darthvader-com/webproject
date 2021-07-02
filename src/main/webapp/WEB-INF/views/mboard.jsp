<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/common/mobileheaderboard.jsp"></jsp:include>
<title>게시판</title>
</head>

<body>
	<div class="container" style="margin-top: 10px;">
		<h5>게시글 작성</h5>
		<hr>
		<div class="form-group">
			<input type="text" class="form-control" placeholder="제목" id="title" name="title">
		</div>
		<div id="summernote"></div>
		<div align="center" style="margin-top: 10px;">
			<button class="btn btn-primary" onclick="save();">저장</button>
		</div>
	</div>
<jsp:include page="/resources/common/footer.jsp"></jsp:include>
</body>
<script>

	/* summernote 로드 */
	$(document).ready(function() {
		$('#summernote').summernote({
		   toolbar: [
			    ['style', ['bold', 'italic', 'underline', 'clear']],
			    ['fontsize', ['fontsize']],
			    ['color', ['color']],
			    ['para', ['ul', 'ol']],
			    ['insert', ['table', 'link', 'picture', 'video']],
		    ],
		    height: '350',
			lang : 'ko-KR',
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						sendFile(files[i], this);
					}
				}
			}
		});
	});

	/* summernote에서 이미지 업로드시 실행할 함수 */
	var postImage;
	function sendFile(file, el) {
		form = new FormData();
		form.append("file", file);
		$.ajax({
			data : form,
			type : "POST",
			url : "/imageupload.do",
			cache : false,
			contentType : false,
			processData : false,
			encType : "multipart/form-data",
			success : function(url) {
				$(el).summernote('editor.insertImage', url);
				postImage = url;
			}
		});
	}

	/* 저장 */
	var save = function() {
		var markup = $('#summernote').summernote('code');
		alert(markup);
	};
</script>
</html>