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
        <title>Register - SB Admin</title>
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
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">회원가입</h3></div>
                                    <div class="card-body">
                                        <form role="form" action="/member/register" method="post">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="username" id="username" type="text" placeholder="아이디" required/>
                                                        <label for="inputFirstName">아이디</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" name="name" id="name" type="text" placeholder="이름" required/>
                                                        <label for="inputLastName">이름</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="email" id="email" type="email" placeholder="name@example.com" required/>
                                                <label for="inputEmail">이메일</label>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="password" id="password" type="password" placeholder="비밀번호" required/>
                                                        <label for="inputUserPw">비밀번호</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="password2" id="password2" type="password" placeholder="비밀번호 확인" required/>
                                                        <label for="inputPasswordConfirm">비밀번호 확인</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid">
                                                	<button type="submit" class="btn btn-primary btn-block">가입하기</button>
													<button type="reset" class="btn btn-outline-danger"> 취소 </button>
												</div>
                                            </div>
                            			<input type="hidden" name="auth" id="auth" value="ROLE_USER">
                            			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="login">계정이 이미 있으신가요? 로그인하기</a></div>
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
    </body>

 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {   

	var formObj = $("form[role='form']"); 
	$("button[type='submit']").on("click", function(e) { 
		e.preventDefault(); 
		var str=""; 
		formObj.append(str).submit(); 
	});
	 
	var csrfParameterName = "${_csrf.parameterName}";
	var csrfTokenValue = "${_csrf.token}";
	
	
});


</script>
<script>
	$(document).ready(function(){ 
		checkValue = function(){ 
            var ph = $("#phone").val(); 
            if(!$("#username").val()){
				alert("아이디는 필수 입력 사항입니다.");
				return false;
			}
			
			if(!$("#password").val()){
				alert("비밀번호는 필수 입력 사항입니다.");
				return false;
			}
			
			if(!$("#password2").equals($("#password2"))){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			 
			
			form.submit();
		}		
		
	});
</script> 
<%@ include file="../includes/footer.jsp" %>
</html>