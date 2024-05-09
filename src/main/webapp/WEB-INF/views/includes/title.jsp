<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오디오드라마 CD몰 오로라</title>
</head>
<body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/">오로라</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/audio/list">메인화면</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">회사소개</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">시리즈물</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">신작</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">단편</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">BL</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">로맨스</a></li> 
                        <li class="nav-item"><a class="nav-link" href="#!">판타지</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">무협</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">GL</a></li> 
                    </ul>
                    
                    <div class="d-flex">
						<sec:authentication property="principal" var="pinfo2"/>  
						<sec:authorize access="isAuthenticated()">
	                    	<c:if test="${pinfo2.member.grade >= 9}">  	 
	                    		<a class="btn btn-dark" href="/admin/index">관리자 전용</a>
							</c:if>
						
                    	<a class="btn btn-outline-dark movecart"
                    	 href='/cart/cart2?username=<c:out value="${pinfo2.member.username }"/>'>
                            <i class="bi-cart-fill me-1"></i>
                            카트
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </a>  
                        <!-- 
						<form action="cart/cart2" method="post" id="cartForm">
						<button class="btn btn-outline-dark moveCart" type="button">
							<i class="bi-cart-fill me-1"></i>
                            카트
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span></button>
						</form>  -->
						</sec:authorize>
						
                    </div>
                </div>
            </div>
        </nav>
<script type="text/javascript">

$(document).ready(function() {
	var cartForm = $("#cartForm"); 
	$(".moveCart").on("click",function(e){ 
		e.preventDefault(); 
		cartForm.append("<input type='hidden' name='username' value='"+ $(this).attr("href") + "'>");
		cartForm.attr("action","/cart/cart2");
		cartForm.submit();
	});
});
</script> 

</body>
</html>