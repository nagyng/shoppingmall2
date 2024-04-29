<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>오로라</title> 
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" /> 
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
<!-- 
<sec:authentication property="principal" var="pinfo"/>  -->

        <!-- Basic Header -->
        <nav class="bg-light bg-gradient">
            <div class="container px-4 px-sm-5">
            	<div class="headerDiv" id="">
                    <ul class="nav justify-content-end">
                        <li class="nav-item"><a class="nav-link" href="/event/list">이벤트 공지사항</a></li>
                        <li class="nav-item"><a class="nav-link" href="/qna/list">문의게시판</a></li>
                         
                        <sec:authorize access="isAnonymous()">
                        <li class="nav-item"><a class="nav-link" href="/member/login">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="/member/register">회원가입</a></li>  
                        </sec:authorize>
                         
						<sec:authorize access="isAuthenticated()">
                        <li class="nav-item">  
                        	<a class="nav-link" href="/member/logout">로그아웃</a>  <%-- 
							<form role="form" id="Logoutform" method='post' action="/member/logout">
								<fieldset>  
									<a href="/member/login" class="btn-logout">로그아웃</a>
								</fieldset>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							</form>  --%>
                        </li> 
                        <li class="nav-item"> 
                        	<a class="nav-link" href='/member/modify'>정보수정</a>
                        </li>
                        </sec:authorize> 
                        
                        <li class="nav-item"><a class="nav-link" href="#!">장바구니</a></li>
                        <li class="nav-item"><a class="nav-link" href="/member/index">마이페이지</a></li> 
                    </ul> 
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                </div>
            </div>
        </nav>



<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">


$(".move").on("click",function(e){ 
	var actionForm = $("#actionForm");
	e.preventDefault(); 
	actionForm.append("<input type='hidden' name='username' value='"+ $(this).attr("href") + "'>");
	actionForm.attr("action","/member/modify");
	actionForm.submit();
});

$(".btn-logout").on("click", function(e){  
	e.preventDefault();
	$(".Logoutform").submit(); 
}); 

</script>


 
</body>
</html>