<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login - SB Admin</title>
        <link href="/resources/admin/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-light">
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/title.jsp" %>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">로그아웃</h3></div>
                                    <div class="card-body">  
									<form role="form" method='post' action="/member/logout">
										<fieldset>  
											<a href="/login" class="btn btn-lg btn-success btn-block btn-logout">로그아웃</a>
										</fieldset>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									</form> 
                                	</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div> 
        </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/resources/admin/js/scripts.js"></script> 

	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script> 
	$(".btn-success").on("click", function(e){ 
		e.preventDefault();
		$("form").submit(); 
	}); 
	</script> 
		
<%@ include file="../includes/footer.jsp" %>
</body>
</html>
