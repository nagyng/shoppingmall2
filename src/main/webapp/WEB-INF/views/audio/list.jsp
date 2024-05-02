<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>오로라</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/shop/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/shop/css/styles.css" rel="stylesheet" /> 
<style type="text/css">
a {
text-decoration: none;
}
a:hover {
text-decoration-line: none;
}
</style>
</head>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script> 
<script>
	$(function(){
		$("#datepicker").datepicker({
			changeMonth:true,
			changeYear:true,
			dateFormat:"yy-mm-dd",
			prevText:"이전 달",
			nextText:"다음 달",
			monthNames:['1월','2월','3월','4월',
						'5월','6월','7월','8월',
						'9월','10월','11월','12월'
				       ],
			monthNamesShort:['1월','2월','3월','4월',
							'5월','6월','7월','8월',
							'9월','10월','11월','12월'
					       ],
			dayNames:['일','월','화','수','목','금','토'],
			dayNamesShort:['일','월','화','수','목','금','토'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			showMonthAfterYear:true,
			yearSuffix:'년'
		});
	});
</script>
<body>
<%@ include file="../includes/title.jsp" %>

        
        <!-- Header-->
        <header class="bg-light bg-gradient py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-black">
                    <h1 class="display-4 fw-bolder">ALL CD</h1>
                    <p class="lead fw-normal text-black-50 mb-0">Audio Drama Series</p>
                </div>
            </div>
        </header>



        <!-- another nav --> 
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">전체보기</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
	                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
	                        <li class="nav-item dropdown">
	                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
	                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">  
	                                <li><a class="dropdown-item" href="#!">예약판</a></li>
	                                <li><a class="dropdown-item" href="#!">일반판</a></li>
	                                <li><a class="dropdown-item" href="#!">품절된 상품</a></li>
	                            </ul> 
	                        </li>
	                        
	                        <sec:authentication property="principal" var="pinfo"/> 
	                        <sec:authorize access="isAuthenticated()">
	                        	<c:if test="${pinfo.member.grade >= 9}">
	                        		<a href="/audio/insert" class="btn btn-info">새상품등록</a>
	                        	</c:if>
	                        </sec:authorize> 
	                    </ul>
	                 
                    <form action="#">
	                    <input class="form-control me-2" type="text" id="datepicker" name="datepicker" placeholder="날짜 선택">
                    </form>
			      <form class="d-flex" role="search">
			        <input class="form-control" type="search" placeholder="키워드 입력" aria-label="Search">
			        <button class="btn btn-outline-dark" type="submit">Search</button>
			      </form>
                </div>
            </div>
        </nav>
        
        
        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                   
                    <c:forEach var="audiodrama" items="${list }" >
                     
                    <div class="col mb-5">
                        <div class="card h-100">
                        	<!-- Product move get --> <!-- 
                        	<a href="/shop/get"> --> 
	                        <form action="/audio/get" method="get" id="actionForm"> 
	                        <a class="move" href='<c:out value="${audiodrama.auId }"/>'> 
                        	
                        	<!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem"><c:out value="${audiodrama.auStatus }"/></div>
                            <!-- Product image-->
                            <img class="card-img-top" src="/resources/shop/cdimg/<c:out value="${audiodrama.auArt }"/>" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><c:out value="${audiodrama.auTitle }"/></h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">
                                    	 <fmt:formatNumber value="${audiodrama.auPrice}" pattern="#,###"/>원
                                    </span>
                                    <fmt:formatNumber value="${audiodrama.auPrice}" pattern="#,###"/>원
                                </div>
                            </div>
                            
                            </a>
	                        </form>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">장바구니에 담기</a></div>
                            </div>
                            
	                        <sec:authentication property="principal" var="pinfo"/> 
	                        <sec:authorize access="isAuthenticated()">
	                        	<c:if test="${pinfo.member.grade >= 9}">
	                        		<div class="text-center">
	                        			<a href="/audio/remove?auId=<c:out value='${audiodrama.auId }'/>" 
	                        				class="btn btn-danger mt-auto">삭제</a> 
	                        		</div>
	                        	</c:if>
	                        </sec:authorize> 
	                        
                        </div>
                    </div>
                    
                    </c:forEach> 
                    
            	</div>
            
                <!-- Pagination-->
                <nav aria-label="Pagination">
                   <hr class="my-0" />
                   <ul class="pagination justify-content-center my-4">
                      <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a></li>
                      <li class="page-item active" aria-current="page"><a class="page-link" href="#!">1</a></li>
                      <li class="page-item"><a class="page-link" href="#!">2</a></li>
                      <li class="page-item"><a class="page-link" href="#!">3</a></li>
                      <li class="page-item disabled"><a class="page-link" href="#!">...</a></li>
                      <li class="page-item"><a class="page-link" href="#!">15</a></li>
                      <li class="page-item"><a class="page-link" href="#!">다음</a></li>
                  </ul>
               </nav>
               
               
               
                            <!-- p343 	3/22 -->
                            <!-- 게시물 검색 조건 & 검색 문자열 추가 시작 -->
                            <form id="searchForm" action="/audio/list" method="get">
                            	<select name="type">
                            		<option value="" <c:out 	value="${pageMaker.cri.type == null ? 'selected' : '' }"/>>
                            			 -- </option>
                            		<option value="T" <c:out 	value="${pageMaker.cri.type eq 'T' ? 'selected' : '' }"/>>
                            			 상품명 </option>
                            		<option value="C" <c:out 	value="${pageMaker.cri.type eq 'C' ? 'selected' : '' }"/>>
                            			 설명 </option>
                            		<option value="W" <c:out 	value="${pageMaker.cri.type eq 'W' ? 'selected' : '' }"/>>
                            			 작가 </option>
                            		<option value="TC" <c:out 	value="${pageMaker.cri.type eq 'TC' ? 'selected' : '' }"/>>
                            			 상품명 or 설명 </option>
                            		<option value="TW" <c:out 	value="${pageMaker.cri.type eq 'TW' ? 'selected' : '' }"/>>
                            			 상품명 or 작가 </option>
                            		<option value="TWC" <c:out 	value="${pageMaker.cri.type eq 'TWC' ? 'selected' : '' }"/>>
                            			 상품명 or 설명 or 작가 </option>
                            	</select>


                            	<input type="text" name="keyword" 	value='<c:out value="${pageMaker.cri.keyword}"/>' />
                            	<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
                            	<input type="hidden" name="amount" 	value='<c:out value="${pageMaker.cri.amount}"/>' />
                            	<button class="btn btn-default">검색</button>
                            </form> 




                            <!-- pull-right : 화면 오른쪽에 표시 처리 -->
                            <div class="pull-right">
                            	<ul class="pagination"> 
                            		<!-- p310 	3/21 페이지 액티브 수정 -->
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
                            <!-- 화면 하단에 페이징 처리 종료 --> 
                            
                            <!-- p311 	 3/21 
                            	 페이징 화면 처리 - 별도의 a 태그 동작 -->
                            <form action="/audio/list" method="get" id="actionForm">
                            	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                            	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">  
                            	<!-- p343 	3/22 
                            		검색조건,검색문자열을 hidden선언 -->
                            	<input type="hidden" name="type" value="${pageMaker.cri.type }">
                            	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">  
                            </form>
                            
               
        </section>
        <!-- Footer-->
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


$(".move").on("click",function(e){ 
	var actionForm = $("#actionForm");
	e.preventDefault(); 
	actionForm.append("<input type='hidden' name='auId' value='"+ $(this).attr("href") + "'>");
	actionForm.attr("action","/audio/get");
	actionForm.submit();
});


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
</html>