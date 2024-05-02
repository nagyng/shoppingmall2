<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./includes/header.jsp" %>
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
<%@ include file="./includes/title.jsp" %>

        
        <!-- Header-->
        <header class="bg-light bg-gradient py-5 row justify-content-center">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-black">
                    <h1 class="display-4 fw-bolder">AUDIO DRAMA CD</h1>
                    <p class="lead fw-normal text-black-50 mb-0">Audio Drama Series</p>
                </div>
            </div> 
            <div id="carouselExampleFade" class="carousel slide col-md-6" data-bs-ride="carousel">
			  <div class="carousel-inner">
			    <div class="carousel-item">
			      <img src="/resources/shop/cdimg/b3hi03fd.png" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="/resources/shop/cdimg/fs4b3ten.png" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item active">
			      <img src="/resources/shop/cdimg/nsngz5uv.png" class="d-block w-100" alt="...">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
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
                
                
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="resources/shop/cdimg/2024_155030.jpeg" alt="0020000000412.jpg" />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">(일반판) The JaRa vol.40 권도일님</h5>
                                    <!-- Product price-->
                                    15,000원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="resources/shop/cdimg/2024_155030.jpeg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">도둑들 PART2</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">109,000원</span>
                                    109,000원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    
                    
                    <c:forEach var="shop" items="${list }" >
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem"><c:out value="${audiodrama.auStatus }"/></div>
                            
                            <!-- Product image-->
                            <img class="card-img-top" src="<c:out value="${audiodrama.auArt }"/>" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><c:out value="${audiodrama.auTitle }"/></h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$50.00</span>
                                    <c:out value="${audiodrama.auPrice }"/>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    
                    </c:forEach> 
                
            	</div>
            </div>
            <!-- Pagination-->
                <nav aria-label="Pagination">
                   <hr class="my-0" />
                   <ul class="pagination justify-content-center my-4">
                      <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Newer</a></li>
                      <li class="page-item active" aria-current="page"><a class="page-link" href="#!">1</a></li>
                      <li class="page-item"><a class="page-link" href="#!">2</a></li>
                      <li class="page-item"><a class="page-link" href="#!">3</a></li>
                      <li class="page-item disabled"><a class="page-link" href="#!">...</a></li>
                      <li class="page-item"><a class="page-link" href="#!">15</a></li>
                      <li class="page-item"><a class="page-link" href="#!">Older</a></li>
                  </ul>
               </nav>
            
            
            <%-- 
            <%@ include file="/review/list.jsp" %>
             --%>
            
        </section>
        <!-- Footer-->
<%@ include file="./includes/footer.jsp" %> 
    </body>
</html>