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
        <title>modify</title>
        <link href="/resources/admin/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-light">
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/title.jsp" %>
	<sec:authentication property="principal" var="pinfo"/>
		<sec:authorize access="isAuthenticated()">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">회원정보 수정</h3></div>
                                    <div class="card-body">
                                        <form role="form" action="/member/modify" method="post" id="formObj">
                                        
                                            <div class="row mb-3"> 
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="username" id="username" type="text" placeholder="아이디"
                                                        	value="<sec:authentication property="principal.username"/>" />
                                                        <label for="inputFirstName">아이디</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" name="name" id="name" type="text" placeholder="이름"
                                                        	value="<sec:authentication property="principal.member.name"/>" />
                                                        <label for="inputLastName">이름</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="email" id="email" type="email" placeholder="name@example.com"
                                                        	value="<sec:authentication property="principal.member.email"/>" />
                                                <label for="inputEmail">이메일</label>
                                            </div> 
                                            
                                            <div class="row mb-3"> 
                                                <div class="col-md-6"> <!-- 
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="password0" id="password0"
                                                         type="password" placeholder="기존 비밀번호" />
                                                        <label for="inputpasswordConfirm">기존 비밀번호</label>
                                                    </div> -->
                                                </div> 
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="password" id="password" 
                                                         type="password" placeholder="새 비밀번호" />
                                                        <label for="inputpasswordConfirm">새 비밀번호</label>
                                                    </div>
                                                </div>
                                            </div> 
                                            <div class="row mb-3"> <%-- 
                                                <div class="col-md-6">
                                                <div class="input-group mb-3">
												  <label class="input-group-text" for="age">나이</label>
												  <select class="form-select" id="age" name="age">
												    <option selected>=...</option>
												    <option value="1">One</option>
												    <option value="2">Two</option>
												    <option value="3">Three</option>
												  </select>
												</div> 
                                                 </div>  --%>
                                                <div class="col-md-6">  <%-- 
														<input name="flexRadioDefault gender" id="flexRadioDefault1 gender" type="radio" value="11"
															<c:if test="${principal.member.gender == 11}"> <c:out value="checked" /> </c:if> 
														>
														<label>남</label> 
														<input name="flexRadioDefault gender" id="flexRadioDefault1 gender" type="radio" value="12"
															<c:if test="${principal.member.gender == 12}"> <c:out value="checked" /> </c:if> 
														>
														<label>여</label>   --%>
                                                 </div>  
                                            </div> 
  
                                            
                                            <div class="mt-4 mb-0"><div class="d-grid">
                                            <div class="btn-group" role="group" aria-label="Basic mixed styles example"> 
                                            	<button type="button" class="btn btn-primary btn-block" 
                                            	onclick="checkValue();">정보2</button> 
                                                
                                                <button type="button" class="btn btn-success btn-block"
                                                href='<sec:authentication property="principal.username"/>' 
                                                class="move2">정보수정</button> 
												
												<button data-oper='reset' type="reset" class="btn btn-warning">취소</button> 
												<button data-oper='remove' class="btn btn-danger">회원탈퇴</button>  
                                            </div>
											</div></div> 
                                            
                            			<input type="hidden" name="mmId" value="<sec:authentication property="principal.member.mmId"/>" >
                            			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                        </form>
                                    </div> 
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div> 
        </div>
        </sec:authorize>
        

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/resources/admin/js/scripts.js"></script> 
<%@ include file="../includes/footer.jsp" %>
 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">  
$(".move2").on("click",function(e){ 
	var actionForm = $("#actionForm2");
	e.preventDefault(); 
	actionForm.append("<input type='hidden' name='username' value='"+ $(this).attr("href") + "'>");
	actionForm.attr("action","/member/modify");
	actionForm.submit();
});
</script>  
<script>
/* 생일을 달력에서 찍기 */
$(document).ready(function(){
		$("#birthday").datepicker({
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
		
		
		
/* 유효성 검사 */

		var formObj = $("form[role='form']"); 
		
		$('button').on("click", function(e){ 
			e.preventDefault(); 
			var operation = $(this).data("oper"); 
			console.log(operation); 
			
			if(operation === 'remove'){		//삭제 버튼 클릭 처리 
				formObj.attr("action", "/member/remove"); 
			}
			
			else if (operation === 'modify'){ 
				console.log("수정 버튼클릭 "); 
				var str="";   
				formObj.append(str).submit(); 
			}  
			
			if (operation === 'reset'){
				$("#formObj")[0].reset();
                return false;
			}
			
			formObj.submit();  
			
			 
		});

		var csrfParameterName = "${_csrf.parameterName}";
		var csrfTokenValue = "${_csrf.token}";
		var password0 = '<sec:authentication property="principal.member.password"/>';

 
		 
		checkValue = function(){ 
            var username = $("#username").val(); 
            var ps0 = $("#password").val();
            var ps1 = $("#password").val();
            
            if(!username){
				alert("아이디는 필수 입력 사항입니다.");
				return false;
			}
            
			if(!ps0){
				alert("비밀번호는 필수 입력 사항입니다.");
				return false;
			}
			
			if(!ps1){
				alert("비밀번호는 필수 입력 사항입니다.");
				return false;
			}/* 
            
			if(ps0 != password0){
				alert("비밀번호가 다릅니다.");
				return false;
			} */
			 
		}	 		
		
		
		
	});
</script>
<!-- 카카오 우편번호 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function postSearch() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("address2").value = extraAddr;
                
                } else {
                    document.getElementById("address2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("zipcode").focus();
            }
        }).open();
    }
</script> 




</body>
</html>
