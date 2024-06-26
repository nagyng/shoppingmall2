<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="/resources/cart/css/cart.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="../includes/title.jsp" %>     
<sec:authentication property="principal" var="pinfo"/>
<div class="container col-9">
<div class="wrapper">
	<div class="wrap">
 
		</div>     
		<div class="content_area">
			
			<div class="content_subject"><span>장바구니</span></div>
			<!-- 장바구니 리스트 -->
			<div class="content_middle_section"></div>
			<!-- 장바구니 가격 합계 -->
			<!-- cartInfo -->
			<div class="content_totalCount_section">
				
				<!-- 체크박스 전체 여부 -->
				<div class="all_check_input_div">
					<input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_check_span">전체선택</span>
				</div>				
				
				<table class="subject_table">
					<caption>표 제목 부분</caption>
					<tbody>

						<tr>
							<th class="td_width_1"></th>
							<th class="td_width_2"></th>
							<th class="td_width_3">상품명</th>
							<th class="td_width_4">가격</th>
							<th class="td_width_4">수량</th>
							<th class="td_width_4">합계</th>
							<th class="td_width_4">삭제</th>
						</tr>
					</tbody>
				</table>
				<table class="cart_table">
					<caption>표 내용 부분</caption>
					<tbody> 
						<c:forEach items="${cartInfo}" var="ci">
							<tr>
								<td class="td_width_1 cart_info_td">
									<input type="checkbox" class="individual_cart_checkbox input_size_20" checked="checked">
									<input type="hidden" class="individual_auPrice_input" value="${ci.auPrice}">
									<input type="hidden" class="individual_salePrice_input" value="${ci.salePrice}">
									<input type="hidden" class="individual_auCount_input" value="${ci.auCount}">
									<input type="hidden" class="individual_totalPrice_input" value="${ci.salePrice * ci.auCount}"><%-- 
									<input type="hidden" class="individual_point_input" value="${ci.point}">
									<input type="hidden" class="individual_totalPoint_input" value="${ci.totalPoint}"> --%>
									<input type="hidden" class="individual_auId_input" value="${ci.auId}">								
								</td>
								<td class="td_width_2"><%-- 
									<div class="image_wrap" data-auId="${ci.imageList[0].auId}" data-path="${ci.imageList[0].uploadPath}" data-uuid="${ci.imageList[0].uuid}" data-filename="${ci.imageList[0].fileName}">
										<img>
									</div>					 --%>			
								</td>
								<td class="td_width_3">${ci.auTitle}</td>
								<td class="td_width_4 price_td">
									<del>정가 : <fmt:formatNumber value="${ci.auPrice}" pattern="#,### 원" /></del><br>
									판매가 : <span class="red_color"><fmt:formatNumber value="${ci.salePrice}" pattern="#,### 원" /></span><br><%-- 
									마일리지 : <span class="green_color"><fmt:formatNumber value="${ci.point}" pattern="#,###" /></span> --%>
								</td>
								<td class="td_width_4 table_text_align_center">
									<div class="table_text_align_center quantity_div">
										<input type="text" value="${ci.auCount}" class="quantity_input">	
										<button class="quantity_btn plus_btn">+</button>
										<button class="quantity_btn minus_btn">-</button>
									</div>
									<a class="quantity_modify_btn" data-caId="${ci.caId}">변경</a>
								</td>
								<td class="td_width_4 table_text_align_center">
									<fmt:formatNumber value="${ci.salePrice * ci.auCount}" pattern="#,### 원" />
								</td>
								<td class="td_width_4 table_text_align_center">
									<button class="delete_btn" data-caId="${ci.caId}">삭제</button>
								</td>
							</tr>
						</c:forEach>  
					</tbody>
				</table>
				<table class="list_table">
				</table>
			</div>
			<!-- 가격 종합 -->
			<div class="content_total_section">
				<div class="total_wrap">
					<table>
						<tr>
							<td>
								<table>
									<tr>
										<td>총 상품 가격</td>
										<td>
											<span class="totalPrice_span">70000</span> 원
										</td>
									</tr>
									<tr>
										<td>배송비</td>
										<td>
											<span class="delivery_price">3000</span>원
										</td>
									</tr>									
									<tr>
										<td>총 주문 상품수</td>
										<td><span class="totalKind_span"></span>종 <span class="totalCount_span"></span>개</td>
									</tr>
								</table>
							</td>
							<td>
								<table>
									<tr>
										<td></td>
										<td></td>
									</tr>
								</table>							
							</td>
						</tr>
					</table>
					<div class="boundary_div">구분선</div>
					<table>
						<tr>
							<td>
								<table>
									<tbody>
										<tr>
											<td>
												<strong>총 결제 예상 금액</strong>
											</td>
											<td>
												<span class="finalTotalPrice_span">70000</span> 원
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<table>
									<tbody>
										<tr>
											<td>
												<strong>총 적립 예상 마일리지</strong>
											
											</td>
											<td>
												<span class="totalPoint_span">70000</span> 원
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 구매 버튼 영역 -->
			<div class="content_btn_section">
				<a class="order_btn">주문하기</a>
			</div>
			
			<!-- 수량 조정 form -->
			<form action="/cart/update" method="post" class="quantity_update_form">
				<input type="hidden" name="caId" class="update_caId">
				<input type="hidden" name="auCount" class="update_auCount">
				<input type="hidden" name="username" value="${pinfo.member.username}"> 
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>	
			
			<!-- 삭제 form -->
			<form action="/cart/delete" method="post" class="quantity_delete_form">
				<input type="hidden" name="caId" class="delete_caId">
				<input type="hidden" name="username" value="${pinfo.member.username}">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>		
			<!-- 주문 form -->
			<form action="/order/${pinfo.member.username}" method="get" class="order_form">
			
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
			</form>				
						
			
		</div>
		 
		
	</div>	 
