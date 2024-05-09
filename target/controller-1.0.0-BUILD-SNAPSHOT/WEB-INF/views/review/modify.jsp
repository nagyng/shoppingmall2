<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정하기</title>
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
<!-- p260 	3/20 --> 
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">문의글 수정</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">문의글 수정화면</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			<form role="form" action="/qna/modify" method="post">
                    
                    
                    <!-- 719	0402 보안 적용 -->
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			
					<div class="form-group">
						<label for="qnId">evId</label>
						<input class="form-control" name="qnId" id="qnId" 
								value='<c:out value="${qna.qnId }" />' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label for="qnTitle">제목</label>
						<input class="form-control" name="qnTitle" id="qnTitle" value='<c:out value="${qna.qnTitle }" />' required >
					</div>
					
					<div class="form-group">
						<label for="qnContent">문의 내용</label>
						<textarea class="form-control" rows="5" name="qnContent" id="qnContent" required><c:out value="${qna.qnContent }"></c:out></textarea>
					</div>
					 
					<div class="form-group">
						<label for="username">글쓴이</label>
						<input class="form-control" name="username" id="username" value='<c:out value="${qna.username }" />' readonly>
					</div> 
					
					
					
					<sec:authentication property="principal" var="pinfo"/> 
					<sec:authorize access="isAuthenticated()">
						<c:if test="${pinfo.username eq qna.username }">
							<button data-oper='modify' type="submit" class="btn btn-primary">수정</button>
							<button data-oper='remove' type="submit" class="btn btn-danger">삭제</button>
						</c:if>
					</sec:authorize> 
					<button data-oper='list' type="submit" class="btn btn-info">목록</button>
					 
					<input type="hidden" id="pageNum" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
					<input type="hidden" id="amount" name="amount"	 value='<c:out value="${cri.amount }"/>'> 
					<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
					<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
 
 
				</form>

			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row --> 






<!-- p584	3/29 -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-warning">
		
			<div class="panel-heading">첨부파일</div>
			<div class="panel-body">
			
			<!--  p586 -->
				<div class="form-group uploadDiv">
					<input type="file" name="uploadFile" multiple>
				</div>
			
			
				<div class="uploadResult">
					<ul>
					
					</ul>
				</div>
			</div>
		
		</div>
	</div>
