<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>상세화면</title> 
	<style type="text/css">
	a {
	text-decoration: none;
	}
	a:hover {
	text-decoration-line: none;
	}
	</style>
    </head>
    <body> 
    <%@ include file="../includes/title.jsp" %>
        
        <!-- Product section--> 
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" 
                    						src="/resources/shop/cdimg/<c:out value="${audiodrama.auArt }"/>" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">AUDIOID-CD<c:out value="${audiodrama.auId }"/></div>
                        <h1 class="display-5 fw-bolder"><c:out value="${audiodrama.auTitle }"/></h1>
                        <div class="fs-5 mb-5">
                            <span class="text-decoration-line-through"><fmt:formatNumber value="${audiodrama.auPrice}" pattern="#,###"/>원</span>
                            <span><fmt:formatNumber value="${audiodrama.auPrice}" pattern="#,###"/>원</span>
                        </div>
                        <table>
                        	<tr>
                        		<th><p class="lead ">원작자</p></th>
                        		<td><p class="lead"><c:out value="${audiodrama.auWriter }"/></p></td>
                        	</tr>
                        	<tr>
                        		<th><p class="lead">장르</p></th>
                        		<td><p class="lead"><c:out value="${audiodrama.auGenre }"/></p></td>
                        	</tr>
                        	<tr>
                        		<th><p class="lead">재고 수</p></th>
                        		<td><p class="lead"><c:out value="${audiodrama.auQuantity }"/></p></td>
                        	</tr>
                        	<tr>
                        		<th><p class="lead">원가</p></th>
                        		<td><p class="lead"><fmt:formatNumber value="${audiodrama.auPrice}" pattern="#,###"/>원</p></td>
                        	</tr>
                        </table> 
                        
                        <div class="d-flex"> 
                        <!-- 
                            <input class="form-control text-center me-3" id="auCount" type="text" value="1" style="max-width: 3rem" /> 
                             -->
                            					
							<div class="button_quantity">
								주문수량
								<input type="text" class="quantity_input" value="1">
								<span>
									<button class="plus_btn">+</button>
									<button class="minus_btn">-</button>
								</span>
							</div>
						
                            <input class="form-control" name="username" id="username" type="hidden" 
                                                        	value="<sec:authentication property="principal.username"/>" />
                            <button class="btn btn-outline-dark flex-shrink-0 btn_cart" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                장바구니에 담기
                            </button> 
                        </div>  
                        
                        <%-- 
                        <div class="d-flex"> 
                        <form action="/cart/add" method="post">
                            <input class="form-control text-center me-3" id="auCount" type="text" value="1" style="max-width: 3rem" /> 
                            <input class="form-control" name="username" id="username" type="hidden" placeholder="아이디"
                                                        	value="<sec:authentication property="principal.username"/>" />
                            <input class="form-control" name="username" id="username" type="hidden" placeholder="아이디"
                                                        	value="${audiodrama.auId }" />
                            <button class="btn btn-outline-dark flex-shrink-0 btn_cart" type="submit">
                                <i class="bi-cart-fill me-1"></i>
                                장바구니에 담기
                            </button> </form>
                        </div>
 --%>


<script type="text/javascript">
$(document).ready(function() {   
	 
			 
	// 수량 버튼 조작
	let quantity = $(".quantity_input").val();
	
	$(".plus_btn").on("click", function(){
		$(".quantity_input").val(++quantity);
			});
	$(".minus_btn").on("click", function(){
		if(quantity > 1){
				$(".quantity_input").val(--quantity);
		}
	});

	//장바구니 담기 
	var auCountval = quantity;
	var usernameval = $("#username").val();  
	
	const form = {
		username : usernameval,
		auId : '${audiodrama.auId}',
		auCount : auCountval
	}
	
	//장바구니 추가 버튼
	$(".btn_cart").on("click", function(e){  
		
		console.log("form: ", form); 
		
 
		//장바구니 추가
		$.ajax({
			url: '/cart/add',
			type : "post",
			data: form,
			//dataType: 'json',
			//processData : false,
			//contentType : false,
			success: function(result){ 
				if(result == '0'){
					alert("장바구니에 추가를 하지 못하였습니다.");
				} else if(result == '1'){
					alert("장바구니에 추가되었습니다.");
				} else if(result == '2'){
					alert("장바구니에 이미 추가되어져 있습니다.");
				}   
			}
		})	 
	});
 
	
	
});
</script>
                        
                        <div class="d-flex">
                        <sec:authentication property="principal" var="pinfo"/> 
						<sec:authorize access="isAuthenticated()">
							<c:if test="${pinfo.member.grade >= 9}">  	
	                        	<a href="/audio/modify?auId=<c:out value="${audiodrama.auId }"/>" class="btn btn-warning p-5">수정</a>
							</c:if>
						</sec:authorize> 
                        </div> 
						
                    </div> 
                </div>
                <div class="row gx-4 gx-lg-5 align-items-center">상세 설명
                	<div class="col-md-6 m-5"> 
                		<c:out value="${audiodrama.auContent }"/>
                	</div>
                </div>
                <!-- 상품 문의 -->
                <div class="row gx-4 gx-lg-5 align-items-center">문의글
                	
                </div>
                <!-- 상품 리뷰 -->
                <div class="row gx-4 gx-lg-5 align-items-center">리뷰글
                	
                </div>
            </div>
        </section> 
        
        
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">다른 상품 구경하기</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                     
        			<c:forEach var="audios" items="${list }" >
                    <div class="col mb-5">
                        <div class="card h-100">
                        	<a href='/audio/get?auId=<c:out value="${audios.auId }"/>'>
                            <!-- Product image
                            <img class="card-img-top" src="/resources/shop/cdimg/<c:out value="${audios.auArt }"/>" alt="..." />-->
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><c:out value="${audios.auTitle }"/></h5>
                                    <!-- Product price-->
                                    <fmt:formatNumber value="${audios.auPrice}" pattern="#,###"/>원
                                </div>
                            </div>
                            </a>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">
                                	<i class="bi-cart-fill me-1"></i>담기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                     
                </div>
            </div>
        </section> 
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/shopDetail/js/scripts.js"></script>
    </body>

<%@ include file="../includes/footer.jsp" %>
</html>
