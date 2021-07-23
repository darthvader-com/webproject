<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<jsp:include page="/resources/common/referer.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/common/mobileheaderboard.jsp"></jsp:include>
<title>게시판</title>
</head>

<body>
	<div class="container" style="margin-top: 10px;">
		<span style="font-style: 20px; font-weight: 600; margin-top: 6px;">게시글 작성</span><button class="btn btn-primary btn-sm" onclick="save();" style="margin-left: 15px;">저장</button>
		<hr>
		<div class="form-group">
			<input type="text" class="form-control" placeholder="제목" id="title" name="title">
		</div>
		<div id="summernote"></div>
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
		    height: '330',
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
<jsp:include page="/resources/common/prevent.jsp"></jsp:include>
</html>