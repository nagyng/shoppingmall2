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
        <title>로그인 화면</title>
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">로그인</h3></div>
                                    <div class="card-body">
                                        <form role="form" action="/login" method="post">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="username" id="username" type="text" placeholder="아이디를 입력하세요." autofocus/>
                                                <label for="inputusername">아이디</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="password" id="password" type="password" placeholder="비밀번호를 입력하세요." />
                                                <label for="inputpassword">비밀번호</label>
                                            </div>
                                            <div class="form-check mb-3">
                                                <input class="form-check-input" id="inputRememberpassword" name="remember-me" type="checkbox" value="Remember Me" />
                                                <label class="form-check-label" for="inputRememberpassword">비밀번호 기억하기</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="password">비밀번호를 잊으셨나요?</a>
                                                <a class="btn btn-primary" href="index">로그인하기</a>
                                            </div>
                            			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="register">계정이 없으신가요? 가입하세요!</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/admin/js/scripts.js"></script> 
		<!-- 버튼클릭 처리 -->
		<script src="http://code.jquery.com/jquery-latest.js"></script> 
		<script type="text/javascript">
			$(document).ready(function(){ 
				$(".btn-primary").on("click",function(e){ 
					e.preventDefault(); 
					$("form").submit();
					 
					/* 
				    var msg = "<c:out value='${error}'/>";  
				    if(msg != null) {
					    alert(msg); 
				    } 
				     */
				});
			});
		</script> 
		
    </body>
</html>
