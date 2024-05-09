<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자 페이지</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="/resources/admin/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/">오로라</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0"		id="NavbarSearchForm" method="get" action="/admin/index">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="검색..." aria-label="Search for..." aria-describedby="btnNavbarSearch" 
                    		id="keyword" name="keyword" 	value='<c:out value="${pageMaker.cri.keyword}"/>' />
		            <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
		            <input type="hidden" name="amount" 	value='<c:out value="${pageMaker.cri.amount}"/>' />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>

        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="index">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Layouts
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.html">Static Navigation</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Pages
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="/member/login">Login</a>
                                            <a class="nav-link" href="/member/register">Register</a>
                                            <a class="nav-link" href="/member/password">Forgot Password</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401">401 Page</a>
                                            <a class="nav-link" href="404">404 Page</a>
                                            <a class="nav-link" href="500">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Tables</div><!-- 
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="charts">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                            <a class="nav-link" href="tables">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
                            </a> -->
                            <a class="nav-link" href="audiotables">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                상품 목록
                            </a>
                            <a class="nav-link" href="membertables">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                회원 목록
                            </a>
                            <a class="nav-link" href="ordertables">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                주문 목록
                            </a>
                            
                            <div class="sb-sidenav-menu-heading">Charts</div>
                            <a class="nav-link" href="audiocharts">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                상품 통계
                            </a>
                            <a class="nav-link" href="membercharts">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                회원 통계
                            </a>
                            <a class="nav-link" href="ordercharts">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                주문 통계
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        <sec:authentication property="principal.username"/>
                    </div>
                </nav>
            </div> 
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


var NavbarSearchForm = $("#NavbarSearchForm");

$("#NavbarSearchForm button").on("click", function(e){ 

	if(!NavbarSearchForm.find("input[name='keyword']").val()){
		alert("키워드를 입력하세요.");
		return false;
	}
	
	//검색 후에 1페이지로 이동
	NavbarSearchForm.find("input[name='pageNum']").val("1");
	e.preventDefault();
	
	//검색에서 입력받은 데이터를 서버로 전송
	NavbarSearchForm.submit();
	
});


});



</script>

</html>