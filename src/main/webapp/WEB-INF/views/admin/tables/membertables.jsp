<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" /> 
    </head>
    <body class="sb-nav-fixed">  
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">회원 조회</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index">Dashboard</a></li>
                            <li class="breadcrumb-item active">Tables</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                                .
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                회원 조회 목록
                            </div>
                            <div class="card-body">
                            
		                	<!-- 검색 영역 -->
		                	<div class="search_wrap">
		                		<form id="searchForm" action="/admin/admintables" method="get">
		                			<div class="search_input">
		                            	<select name="type">
		                            		<option value="" <c:out 	value="${pageMaker.cri.type == null ? 'selected' : '' }"/>>
		                            			 -- </option>
		                            		<option value="T" <c:out 	value="${pageMaker.cri.type eq 'T' ? 'selected' : '' }"/>>
		                            			 아이디 </option>
		                            		<option value="C" <c:out 	value="${pageMaker.cri.type eq 'C' ? 'selected' : '' }"/>>
		                            			 이름 </option>
		                            		<option value="W" <c:out 	value="${pageMaker.cri.type eq 'W' ? 'selected' : '' }"/>>
		                            			 등급 </option>
		                            		<option value="TC" <c:out 	value="${pageMaker.cri.type eq 'TC' ? 'selected' : '' }"/>>
		                            			 아이디 or 이름 </option>
		                            		<option value="TW" <c:out 	value="${pageMaker.cri.type eq 'TW' ? 'selected' : '' }"/>>
		                            			 아이디 or 등급 </option>
		                            		<option value="TWC" <c:out 	value="${pageMaker.cri.type eq 'TWC' ? 'selected' : '' }"/>>
		                            			 아이디 or 이름 or 등급 </option>
		                            	</select>  
		                            	<input type="text" name="keyword" 	value='<c:out value="${pageMaker.cri.keyword}"/>' />
		                            	<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
		                            	<input type="hidden" name="amount" 	value='<c:out value="${pageMaker.cri.amount}"/>' />
		                    			<button class='btn search_btn'>검 색</button> 
		                    			
		                    			<a href="/admin/register" class="btn btn-sm btn-secondary m-3">새 회원 등록</a>               				
		                			</div>
		                		</form>
		                	</div>
                            
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>회원 번호</th> 
                                            <th>회원 아이디</th>
                                            <th>회원 이름</th>
                                            <th>회원 이메일</th> 
                                            <th>가입 날짜</th>
                                            <th>회원 등급</th> 
                                            <th>편집</th> 
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>회원 번호</th> 
                                            <th>회원 아이디</th>
                                            <th>회원 이름</th>
                                            <th>회원 이메일</th> 
                                            <th>가입 날짜</th>
                                            <th>회원 등급</th> 
                                            <th>편집</th> 
                                        </tr>
                                    </tfoot>
                                    <tbody>
	                    			<c:forEach items="${list}" var="list">
                                        <tr>
                                            <td><c:out value="${list.mmId}" /></td>
                                            <td><c:out value="${list.username}" /></td>
                                            <td><c:out value="${list.name}" /></td>
                                            <td><c:out value="${list.email}"/></td>
                                            <td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/></td>
                                            <td><c:out value="${list.auth}" /></td>
                                            <td> 
                                            	<a class="btn btn-sm btn-outline-success" href='/admin/modify?username=<c:out value="${list.username}" />'>수정</a>
                                            	<a class="btn btn-sm btn-outline-danger" href='/member/remove?mmId=<c:out value='${list.mmId }'/>'>삭제</a>
		                    				</td> 
                                        </tr> 
                                    </c:forEach>
                                    </tbody>
                                </table>
                                 
		                		<!-- 상품 x -->
		                		<c:if test="${listCheck == 'empty'}">
		                			<div class="table_empty">
		                				등록된 회원이 없습니다.
		                			</div>
		                		</c:if> 		
		                		
                            </div>
                            
                             <%-- 
			                <nav aria-label="Pagination">
			                   <hr class="my-0" />
			                   <ul class="pagination justify-content-center my-4">  
                            		<c:if test="${pageMaker.prev }">
                            			<li class="page-item paginate_button previous"><a class="page-link" href="${pageMaker.startPage -1 }">Previous</a></li>
                            		</c:if>
                            		
                            		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                            			<li class="page-item paginate_button ${pageMaker.cri.pageNum == num ? 'active':'' }" ><a class="page-link" href="${num }">${num }</a></li>
                            		</c:forEach>
                            		
                            		<c:if test="${pageMaker.next }">
                            			<li class="page-item paginate_button next"><a class="page-link" href="${pageMaker.endPage +1 }">Next</a></li>
                            		</c:if>
                            	</ul>  
              				 </nav>  
                            <form action="/admin/membertables" method="get" id="actionForm">
                            	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                            	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">   
                            	<input type="hidden" name="type" value="${pageMaker.cri.type }">
                            	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">  
                            </form>
                             --%>
                
                        </div>
                    </div>
                </main>
<%@ include file="../includes/footer.jsp" %> 
    </body> 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">

$(document).ready(function() { 
	
	
	
var actionForm = $("#actionForm");


$(".paginate_button a").on("click", function(e) {
	
	//태그의 원래 기능을 막는다 
	e.preventDefault();
	
	console.log('click');
	
	//클릭한 페이지 번호를 pageNum input 태그에 값을 대입한 후 submit 을 하면 해당 페이지로 이동 
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	actionForm.submit();
	 
}); 
 

});



</script>
</html>
