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
            
            <form role="form" name="form" method="post" enctype="multipart/form-data" action="/audio/insert" >  
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <div class="row gx-4 gx-lg-5 align-items-center"> 
                    <div class="col-md-6">
                    	<p class="lead text-center">이미지 미리보기</p>
						<img id="preview" style="max-width:300; max-height:300;"/>
					</div> 
					
                    <div class="col-md-6"> 
                        <div class="small mb-1">AUDIOID-CD </div>
                        <div class="display-5 fw-bolder input-group-lg">
                        	<input type="text" class="form-control" 
                        			name="auTitle" id="auTitle" 
                        			placeholder="상품 이름을 입력">
                        </div>
                        <div class="fs-5 mb-5">
                            <span class="text-decoration-line-through"></span>
                            <span></span> 
                        </div>
                        <table> 
                        	<tr>
                        		<th><p class="lead">대표이미지</p></th>
                        		<td><p class="lead"> 
                        			<input type="file" name="uploadFile" id="uploadFile" onchange="readURL(this);" accept=".png, .jpeg, .jpg"> 
                        			</p>
	                        		<script> 
	                        		function readURL(input) {
	                        			  if (input.files && input.files[0]) {
	                        			    var reader = new FileReader();
	                        			    reader.onload = function(e) {
	                        			      document.getElementById('preview').src = e.target.result;
	                        			    };
	                        			    reader.readAsDataURL(input.files[0]);
	                        			  } else {
	                        			    document.getElementById('preview').src = "";
	                        			  }
	                        			}
	                        		</script>
                        		</td> 
                        	</tr>
                        	<tr>
                        		<th><p class="lead">장르</p></th>
                        		<td><p class="lead">  
		                            <div class="dropdown">
									  <a class="btn btn-warning dropdown-toggle" name="auGenreLabel" id="auGenreLabel" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
									    장르 구분
									  </a> 
									  <ul class="dropdown-menu" id="auGenreUL" name="" role="menu">
		                                <li><a class="dropdown-item" href="#!" value="103">BL</a></li>
		                                <li><a class="dropdown-item" href="#!" value="104">로맨스</a></li>
		                                <li><a class="dropdown-item" href="#!" value="105">판타지</a></li>
		                                <li><a class="dropdown-item" href="#!" value="106">무협</a></li>
		                                <li><a class="dropdown-item" href="#!" value="107">GL</a></li> 
									  </ul>
									</div>  
									<input type="hidden" id="auGenre" name="auGenre" value="">
									<script>
									$('#auGenreUL li > a').on('click', function() {
									    // 버튼에 선택된 항목 텍스트 넣기 
									    $('#auGenreLabel').text($(this).text());  
									});
									
									//드롭다운 값 선택 시 hidden 에 값 넣기 
									$(function () { 
									    function send() {
									        var auGenre = $('#auGenre').val();
									    } 
									    $('#auGenreUL li > a').on('click', function () {
									        $('#auGenreLabel').text($(this).text());
									        var auGenre = $(this).attr('value');
									        console.log('선택된 장르: ' + auGenre);

									        $('#auGenre').val(auGenre);
									    });    
									});
									</script>
                        		</p></td> 
                        	</tr>
                        	<tr>
                        		<th><p class="lead">상태</p></th>
                        		<td><p class="lead">  
		                            <div class="dropdown">
									  <a class="btn btn-warning dropdown-toggle" name="auStatusLabel" id="auStatusLabel" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
									    판매 상태
									  </a> 
									  <ul class="dropdown-menu" id="auStatusUL" role="menu">
		                                <li><a class="dropdown-item" href="#!" value="16">정상 판매</a></li>
		                                <li><a class="dropdown-item" href="#!" value="15">SOLD OUT</a></li> 
									  </ul>
									</div>  
									<input type="hidden" id="auStatus" name="auStatus" value="">
									<script>
									$('#auStatusUL li > a').on('click', function() {
									    // 버튼에 선택된 항목 텍스트 넣기 
									    $('#auStatusLabel').text($(this).text());  
									});
									
									//드롭다운 값 선택 시 hidden 에 값 넣기 
									$(function () { 
									    function send() {
									        var auStatus = $('#auStatus').val();
									    } 
									    $('#auStatusUL li > a').on('click', function () {
									        $('#auStatusLabel').text($(this).text());
									        var auStatus = $(this).attr('value');
									        console.log('선택된 상태: ' + auStatus);

									        $('#auStatus').val(auStatus);
									    });    
									});
									</script>
                        		</p></td> 
                        	</tr>
                        	<tr>
                        		<th><p class="lead">구분</p></th>
                        		<td><p class="lead">  
		                           <div class="form-check">
									  <input class="form-check-input" type="radio" name="auCode1" id="auCode1" value="101" checked>
									  <label class="form-check-label" for="flexRadioDefault1">
									    단편
									  </label>
									</div>
									<div class="form-check">
									  <input class="form-check-input" type="radio" name="auCode1" id="auCode1" value="102">
									  <label class="form-check-label" for="flexRadioDefault2">
									    시리즈물
									  </label>
									</div>
									
                        		</p></td> 
                        	</tr>
                        	<tr>
                        		<th><p class="lead">종류</p></th>
                        		<td><p class="lead">  
		                           <div class="form-check">
									  <input class="form-check-input" type="radio" name="auCode2" id="auCode2" value="13" checked>
									  <label class="form-check-label" for="flexRadioDefault1">
									    예약판
									  </label>
									</div>
									<div class="form-check">
									  <input class="form-check-input" type="radio" name="auCode2" id="auCode2" value="14">
									  <label class="form-check-label" for="flexRadioDefault2">
									    일반판
									  </label>
									</div>
                        		</p></td> 
                        	</tr>
                        	<tr> 
                        	</tr>
                        	<tr>
                        		<th><p class="lead ">원작자</p></th>
                        		<td><p class="lead"><input type="text" name="auWriter" id="auWriter" placeholder="작가를 입력"></p></td>
                        	</tr>
                        	<tr>
                        		<th><p class="lead ">제작사</p></th>
                        		<td><p class="lead"><input type="text" name="auCompany" id="auCompany" placeholder="제작사를 입력"></p></td>
                        	</tr>
                        	<tr>
                        		<th><p class="lead">재고 수</p></th>
                        		<td><p class="lead"><input type="text" name="auQuantity" id="auQuantity" placeholder="재고 수를 입력" required></p></td>
                        	</tr>
                        	<tr>
                        		<th><p class="lead">기존가</p></th>
                        		<td><p class="lead"><input type="text" name="auPrice" id="auPrice" placeholder="기존가를 입력" required>원</p></td>
                        	</tr> 
                        </table>
                        
                        <div class="d-flex"> 
                            <button class="btn btn-lg btn-outline-dark flex-shrink-0 mt-5" type="button" onclick="checkValue();"> 
                            	<!-- i 아이콘 -->
                                새 상품 등록
                            </button>
                        </div>
                        
                    </div> 
                </div>
                <div class="row gx-4 gx-lg-5 align-items-center">
                	<div class="col-md-6 m-5"> 
	                	<div class="form-floating">
						  <textarea class="form-control" placeholder="Leave a comment here" 
						  			 name="auContent" id="auContent" style="height: 100px;"></textarea>
						  <label for="floatingTextarea2">상품 설명을 입력하세요.</label>
						</div> 
                	</div>
                </div> 
                
            </form>
            </div>
        </section> 
    </body>
