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
        <title>AU;RA</title>
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
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
	                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown"> <!-- 
	                                <li><a class="dropdown-item" href="#!">모든 상품</a></li>
	                                <li><hr class="dropdown-divider" /></li> -->
	                                <li><a class="dropdown-item" href="#!">예약판</a></li>
	                                <li><a class="dropdown-item" href="#!">일반판</a></li>
	                                <li><a class="dropdown-item" href="#!">품절된 상품</a></li>
	                            </ul> 
	                        </li>
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
        </section>
        <!-- Footer-->
<%@ include file="../includes/footer.jsp" %> 
</body> 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">

$(".move").on("click",function(e){ 
	var actionForm = $("#actionForm");
	e.preventDefault(); 
	actionForm.append("<input type='hidden' name='auId' value='"+ $(this).attr("href") + "'>");
	actionForm.attr("action","/audio/get");
	actionForm.submit();
});



</script>
</html>