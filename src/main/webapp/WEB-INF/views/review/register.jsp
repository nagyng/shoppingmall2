<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 등록화면 </title>
<style>
	.uploadResult {
		width: 100%;
		background-color:gold;
	}
	
	.uploadResult ul {
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
	}
	
	.uploadResult ul li {
		list-style: none;
		padding: 10px;
		align-content: center;
		text-align:center;
	}
	
	.uploadResult ul li img {
		width: 100px;
	}
	
	
	/* p543 */	
	.uploadResult ul li span {
		color: white;		
	}
	
	.bigPictureWrapper {
		position: absolute;
		display: none;
		justify-content: center;
		align-items: center;
		top: 0%;
		width: 100%;
		height: 100%;
		background-color: lightblue;
		z-index: 100;
		background: rgba(255,255,255,0.5);
	}
	
	.bigPicture {
		position: relative;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.bigPicture img {
		width: 600px;
	}
	
	
	
	
</style>
</head>
<body>
<div class="col-9 container justify-content-center"> 
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">문의글 작성화면</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default"> 
				<div class="panel-heading">
					공지사항 작성
				</div>
				<div class="panel-body">
					<form role="form" action="/qna/register" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<div class="form-group">
							<label for="qnTitle">제목</label>
							<input type="text" id="qnTitle" class="form-control" name="qnTitle" required>
						</div>
						<div class="form-group">
							<label for="qnContent">문의 내용</label>
							<textarea name="qnContent" id="qnContent" class="form-control" rows="5" cols="50" required></textarea>
						</div>
						<div class="form-group">
							<label for="username">글쓴이</label>
							<input type="text" id="username" class="form-control" name="username" 
									value='<sec:authentication property="principal.username"/>' readonly>
						</div>
						<button type="submit" class="btn btn-success"> 등록 </button>
						<button type="reset" class="btn btn-info"> 취소 </button> 
					</form>
				</div>
			</div>
		</div>
	</div> 
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					사진파일 첨부
				</div>
				<div class="panel-body">
					<div class="form-group uploadDiv">
						<input type="file" name="uploadFile" multiple>
					</div> 
					<div class="uploadResult">
						<ul></ul>
					</div>
				</div>
			</div>
		</div>
	</div>


<script>
		$(document).ready(function() {
			 
			var formObj = $("form[role='form']");

			$("button[type='submit']").on("click", function(e) {

				e.prDefault();
				
				var str="";
				  
				$(".uploadResult ul li").each(function(i, obj){ 
					var jobj = $(obj); 
					str += "<input type='hidden' name='attachList[" + i + "].fileName' 		value='" + jobj.data("filename") + "'>";
					str += "<input type='hidden' name='attachList[" + i + "].uuid' 			value='" + jobj.data("uuid") + "'>";
					str += "<input type='hidden' name='attachList[" + i + "].uploadPath' 	value='" + jobj.data("path") + "'>";
					str += "<input type='hidden' name='attachList[" + i + "].fileType' 		value='" + jobj.data("type") + "'>";
					 
				});
				
				formObj.append(str).submit();
				
				
			});

			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880; 

			function checkExtension(fileName, fileSize) {

				if (fileSize >= maxSize) {
					alert("파일 크기가 너무 큽니다.");
					return false;
				}
 
				if (regex.test(fileName)) {
					alert("해당 파일은 업로드할 수 없습니다.");
					return false;
				}

				return true;
			}

			 
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			
			$("input[type='file']").change(function(e) {

				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;

				for (var i = 0; i < files.length; i++) {

					if (!checkExtension(files[i].name, files[i].size)) {
						return false;
					}

					formData.append("uploadFile", files[i]);
				}

				$.ajax({
					url : "/uploadAjaxAction",
					type : "post", 
					dataType : "json", 
					processData : false,
					contentType : false,  
					beforeSend	: function(xhr){
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					}, 
					data : formData,
					success : function(result) {
						showUploadResult(result);
					}
				});	 
			});		 
			
			
 
			$(".uploadResult").on("click","button",function(e){ 
				var targetFile = $(this).data("file"); 
				var type = $(this).data("type");
				
				$.ajax({
					url: "/deleteFile",
					type: "post", 
					data: {fileName: targetFile, type: type},
					dataType: "text",
					beforeSend	: function(xhr){
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					success: function(result){
						alert(result);
					}
				}); 
				 
				var deleteLi = $(this).closest("li");
				deleteLi.remove(); 
			});	 
		}); 
		 
		var uploadResult = $(".uploadResult ul"); 
		function showUploadResult(uploadResultArr) { 
			if (!uploadResultArr || uploadResultArr.length == 0) {
				return;
			} 
			var str = "";
 
			$(uploadResultArr)
					.each(
							function(i, obj) { 
								if (!obj.image) { 
									var fileCallPath = encodeURIComponent(obj.uploadPath
											+ "/"
											+ obj.uuid
											+ "_"
											+ obj.fileName);
 
									str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>"; 
									str += "<span>" + obj.fileName + "</span>";
									str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
									str += "<img src='/resources/img/attach.png'>";
									str += "</div></li>";
									 
								} else { 
									var fileCallPath = encodeURIComponent(obj.uploadPath
											+ "/s_"
											+ obj.uuid
											+ "_"
											+ obj.fileName);
 
									var originPath = obj.uploadPath + "\\"
											+ obj.uuid + "_" + obj.fileName;

									originPath = originPath.replace(new RegExp(
											/\\/g), "/");
 
									str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'><div>";
									str += "<span>" + obj.fileName + "</span>";
									str += "<button type='button' data-file=\'" + fileCallPath + "\' data-typebtn='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
									str += "<img src='/display?fileName=" + fileCallPath + "'>";
									str += "</div>";
									str += "</li>";
								}
							});
 
			uploadResult.append(str);
		} 
</script>

</div>
<%@ include file="footer.jsp" %>
</body>
</html>