<%@ include file="../includes/footer.jsp" %>





<script type="text/javascript">

$(document).ready(function() {

	var formObj = $("form[role='form']"); 
	
	$("button[type='button']").on("click", function(e) { 
		e.prDefault(); 
		var str=""; 
		$(".uploadResult ul li").each(function(i, obj){ 
			var jobj = $(obj); 
			str += "<input type='hidden' name='attachList[" + i + "].fileName' 		value='" + jobj.data("filename") + "'>";
			str += "<input type='hidden' name='attachList[" + i + "].uuid' 			value='" + jobj.data("uuid") + "'>";
			str += "<input type='hidden' name='attachList[" + i + "].uploadPath' 	value='" + jobj.data("path") + "'>";
			str += "<input type='hidden' name='attachList[" + i + "].fileType' 		value='" + jobj.data("type") + "'>"; 
		});
		
		formObj.append(str).submit(); 
		
	});

	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5 * 1024 * 1024

	function checkExtension(fileName, fileSize) {

		if (fileSize >= maxSize) {
			alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.");
			return false;
		}

		if (regex.test(fileName)) {
			alert("해당 파일은 업로드할 수 없습니다.");
			return false;
		}

		return true;
	}

	 
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$("input[type='file']").change(function(e) {

		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;

		for (var i = 0; i < files.length; i++) {

			if (!checkExtension(files[i].name, files[i].size)) {
				return false;
			}

			formData.append("uploadFile", files[i]);
		}

		$.ajax({
			url : "/uploadAjaxAction",
			type : "post", 
			dataType : "json", 
			processData : false,
			contentType : false,  
			beforeSend	: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			}, 
			data : formData,
			success : function(result) {
				showUploadResult(result);
			}
		});	 
	});		 
	
	

	$(".uploadResult").on("click","button",function(e){ 
		var targetFile = $(this).data("file"); 
		var type = $(this).data("type");
		
		$.ajax({
			url: "/deleteFile",
			type: "post", 
			data: {fileName: targetFile, type: type},
			dataType: "text",
			beforeSend	: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success: function(result){
				alert(result);
			}
		}); 
		 
		var deleteLi = $(this).closest("li");
		deleteLi.remove(); 
	});	 
	
	

	/*  유효성 검사 */
		checkValue = function(){ 
		
	        var auTitle = $("#auTitle").val();   
	        var auArt = $("#auArt").val();
	        var auGenre = $("#auGenre").val();
	        var auStatus = $("#auStatus").val();   
	        
	        var auCode1 = $("input[name=auCode1]").is(":checked");
	        var auCode2 = $("input[name=auCode2]").is(":checked");  
	        
	        var auWriter = $("#auWriter").val(); 
	        var auCompany = $("#auCompany").val();
	        var auQuantity = $("#auQuantity").val();
	        var auPrice = $("#auPrice").val();
	        var auContent = $("#auContent").val();
	        
	        
	        if(!auTitle){
				alert("상품 이름을 기입하세요.");
				return false;
			} /* 
			if(!auArt){
				alert("대표이미지를 선택하세요.");	//
				return false;
			} 
			if(!auGenre){
				alert("상품의 장르를 선택하세요.");	 
				return false;
			}
	        if(!auStatus){ 
	            alert('상태를 선택하세요.');		 
	            return false;
	        } */
	        if(!auCode1){
				alert("구분 사항을 선택하세요.");	//
				return false;
			}
	        if(!auCode2){
				alert("종류 사항을 선택하세요.");	//
				return false;
			}
	        if(!auWriter){
				alert("작가를 입력하세요.");
				return false;
			}
	        if(!auCompany){
				alert("제작사를 입력하세요.");
				return false;
			}
	        if(!auQuantity){
				alert("재고 수를 입력하세요.");
				return false;
			}
	        if(!auPrice){
				alert("기존가를 입력하세요.");
				return false;
			}
	        if(!auContent){
				alert("상품 설명을 입력하세요.");
				return false;
			}
			 
			
			formObj.submit();
		}
		
	
	
	
	
	
}); 
 
