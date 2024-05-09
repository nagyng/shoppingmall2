<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/title.jsp" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>마이페이지 메인</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/resources/member/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/member/css/styles.css" rel="stylesheet" />
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
    
    
	<sec:authentication property="principal" var="pinfo"/>
		<sec:authorize access="isAuthenticated()">
    
    
        
        <!-- Header-->
        <header class="py-5">
            <div class="container px-lg-5">
                <div class="p-4 p-lg-5 bg-light rounded-3 text-center">
                    <div class="m-4 m-lg-5">
                        <h1 class="display-5 fw-bold">
                        	<span style="color: salmon;"><sec:authentication property="principal.member.name"/></span>
                        	님의 MYPAGE</h1> 
                        <table class="d-flex justify-content-center">
                        	<tr> 
                        		<th>아이디</th>
                        		<td><sec:authentication property="principal.username"/></td>
                        	</tr>
                        	<tr>
                        		<th>이메일</th>
                        		<td><sec:authentication property="principal.member.email"/></td>
                        	</tr> 
                        	<tr>
                        		<th>포인트</th>
                        		<td><fmt:formatNumber value="${pinfo.member.point}" pattern="#,###"/></td>
                        	</tr> 
                        	<tr>
                        		<th>충전 금액</th>
                        		<td><fmt:formatNumber value="${pinfo.member.money}" pattern="#,###"/>원</td>
                        	</tr> 
                        </table>  <%--
                        <form action="/member/modify" method="get" id="actionForm"> 
                        	<a class="btn btn-primary btn-lg move" 
                        		href='<sec:authentication property="principal.member.username"/>'>정보 수정</a>  
                        </form> 
                        	<a class="btn btn-outline-warning btn-lg" href='/member/modify'>내 정보 수정</a> --%>
                    </div>
                </div>
            </div>
        </header>
        <!-- Page Content-->
        <section class="pt-4">
            <div class="container px-lg-5">
                <!-- Page Features-->
                <div class="row gx-lg-5">
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-warning bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-collection"></i></div>
                                <a href="#"><h2 class="fs-4 fw-bold">주문 내역</h2></a> 
                                <p class="mb-0">With Bootstrap 5, we've created a fresh new layout for this template!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-warning bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-cloud-download"></i></div>
                                <a href="#"><h2 class="fs-4 fw-bold">적립금 내역</h2></a>
                                <p class="mb-0">As always, Start Bootstrap has a powerful collectin of free templates.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-warning bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-card-heading"></i></div>
                                <a href="#"><h2 class="fs-4 fw-bold">내 리뷰 보기</h2></a>
                                <p class="mb-0">The heroic part of this template is the jumbotron hero header!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-warning bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-bootstrap"></i></div>
                                <a href="#"><h2 class="fs-4 fw-bold">1:1 문의</h2></a>
                                <p class="mb-0">We've created some custom feature boxes using Bootstrap icons!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-warning bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-code"></i></div> 
			                        <form action="/member/modify" method="get" id="actionForm"> 
			                        	<a class="move" href='<sec:authentication property="principal.member.username"/>'><h2 class="fs-4 fw-bold">회원정보변경</h2></a>  
			                        </form>
                                	<!-- <a href="#"><h2 class="fs-4 fw-bold">회원정보변경</h2></a> -->
                                <p class="mb-0">We keep our dependencies up to date and squash bugs as they come!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-warning bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-patch-check"></i></div>
                                <a href="#"><h2 class="fs-4 fw-bold">회원정보탈퇴신청</h2></a>
                                <p class="mb-0">Start Bootstrap has been the leader in free Bootstrap templates since 2013!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
		</sec:authorize>
		
        
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/member/js/scripts.js"></script>
    </body>
    

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript"> 

$(".move").on("click",function(e){ 
	var actionForm = $("#actionForm");
	e.preventDefault(); 
	actionForm.append("<input type='hidden' name='username' value='"+ $(this).attr("href") + "'>");
	actionForm.attr("action","/member/modify");
	actionForm.submit();
});

</script>
</html>
