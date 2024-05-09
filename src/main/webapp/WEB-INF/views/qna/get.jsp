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
			<h1 class="page-header">QNA Read</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default"> 
				<div class="panel-heading">
					문의글
				</div>
				<div class="panel-body">
						<div class="form-group">
							<label for="qnId">문의 번호</label>
							<input type="text" id="qnId" class="form-control" name="qnId" value='<c:out value="${qna.qnId}"/>' readonly="readonly">
						</div>
						<div class="form-group">
							<label for="qnTitle">제목</label>
							<input type="text" id="qnTitle" class="form-control" name="qnTitle" value='<c:out value="${qna.qnTitle}"/>' readonly="readonly">
						</div>
						<div class="form-group">
							<label for="qnContent">문의 내용</label>
							<textarea name="qnContent" id="qnContent" class="form-control" rows="3" cols="50" readonly="readonly"><c:out value="${qna.qnContent}"/></textarea>
						</div>
						<div class="form-group">
							<label for="username">작성자</label>
							<input type="text" id="username" class="form-control" name="username" value='<c:out value="${qna.username}"/>' readonly="readonly">
						</div>
						   
 
						<sec:authentication property="principal" var="pinfo"/> 
						<sec:authorize access="isAuthenticated()">
							<c:if test="${pinfo.username eq qna.username or pinfo.member.grade >= 9}">
								<button data-oper="modify" class="btn btn-primary">수정</button>		
							</c:if>
						</sec:authorize> 
						<button data-oper="list" class="btn btn-danger">목록</button>
						
						<form id="operForm" action="/qna/modify" method="get">
							<input type="hidden" id="qnId" name="qnId" value='<c:out value="${qna.qnId}"/>'> 
							<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
							<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'> 
							<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
							<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						</form>

				</div>
			</div>
		</div>
	</div> 


	
	
	<!-- p414 댓글 목록 시작 -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-success">
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i>
					댓글
					<!-- p718 정상적으로 로그인한 사용자만 댓글등록 버튼 보이게 처리 -->
					<sec:authorize access="isAuthenticated()">
						<button id="addReplyBtn" class="btn btn-success btn-xs pull-right">
							새 답변
						</button>
					</sec:authorize>
					
				</div>
				<div class="panel-body">
					<ul class="chat">
						<li class="left clearfix" data-reId="12">
							<div class="header">
								<strong class="primary-font">user00</strong>
								<small class="pull-right text-muted">2024-03-26 12:16</small>
							</div>
							<p>댓글테스트</p>
						</li>
					</ul>
				</div>
				
				<!-- p439 댓글 페이징 화면 구현 -->
				<div class="panel-footer">
				</div>
				
			</div>
		</div>
	</div>
	<!-- p414 댓글 목록 종료 -->
	
	<!-- p420 댓글 등록 모달창 시작 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">댓글 등록</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>댓글내용</label>
						<input class="form-control" name="content" value="content" required>
					</div>
					<div class="form-group">
						<label>댓글작성자</label>
						<input class="form-control" name="username" value="username" readonly>
					</div>
					<div class="form-group">
						<label>댓글등록일자</label>
						<input class="form-control" name="reRegDate" value="reRegDate">
					</div>
				</div>
				<div class="modal-footer">
					<button id="modalModBtn" type="button" class="btn btn-warning">수정</button>
					<button id="modalRemoveBtn" type="button" class="btn btn-danger">삭제</button>
					<button id="modalRegisterBtn" type="button" class="btn btn-success">등록</button>
					<button id="modalCloseBtn" type="button" class="btn btn-info">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- p420 댓글 등록 모달창 종료 -->
</div> 
	
<!-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>   -->
<script src="/resources/qna/js/reply.js"></script>   
 