var uploadResult = $(".uploadResult ul"); 
function showUploadResult(uploadResultArr) { 
	if (!uploadResultArr || uploadResultArr.length == 0) {
		return;
	} 
	var str = "";

	$(uploadResultArr).each(
					function(i, obj) { 
						if (!obj.image) { 
							var fileCallPath = encodeURIComponent(obj.uploadPath
									+ "/"
									+ obj.uuid
									+ "_"
									+ obj.fileName);

							str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>"; 
							str += "<span>" + obj.fileName + "</span>";
							str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
							str += "<img src='/resources/img/attach.png'>";
							str += "</div></li>";
							 
						} else { 
							var fileCallPath = encodeURIComponent(obj.uploadPath
									+ "/s_"
									+ obj.uuid
									+ "_"
									+ obj.fileName);

							var originPath = obj.uploadPath + "\\"
									+ obj.uuid + "_" + obj.fileName;

							originPath = originPath.replace(new RegExp(
									/\\/g), "/");

							str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'><div>";
							str += "<span>" + obj.fileName + "</span>";
							str += "<button type='button' data-file=\'" + fileCallPath + "\' data-typebtn='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
							str += "<img src='/display?fileName=" + fileCallPath + "'>";
							str += "</div>";
							str += "</li>";
						}
					});

	uploadResult.append(str);
	
	
} 


</script>


</html>
