<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.uploadResult {
		width: 100%;
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
		text-align: center
	}
	
	.uploadResult ul li img {
		width: 100px;
	}
	
	.uploadResult ul li span { 
	}
	
	.bigPictureWrapper {
		position: absolute;
		display: none;
		justify-content: center;
		align-items: center;
		top: 0%;
		width: 100%;
		height: 100%;
		z-index: 100;
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
			<h1 class="page-header">EVENT Read</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default"> 
				<div class="panel-heading">
					이벤트 안내 상세
				</div>
				<div class="panel-body">
						<div class="form-group">
							<label for="evId">글 번호</label>
							<input type="text" id="evId" class="form-control" name="evId" value='<c:out value="${event.evId}"/>' readonly="readonly">
						</div>
						<div class="form-group"> 
							<label for="evTitle">제목</label>
							<input type="text" id="evTitle" class="form-control" name="evTitle" value='<c:out value="${event.evTitle}"/>' readonly="readonly">
						</div>
						<div class="form-group">
							<label for="evContent">내용</label>
							<textarea name="evContent" id="evContent" class="form-control" rows="3" cols="50" readonly="readonly"><c:out value="${event.evContent}"/></textarea>
						</div>
						<div class="form-group">
							<label for="username">작성자</label>
							<input type="text" id="username" class="form-control" name="username" value='<c:out value="${event.username}"/>' readonly="readonly">
						</div>
						   
 
						<sec:authentication property="principal" var="pinfo"/> 
						<sec:authorize access="isAuthenticated()">
							<c:if test="${pinfo.username eq event.username or pinfo.member.grade >= 9}">
								<button data-oper="modify" class="btn btn-primary">수정</button>		
							</c:if>
						</sec:authorize>
						<button data-oper="list" class="btn btn-danger">목록</button>
						
						<form id="operForm" action="/event/modify" method="get">
							<input type="hidden" id="evId" name="evId" value='<c:out value="${event.evId}"/>'> 
							<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
							<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'> 
							<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
							<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
						</form>

				</div>
			</div>
		</div>
	</div>
	 
	<div class="bigPictureWrapper">
		<div class="bigPicture">
		</div>
	</div>
	 
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					첨부파일
				</div>
				<div class="panel-body">
					<div class="uploadResult">
						<ul></ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div> 
	
	
	
<script>
	$(document).ready(function(){ 
		(function(){
			var evId = '<c:out value="${event.evId}"/>'; 
 			$.getJSON("/event/getAttachList",{evId: evId},function(arr){ 
				var str = ""; 
				$(arr).each(function(i,attach){ 
					if(attach.fileType){
						var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
						
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
						str += "<img src='/display?fileName="+fileCallPath+"'>";
						str += "</div>";
						str += "</li>";
					}else{   
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
						str += "<span> " + attach.fileName + "</span><br/>";
						str += "<img src='/resources/img/attach.png'>";
						str += "</div>";
						str += "</li>";
					}
				}); 
				$(".uploadResult ul").html(str);
			}); 
		})();
		
		
		var operForm = $("#operForm");
		 
		$("button[data-oper='modify']").on("click",function(e){
			operForm.attr("action","/event/modify")
			        .submit();
		});
		 
		$("button[data-oper='list']").on("click",function(e){
			operForm.attr("action","/event/list")
			        .submit();
		});
		  
		var evIdValue = '<c:out value="${event.evId}"/>';
 
 
 
		$(".uploadResult").on("click","li",function(e){ 
			var liObj = $(this); 
			var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename")); 
			if(liObj.data("type")){
				showImage(path.replace(new RegExp(/\\/g),"/"));
			}else{
				self.location = "/download?fileName=" + path;
			}
		}); 
		 
		function showImage(fileCallPath){ 
			$(".bigPictureWrapper").css("display","flex").show(); 
			$(".bigPicture").html("<img src='/display?fileName=" + fileCallPath + "'>")
			                .animate({width:'100%',height: '100%'},1000);
		} 
		 
		$(".bigPictureWrapper").on("click",function(e){ 
			$(".bigPicture").animate({width: '0%',height: '0%'},1000); 
			setTimeout(() => {
				$(this).hide(); 
			},1000);
		}); 
	}); 
</script>


<%@ include file="footer.jsp" %>
</body>
</html>