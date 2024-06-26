<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ include file="header.jsp" %> 
<!DOCTYPE html>
<html lang="ko"> 
<body>
<div class="col-9 container justify-content-center">

<% 
   response.setHeader("Cache-Control","no-cache,no-store"); 
   response.setHeader("Pragma","no-cache");
   response.setDateHeader("Expires",-1); 
%>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">리뷰 게시판</h1>
                </div> 
            </div> 
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading"> 
                            리뷰 게시판
                            <button id="regBtn" type="button" class="btn btn-xs btn-success pull-right">review 등록</button>
                        </div> 
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover text-center" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>평가</th>
                                        <th>상품</th>
                                        <th>제목</th>
                                        <th>아이디</th>
                                        <th>작성일</th>
                                    </tr>
                                </thead> 
                                
                                <c:forEach var="review" items="${list }" >
                                <tr> 
                                	<td><c:out value="${review.rvId }"/></td>
                                	<td><c:out value="${review.star }"/> 
										<div class="star-rating space-x-4 mx-auto"> 		
							 			<c:forEach var="i" begin="1" end="1">
											<c:if test="${review.star >= 5}">★</c:if>
											<c:if test="${review.star >= 4}">★</c:if>
											<c:if test="${review.star >= 3}">★</c:if>
											<c:if test="${review.star >= 2}">★</c:if>
											<c:if test="${review.star >= 1}">★</c:if>				
										</c:forEach>		 
	                                	</div> 
                                	</td>
                                	<td> 
                                		<a class="moveAudio" href='<c:out value="${review.auId }"/>'>
											<img class="card-img-top mb-5 mb-md-0" width="150" height="150"
												src="/resources/shop/cdimg/<c:out value="${review.auArt }"/>" /><br> 
                                			<c:out value="${review.auTitle }"/>
                                		</a>
                                	</td>
                                	<td>
                                		<a class="move" href='<c:out value="${review.rvId }"/>'>
                                			<c:out value="${review.rvTitle }"/> 
                                		</a>
                                	</td>
                                	<td><c:out value="${review.username }"/></td>
                                	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${review.rvRegDate }"/>
                                		<p style="color:gray"><fmt:formatDate pattern="yyyy-MM-dd" value="${review.rvUpdateDate }"/></p></td>
                                </tr>
                                </c:forEach>
                            </table> 
                            
                            <form id="searchForm" action="/review/list" method="get"> 
                            	<select name="type">
                            		<option value="" <c:out 	value="${pageMaker.cri.type == null ? 'selected' : '' }"/>>
                            			 -- </option>
                            		<option value="T" <c:out 	value="${pageMaker.cri.type eq 'T' ? 'selected' : '' }"/>>
                            			 제목 </option>
                            		<option value="C" <c:out 	value="${pageMaker.cri.type eq 'C' ? 'selected' : '' }"/>>
                            			 내용 </option>
                            		<option value="W" <c:out 	value="${pageMaker.cri.type eq 'W' ? 'selected' : '' }"/>>
                            			 작성자 </option>
                            		<option value="TC" <c:out 	value="${pageMaker.cri.type eq 'TC' ? 'selected' : '' }"/>>
                            			 제목 or 내용 </option>
                            		<option value="TW" <c:out 	value="${pageMaker.cri.type eq 'TW' ? 'selected' : '' }"/>>
                            			 제목 or 작성자 </option>
                            		<option value="TWC" <c:out 	value="${pageMaker.cri.type eq 'TWC' ? 'selected' : '' }"/>>
                            			 제목 or 내용 or 작성자 </option>
                            	</select>  
                            	<input type="text" name="keyword" 	value='<c:out value="${pageMaker.cri.keyword}"/>' />
                            	<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
                            	<input type="hidden" name="amount" 	value='<c:out value="${pageMaker.cri.amount}"/>' />
                            	<button class="btn btn-default">검색</button> 
                            </form>  
                             
                            <div class="pull-right">
                            	<ul class="pagination">  
                            		<c:if test="${pageMaker.prev }">
                            			<li class="paginate_button previous"><a href="${pageMaker.startPage -1 }">Previous</a></li>
                            		</c:if>
                            		
                            		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                            			<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active':'' }" ><a href="${num }">${num }</a></li>
                            		</c:forEach>
                            		
                            		<c:if test="${pageMaker.next }">
                            			<li class="paginate_button next"><a href="${pageMaker.endPage +1 }">Next</a></li>
                            		</c:if>
                            	</ul> 
                            </div> 
                             
                            <form action="/review/list" method="get" id="actionForm">
                            	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                            	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">   
                            	<input type="hidden" name="type" value="${pageMaker.cri.type }">
                            	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">  
                            </form>
                            
                              
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            	<div class="modal-dialog">
                            		<div class="modal-content">
                            			<div class="modal-header"> 
                            				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            					&times;
                            				</button>
                            				<h4 class="modal-title" id="myModalLabel">Modal Title</h4>
                            			</div>
                            			<div class="modal-body">
                            				처리가 완료되었습니다.
                            			</div>
                            			<div class="modal-footer">
                            				<button type="button" class="btn btn-info" data-dismiss="modal">닫기</button>
                            				<button type="button" class="btn btn-success" data-dismiss="modal">저장</button>
                            			</div>
                            		</div>
                            	</div> 
                            </div> 
                        </div> 
                    </div> 
                </div> 
            </div>

</div> 
 
<script type="text/javascript">
$(document).ready(function() {
	 
	var result = '<c:out value="${result}"/>';
	 
	checkModal(result);
	 
	function checkModal(result) {
		 
		if(result === '') {
			return;
		} 
		if(parseInt(result) > 0){ 
			$(".modal-body").html("리뷰글 " + parseInt(result) + " 번이 등록되었습니다.");
		} 
		$("#myModal").modal("show");
	}
	
	/*  
		게시물 등록 버튼 처리 */
	$("#regBtn").on("click", function(){
		self.location = "/review/register";
	});
	
	/*
		하단 페이지 번호를 클릭 시 처리 */
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e) {
		
		//태그의 원래 기능을 막는다 
		e.preventDefault();
		
		console.log('click');
		
		//클릭한 페이지 번호를 pageNum input 태그에 값을 대입한 후 submit 을 하면 해당 페이지로 이동 
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		
		actionForm.submit();
		 
	});


	//제목을 클릭한 경우 게시물 상세보기 화면으로 이동
	$(".move").on("click",function(e){
		
		e.preventDefault();
		
		actionForm.append("<input type='hidden' name='rvId' value='"+ $(this).attr("href") + "'>");
		actionForm.attr("action","/review/get");
		actionForm.submit();
	});
	
	$(".moveAudio").on("click",function(e){
		
		e.preventDefault();
		
		actionForm.append("<input type='hidden' name='auId' value='"+ $(this).attr("href") + "'>");
		actionForm.attr("action","/audio/get");
		actionForm.submit();
	});
	


	//검색 버튼의 이벤트 처리
	//조회 버튼의 모든 정보를 변수에 대입 
	var searchForm = $("#searchForm");
	
	$("#searchForm button").on("click", function(e){
		
		if(!searchForm.find("option:selected").val()){
			alert("검색종류를 선택하세요.");
			return false;
		}

		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요.");
			return false;
		}
		
		//검색 후에 1페이지로 이동
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		
		//검색에서 입력받은 데이터를 서버로 전송
		searchForm.submit();
		
	});
	
});


</script>
<%@ include file="footer.jsp" %>
</body>
</html>