<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰글 등록화면 </title>
<style>
 
.star-rating {
  border:solid 0px #ccc;
  display:flex;
  flex-direction: row-reverse;
  font-size:5.5em;
  justify-content:space-around;
  padding:0.2em;
  text-align:center;
  width:5em;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#f90;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
} 
	 
	
</style>
</head>
<body>
<div class="col-9 container justify-content-center"> 
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">리뷰글 작성화면</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default"> 
				<div class="panel-heading">
					리뷰 작성
				</div>
				<div class="panel-body">
					<form role="form" action="/qna/register" method="post">

						<div class="btn-group">
						  <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
						    Dropdown
						  </button>
						  <ul class="dropdown-menu">
						    <li><a class="dropdown-item" href="#">Menu item</a></li>
						    <li><a class="dropdown-item" href="#">Menu item</a></li>
						    <li><a class="dropdown-item" href="#">Menu item</a></li>
						  </ul>
						</div>
					
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
						<div class="form-group">
							<label for="rvTitle">제목</label>
							<input type="text" id="rvTitle" class="form-control" name="rvTitle" required>
						</div>
						<div class="form-group">
							<label for="rvContent">리뷰 내용</label>
							<textarea name="rvContent" id="rvContent" class="form-control" rows="5" cols="50" required></textarea>
						</div>
						<div class="form-group">
							<label for="username">아이디</label>
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
					별점 평가
				</div>
				<div class="panel-body">
					<div class="form-group">
						<label for="customRange2" class="form-label">상품을 평가해주세요!</label> 
						<div class="star-rating space-x-4 mx-auto">
							<input type="radio" id="5-stars" name="star" value="5" v-model="ratings"/>
							<label for="5-stars" class="star pr-4">★</label>
							<input type="radio" id="4-stars" name="star" value="4" v-model="ratings"/>
							<label for="4-stars" class="star">★</label>
							<input type="radio" id="3-stars" name="star" value="3" v-model="ratings"/>
							<label for="3-stars" class="star">★</label>
							<input type="radio" id="2-stars" name="star" value="2" v-model="ratings"/>
							<label for="2-stars" class="star">★</label>
							<input type="radio" id="1-star" name="star" value="1" v-model="ratings" />
							<label for="1-star" class="star">★</label>
						</div> 
					</div>  
				</div>
			<!-- 
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
				</div> -->
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