</div> 


 
<script type="text/javascript">
$(document).ready(function() {
	
	var formObj = $("form");
	
	/* 버튼을 클릭하면 이벤트 정보가 매개변수 e 대입 */
	$('button').on("click", function(e){
		
		// 원래 태그의 기능을 막는다. (ex. 페이지 이동)
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove'){		//삭제 버튼 클릭 처리 
			formObj.attr("action", "/qna/remove");
			
		} else if (operation === 'list'){	//목록 버튼 클릭 처리 
			//move to list
			//self.location = "/qna/list";
			//return;  
			formObj.attr("action", "/qna/list").attr("method","get"); 
			//p321 	3/21
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			//p347 	3/22
			var keywordTag = $("input[name='keyword']").clone();
			var typeTag = $("input[name='type']").clone();
			
			
			//p266 	3/20
			formObj.empty();		//empty() : 태그는 그대로 두고 값만 삭제. & remove() : 모두 삭제
			//p321 	3/21
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			//p347 	3/22
			formObj.append(keywordTag);
			formObj.append(typeTag);
		}
		
		
		//p590
		else if (operation === 'modify'){
			
			console.log("수정 버튼클릭 ");
			
			var str="";

			$(".uploadResult ul li").each(function(i, obj){
				
				var jobj = $(obj);
				
				
				str += "<input type='hidden' name='attachList[" + i + "].fileName' 		value='" + jobj.data("filename") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].uuid' 			value='" + jobj.data("uuid") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].uploadPath' 	value='" + jobj.data("path") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].fileType' 		value='" + jobj.data("type") + "'>";
				
				
			});
			
			formObj.append(str).submit(); 
		}
		
		formObj.submit();	//수정 버튼 클릭 처리 
		
	});
	
	
	
	
	
  
		(function(){
			
			var qnId = '<c:out value="${qna.qnId}"/>';
			 
			$.getJSON("/qna/getAttachList",{qnId: qnId},function(arr){
				
				var str = "";


				$(arr).each(function(i,attach){
					
					//첨부파일이 이미지 
					if(attach.fileType){
						var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
						
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
						str += "<span> " + attach.fileName + "</span><br/>";
						str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='/display?fileName="+fileCallPath+"'>";
						str += "</div>";
						str += "</li>";
					}else{ //첨부파일이 일반파일 
						
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
						str += "<span> " + attach.fileName + "</span><br/>";
						str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='/resources/img/attach.qng'>";
						str += "</div>";
						str += "</li>";
					}
				});
				
				//첨부파일 영역에 출력
				$(".uploadResult ul").html(str);
			});
			
		})();

	

		$(".uploadResult").on("click","button",function(e){
			
			
			if(confirm("Remove this file? ")){
				
				var targetLi = $(this).closest("li");
				targetLi.remove();
			}
			
		});
	
	
	

		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880;//5M

		function checkExtension(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 크기가 너무 큽니다.");
				return false;
			}

			//정규표현식을 적용해서 true 되면 업로드 처리 불가
			if (regex.test(fileName)) {
				alert("해당 파일은 업로드할 수 없습니다.");
				return false;
			}

			return true;
		}

		
		
		

		//721	0402
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
				//클라이언트가 서버에서 전송받는 데이터 타입
				//을 선언
				dataType : "json",
				//ajax를 사용하여 업로드 처리를 하는 경우
				//밑에 있는 두개의 속성을 false로 지정해야 한다.
				processData : false,
				contentType : false,
				//722	0402
				beforeSend	: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				//서버로 전송하는 데이터
				data : formData,
				success : function(result) {
					showUploadResult(result);
				}
			});
		});
 
		
		
		
		
	});//ready
	
	

	//564		3/29
	var uploadResult = $(".uploadResult ul");

	function showUploadResult(uploadResultArr) {

		//p558 매개변수 값이 없으면 처리
		if (!uploadResultArr || uploadResultArr.length == 0) {
			return;
		}

		var str = "";

		//반복문을 사용해서 업로드한 파일명을 출력 
		$(uploadResultArr)
				.each(
						function(i, obj) {
							//p525
							//업로드한 파일이 일반파일인 경우 아이콘을 출력
							if (!obj.image) {
								//p537 업로드 파일 경로
								var fileCallPath = encodeURIComponent(obj.uploadPath
										+ "/"
										+ obj.uuid
										+ "_"
										+ obj.fileName);

								//일반파일인 경우 a태그를 클릭시 다운로드 처리
								str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>"; 
								str += "<span>" + obj.fileName + "</span>";
								str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
								str += "<img src='/resources/img/attach.png'>";
								str += "</div></li>"; 
							} else { //업로드한 파일이 이미지인 경우
								//p528
								//encodeURIComponent ?
								//컴퓨터가 인식할 수 있도록 문자열을 바이트배열로 변환
								//업로드한 파일이 이미지인 경우 썸네일 파일을 보여준다.
								var fileCallPath = encodeURIComponent(obj.uploadPath
										+ "/s_"
										+ obj.uuid
										+ "_"
										+ obj.fileName);

								//p541
								//업로드 파일이 있는 절대경로
								var originPath = obj.uploadPath + "\\"
										+ obj.uuid + "_" + obj.fileName;

								originPath = originPath.replace(new RegExp(
										/\\/g), "/");

								//a 태그를 클릭하면 원본 이미지를 출력
								str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'><div>";
								str += "<span>" + obj.fileName + "</span>";
								str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
								str += "<img src='/display?fileName=" + fileCallPath + "'>";
								str += "</div>";
								str += "</li>"; 
							}
						});

		//ul영역에 업로드한 파일내역이 추가
		uploadResult.append(str);
 
	}
	
	
</script>


</div>
<%@ include file="footer.jsp" %>   
</body>
</html>