<script>
$(document).ready(function(){
	 
	//내역을 처리
	//즉시실행함수
	(function(){
		var qnId = '<c:out value="${qna.qnId}"/>';
		
		//데이터는 json 형태로 리턴  
		//특정 게시물에 대한 첨부파일 목록을 가져온다. 
			$.getJSON("/qna/getAttachList",{qnId: qnId},function(arr){
			
			var str = "";
			
			//반복문으로 첨부목록을 조회한다.
			$(arr).each(function(i,attach){
				  
				//첨부파일이 이미지이면 처리
				if(attach.fileType){
					var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
					
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str += "</li>";
				}else{ //첨부파일이 일반파일이면 처리
					
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
					str += "<span> " + attach.fileName + "</span><br/>";
					str += "<img src='/resources/qna/img/attach.png'>";
					str += "</div>";
					str += "</li>";
				}
			});
			
			//첨부파일 영역에 출력
			$(".uploadResult ul").html(str);
		});
		
	})();
	 
		
		var operForm = $("#operForm");
		
		//수정 버튼을 클릭한 경우 처리
		$("button[data-oper='modify']").on("click",function(e){
			operForm.attr("action","/qna/modify")
			        .submit();
		});

		//목록 버튼을 클릭시 처리
		$("button[data-oper='list']").on("click",function(e){
			operForm.attr("action","/qna/list")
			        .submit();
		});
		  

		//특정 게시물 번호를 변수에 대입
		var qnIdValue = '<c:out value="${qna.qnId}"/>';
		
		//댓글영역을 변수에 대입
		var replyUL = $(".chat");
		
		showList(1);
		
		//특정 게시물 번호에 대한 댓글을 조회하는 함수
		function showList(page){
			 
			replyService.getList({
				qnId: qnIdValue, page: page || 1
			},function(replyCnt,list){
				 
				var str = "";
				
				if(list == null || list.length == 0){
					replyUL.html("");
					
					return;
				}
				
				//댓글이 존재 
				for(var i=0;i<list.length;i++){
					
					str += "<li class='left clearfix' data-reId='"+list[i].reId+"'>";
					str += "<div><div class='header'><strong class='primary-font'>" + list[i].username + "</strong>";
					str += "<small class='pull-right text-muted'>" + list[i].reRegDate + "</small></div>";
					str += "<p>" + list[i].content + "</p></div></li>";
					 
				}
				
				//댓글영역에 댓글목록을 출력
				replyUL.html(str);
				
				//추가
				showReplyPage(replyCnt);
			}); 
		}//
		
		//p422 댓글 등록 모달창 버튼 처리
		//모달창 div 영역의 값을 변수에 대입
		var modal = $(".modal");
		
		//입력한 댓글내용을 변수에 대입
		var modalInputContent = modal.find("input[name='content']");
		//입력한 댓글작성자를 변수에 대입
		var modalInputUsername = modal.find("input[name='username']");
		//댓글 작성일을 변수에 대입
		var modalInputReRegDate = modal.find("input[name='reRegDate']");
		
		//수정버튼의 모든 정보를 변수에 대입
		var modalModBtn = $("#modalModBtn");
		//삭제버튼의 모든 정보를 변수에 대입
		var modalRemoveBtn = $("#modalRemoveBtn");
		//등록버튼의 모든 정보를 변수에 대입
		var modalRegisterBtn = $("#modalRegisterBtn");
		//닫기버튼의 모든 정보를 변수에 대입		
		var modalCloseBtn = $("#modalCloseBtn");
		
		/* p727 */
		var username = null;
		
		/* 로그인한 사용자의 아이디를 변수에 대입 */
		<sec:authorize access="isAuthenticated()">
		username = '<sec:authentication property="principal.username"/>';		//replyer -> username 변수이름 변경 체크
		</sec:authorize>
		
		var csrfParameterName = "${_csrf.parameterName}";
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		
		//댓글등록 버튼을 클릭했을때 처리
		$("#addReplyBtn").on("click",function(e){
			
			//입력창을 클리어
			modal.find("input").val("");
			
			/* p728 */
			//모달창에 있는 작성자 input태그에 출력
			modal.find("input[name='username']").val(username);
			
			//댓글 등록일자 div영역을 숨기기
			modalInputReRegDate.closest("div").hide();
			modal.find("button[id != 'modalCloseBtn']").hide();
			
			//댓글등록 버튼을 보여주기
			modalRegisterBtn.show();
			
			//모달창 보여주기
			$(".modal").modal("show");
			
		});
		
		/* p728 */
		/* ajax가 선언된 곳에 beforeSend가 적용되는 효과 */
		$(document).ajaxSend(function(e,xhr,options){
			xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
		});
		
		//p423 모달창 등록버튼 처리
		modalRegisterBtn.on("click",function(e){
			
			//객체형태
			var reply = {
				//모달창에서 입력한 댓글내용	
				content: modalInputContent.val(),
				//모달창의 댓글작성자
				username: modalInputUsername.val(),
				//댓글을 달려는 특정 게시물번호
				qnId: qnIdValue
			};
			
			//reply.js에 댓글등록 처리
			replyService.add(reply,function(result){
					
				//댓글등록후 화면 클리어
				modal.find("input").val("");
				//모달창 닫기
				modal.modal("hide");
				
				//1페이지 새로고침
				showList(1);
			});
			
		});//
		
		//p425 댓글 목록에서 특정 댓글 클릭시 상세보기 모달창 구현
		$(".chat").on("click","li",function(e){  
						
			//현재 클릭한 댓글번호를 변수에 대입
			var reId = $(this).data("reid"); 
			
			//reply:특정 댓글내역을 가지고 있는 변수
			replyService.get(reId,function(reply){
				
				//리턴된 댓글내용을 모달창에 표시
				modalInputContent.val(reply.content);
				//리턴된 댓글작성자를 모달창에 표시
				modalInputUsername.val(reply.username)
				                 .attr("readonly","readonly");
				//리턴된 댓글 작성일자를 모달창에 표시
				modalInputReRegDate.val(reply.reRegDate)
				                   .attr("readonly","readonly");
				
				//모달창의 data-reId 속성에 리턴된 댓글번호를 대입
				modal.data("reId",reply.reId);
				
				modal.find("button[id != 'modalCloseBtn']").hide();
				
				//댓글 수정 & 삭제 버튼을 보이기
				modalModBtn.show();
				modalRemoveBtn.show();
				
				//모달창 보이기
				$(".modal").modal("show");
				
			});
			
		});
		
		//p427 모달창 수정버튼 클릭 처리
		modalModBtn.on("click",function(e){
			
			/* p733 */
			//모달창 작성자를 변수에 대입
			var originalUsername = modalInputUsername.val(); 
			
			//댓글 객체를 생성
			var reply = {
				reId: modal.data("reId"),
				content: modalInputContent.val(),
				username: originalUsername
			};
			
			if(!username){ 
				alert("로그인후 수정이 가능합니다.");
				modal.modal("hide");
				return;
			}
			
			if(username != originalUsername){ 
				alert("수정 권한이 없습니다.");
				modal.modal("hide");
				return;	
			}

			replyService.update(reply,function(result){ 
				//정상적으로 댓글 수정후 모달창 닫기 & 화면 새로고침
				//alert(result); 
				modal.modal("hide");
				
				showList(pageNum);
			});
			
		});
		
		//p427 모달창 삭제버튼 클릭 처리
		modalRemoveBtn.on("click",function(e){  
			
			//삭제하려는 댓글번호를 변수에 대입
			var reId = modal.data("reId"); 
			
			//p730
			if(!username){ 
				alert("로그인 후 삭제 가능합니다.");
				modal.modal("hide");
				return;
			}
			
			var originalUsername = modalInputUsername.val();
			
			//모달창의 작성자와 로그인한 사용자를 비교
			if(username != originalUsername){ 
				alert("자신이 작성한 댓글만 삭제가 가능합니다.");
				modal.modal("hide");
				return;	
			}
			
			//reply.js 를 사용하여 댓글을 삭제
			replyService.remove(reId,originalUsername,function(result){ 
				alert(result); 
				modal.modal("hide"); 
				showList(pageNum);
			});
		
		});
		
		//모달 닫기 버튼 클릭 처리
		modalCloseBtn.on("click",function(e){
			
			$(".modal").modal("hide");
		});
		 
		
		var pageNum = 1;
		 
		var replyPageFooter = $(".panel-footer");
		
		function  showReplyPage(replyCnt){
			
			//화면 하단의 종료 페이지번호
			var endNum = Math.ceil(pageNum /10.0) * 10;
			//화면 하단의 시작 페이지번호
			var startNum = endNum - 9;
			
			//이전페이지 여부 체크
			var prev = startNum != 1;
			//다음페이지 존재여부
			var next = false;
			
			//종료페이지 계산 처리
			if(endNum * 10 >= replyCnt){
				endNum = Math.ceil(replyCnt / 10.0);
			}
			
			//다음페이지 존재 지정
			if(endNum * 10 < replyCnt) {
				next = true;
			}
			
			var str = "<ul class='pagination pull-right'>";
			
			/* 이전페이지 표시 여부 */
			if(prev){
				str += "<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>이전</a></li>";
			}
			
			for(var i=startNum;i<=endNum;i++){
				
				//현재 작업중인 페이지 인경우 active 상태로 변경
				var active = pageNum == i ? "active" : "";
				
				str += "<li class='page-item " + active + "'><a class='page-link' href='"+i+"'>" + i + "</a></li>"; 
			}			
			
			/* 다음 페이지 처리 */
			if(next){
				str += "<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>다음</a></li>";
			}
			
			str += "</ul></div>";
			
			//댓글 페이징 처리 화면에 반영
			replyPageFooter.html(str);
				
		}


		replyPageFooter.on("click","li a",function(e){
			
			e.preventDefault();
			
			var targetPageNum = $(this).attr("href");
			
			pageNum = targetPageNum;
			
			showList(pageNum);
			
		});
		
		
		
		

		//p575 첨부파일 다운로드 처리 & 원본 이미지 출력
		$(".uploadResult").on("click","li",function(e){

			//li태그의 모든 정보를 변수에 대입
			var liObj = $(this);
			
			var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));
			
			//이미지인 경우 처리
			if(liObj.data("type")){
				showImage(path.replace(new RegExp(/\\/g),"/"));
			}else{
				self.location = "/download?fileName=" + path;
			}
		});//
		
		//썸네일 파일을 클릭하면 원본 파일을 출력한다.
		function showImage(fileCallPath){
			
			//bigPictureWrapper : 원본 이미지를 보여주는 영역
			$(".bigPictureWrapper").css("display","flex").show();
			
			//원본이미지를 가로,세로 1초동안 서서히 100%로 보여준다.
			$(".bigPicture").html("<img src='/display?fileName=" + fileCallPath + "'>")
			                .animate({width:'100%',height: '100%'},1000);
		}//
		
		//p544 원본이미지 클릭시 숨기기
		$(".bigPictureWrapper").on("click",function(e){
			
			//원본 이미지를 클릭하면 1초동안 숨기기 선언
			$(".bigPicture").animate({width: '0%',height: '0%'},1000);
			
			setTimeout(() => {
				$(this).hide(); //원본이미지 숨기기
			},1000);
		});

	}); 
</script>
 
<%@ include file="footer.jsp" %>
</body>
</html>