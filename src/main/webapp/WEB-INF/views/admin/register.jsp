<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./includes/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" /> 
    </head>
    <body class="sb-nav-fixed">

    <div id="layoutSidenav_content">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">회원가입</h3></div>
                                    <div class="card-body">
                                        <form role="form" action="/admin/register" method="post" name="frm">
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
                                                
                                            <div class="row mb-3">
					                            <div class="dropdown">
												  <a class="btn btn-light dropdown-toggle mb-3 mb-md-0" 
												  	name="authLabel" id="authLabel" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
												    접근 권한 부여
												  </a> 
												  <ul class="dropdown-menu" id="authUL" name="authUL" role="menu" >
					                                <li><a class="dropdown-item" href="#!" value="ROLE_USER">일반회원</a></li>
					                                <li><a class="dropdown-item" href="#!" value="ROLE_MANAGER">매니저</a></li>
					                                <li><a class="dropdown-item" href="#!" value="ROLE_ADMIN">관리자</a></li> 
												  </ul>
												</div>  
												<input type="hidden" id="auth" name="auth" value="">
												<script>
												$('#authUL li > a').on('click', function() {
												    // 버튼에 선택된 항목 텍스트 넣기 
												    $('#authLabel').text($(this).text());  
												});
												
												//드롭다운 값 선택 시 hidden 에 값 넣기 
												$(function () { 
												    function send() {
												        var auGenre = $('#auth').val();
												    } 
												    $('#authUL li > a').on('click', function () {
												        $('#authLabel').text($(this).text());
												        var auGenre = $(this).attr('value');
												        console.log('선택된 권한: ' + auGenre);
			
												        $('#auth').val(auGenre);
												    });    
												});
												</script>
                                            </div>
									 
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid">
                                                	<button type="button" class="btn btn-secondary btn-block" onclick="checkValue();">등록</button> 
												</div>
                                            </div>
                                        </form>
                                    </div> 
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div> 
      </div>
<%@ include file="./includes/footer.jsp" %>
</div>
</body>

<script type="text/javascript">
$(document).ready(function() {   

	var formObj = $("form[role='form']"); 
	
	$("button[type='submit']").on("click", function(e) { 		//submit 버튼 클릭했을 때 
		e.preventDefault(); 
		var str=""; 
		formObj.append(str).submit(); 
	});
	 
	var csrfParameterName = "${_csrf.parameterName}";
	var csrfTokenValue = "${_csrf.token}";
	


		checkValue = function(){ 
            var username = $("#username").val(); 
            var ps1 = $("#password").val();
            var ps2 = $("#password2").val();
            
            if(!username){
				alert("아이디는 필수 입력 사항입니다.");
				return false;
			}
			
			if(!ps1){
				alert("비밀번호는 필수 입력 사항입니다.");
				return false;
			}
			
			if(ps1 != ps2){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			 
			
			frm.submit();
		}		
		
	});
</script> 
</html>
