<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
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
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Tables</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index">Dashboard</a></li>
                            <li class="breadcrumb-item active">Tables</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                                .
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable Example
                            </div> 
                            
                            <div class="card-body">
		                	<!-- 검색 영역 -->
		                	<div class="search_wrap">
		                		<form id="searchForm" action="/admin/admintables" method="get">
		                			<div class="search_input">
		                            	<select name="type">
		                            		<option value="" <c:out 	value="${pageMaker.cri.type == null ? 'selected' : '' }"/>>
		                            			 -- </option>
		                            		<option value="T" <c:out 	value="${pageMaker.cri.type eq 'T' ? 'selected' : '' }"/>>
		                            			 상품명 </option>
		                            		<option value="C" <c:out 	value="${pageMaker.cri.type eq 'C' ? 'selected' : '' }"/>>
		                            			 설명 </option>
		                            		<option value="W" <c:out 	value="${pageMaker.cri.type eq 'W' ? 'selected' : '' }"/>>
		                            			 작가 </option>
		                            		<option value="TC" <c:out 	value="${pageMaker.cri.type eq 'TC' ? 'selected' : '' }"/>>
		                            			 상품명 or 설명 </option>
		                            		<option value="TW" <c:out 	value="${pageMaker.cri.type eq 'TW' ? 'selected' : '' }"/>>
		                            			 상품명 or 작가 </option>
		                            		<option value="TWC" <c:out 	value="${pageMaker.cri.type eq 'TWC' ? 'selected' : '' }"/>>
		                            			 상품명 or 설명 or 작가 </option>
		                            	</select>  
		                            	<input type="text" name="keyword" 	value='<c:out value="${pageMaker.cri.keyword}"/>' />
		                            	<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
		                            	<input type="hidden" name="amount" 	value='<c:out value="${pageMaker.cri.amount}"/>' />
		                    			<button class='btn search_btn'>검 색</button>   
		                    			
		                    			<a href="/audio/insert" class="btn btn-sm btn-secondary m-3">새 상품 등록</a> 
		                			</div>
		                		</form> 
		                	</div> 
                            
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>상품 번호</th>
                                            <th>상품 이름</th>
                                            <th>작가 이름</th>
                                            <th>기존가</th>
                                            <th>재고</th>
                                            <th>등록날짜</th>
                                            <th>편집</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>상품 번호</th>
                                            <th>상품 이름</th>
                                            <th>작가 이름</th>
                                            <th>기존가</th>
                                            <th>재고</th>
                                            <th>등록날짜</th>
                                            <th>편집</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
	                    			<c:forEach items="${list}" var="list">
                                        <tr>
                                            <td><c:out value="${list.auId}" /></td>
                                            <td>
                                            	<a href='/audio/get?auId=<c:out value="${list.auId}" />'> 
                                            		<c:out value="${list.auTitle}" />
                                            	</a>
                                            </td>
                                            <td><c:out value="${list.auWriter}" /></td>
                                            <td><fmt:formatNumber value="${list.auPrice}" pattern="#,###"/></td>
                                            <td><c:out value="${list.auQuantity}" /></td>
                                            <td><fmt:formatDate value="${list.auRegDate}" pattern="yyyy-MM-dd"/></td>
                                            <td>
                                            	<a class="btn btn-sm btn-outline-success" href='/audio/modify?auId=<c:out value="${list.auId}" />'>수정</a>
                                            	<a class="btn btn-sm btn-outline-danger" href='/audio/remove?auId=<c:out value='${list.auId }'/>'>삭제</a>
                                            </td>
                                        </tr> 
                                    </c:forEach>
                                    </tbody>
                                </table>
                                 
		                		<!-- 상품 x -->
		                		<c:if test="${listCheck == 'empty'}">
		                			<div class="table_empty">
		                				등록된 회원이 없습니다.
		                			</div>
		                		</c:if> 		
		                		 
                            </div>
                        </div>
                    </div>
                </main>
<%@ include file="../includes/footer.jsp" %> 
    </body> 
</html>