</div>	 

<script>
$(document).ready(function(){
	
	/* 종합 정보 섹션 정보 삽입 */
	setTotalInfo();	
	
	/* 이미지 삽입 */
	$(".image_wrap").each(function(i, obj){
	
		const bobj = $(obj);
		
		if(bobj.data("auId")){
			const uploadPath = bobj.data("path");
			const uuid = bobj.data("uuid");
			const fileName = bobj.data("filename");
			
			const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
			
			$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
		} else {
			$(this).find("img").attr('src', '/resources/img/goodsNoImage.png');
		}
		
	});
	
	
});	

/* 체크여부에따른 종합 정보 변화 */
$(".individual_cart_checkbox").on("change", function(){
	/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
	setTotalInfo($(".cart_info_td"));
});

/* 체크박스 전체 선택 */
$(".all_check_input").on("click", function(){

	/* 체크박스 체크/해제 */
	if($(".all_check_input").prop("checked")){
		$(".individual_cart_checkbox").attr("checked", true);
	} else{
		$(".individual_cart_checkbox").attr("checked", false);
	}
	
	/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
	setTotalInfo($(".cart_info_td"));	
	
});


/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
function setTotalInfo(){
	
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let totalKind = 0;				// 총 종류
	let totalPoint = 0;				// 총 마일리지
	let deliveryPrice = 0;			// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)

	
	$(".cart_info_td").each(function(index, element){
		
		if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부
			// 총 가격
			totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
			// 총 갯수
			totalCount += parseInt($(element).find(".individual_auCount_input").val());
			// 총 종류
			totalKind += 1;
			// 총 마일리지
			totalPoint += parseInt($(element).find(".individual_totalPoint_input").val());			
		}

	});
	
	
	/* 배송비 결정 */
	if(totalPrice >= 30000){
		deliveryPrice = 0;
	} else if(totalPrice == 0){
		deliveryPrice = 0;
	} else {
		deliveryPrice = 3000;	
	}
	
		finalTotalPrice = totalPrice + deliveryPrice;
	
	/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */
	
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 갯수
	$(".totalCount_span").text(totalCount);
	// 총 종류
	$(".totalKind_span").text(totalKind);
	// 총 마일리지
	$(".totalPoint_span").text(totalPoint.toLocaleString());
	// 배송비
	$(".delivery_price").text(deliveryPrice);	
	// 최종 가격(총 가격 + 배송비)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		
}

/* 수량버튼 */
$(".plus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	$(this).parent("div").find("input").val(++quantity);
});
$(".minus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	if(quantity > 1){
		$(this).parent("div").find("input").val(--quantity);		
	}
});


/* 수량 수정 버튼 */
$(".quantity_modify_btn").on("click", function(){
	let caId = $(this).data("caId");
	let auCount = $(this).parent("td").find("input").val();
	$(".update_caId").val(caId);
	$(".update_auCount").val(auCount);
	$(".quantity_update_form").submit();
	
});

/* 장바구니 삭제 버튼 */
$(".delete_btn").on("click", function(e){
	e.preventDefault();
	const caId = $(this).data("caId");
	$(".delete_caId").val(caId);
	$(".quantity_delete_form").submit();
});
	
/* 주문 페이지 이동 */	
$(".order_btn").on("click", function(){
	
	let form_contents ='';
	let orderNumber = 0;
	
	$(".cart_info_td").each(function(index, element){
		
		if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부
			
			let auId = $(element).find(".individual_auId_input").val();
			let auCount = $(element).find(".individual_auCount_input").val();
			
			let auId_input = "<input name='orders[" + orderNumber + "].auId' type='hidden' value='" + auId + "'>";
			form_contents += auId_input;
			
			let auCount_input = "<input name='orders[" + orderNumber + "].auCount' type='hidden' value='" + auCount + "'>";
			form_contents += auCount_input;
			
			orderNumber += 1;
			
		}
	});	

	$(".order_form").html(form_contents);
	$(".order_form").submit();
	
});
		

</script>

</body>
</html>