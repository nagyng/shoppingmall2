//댓글처리를 위한 자바스크립트 파일
//익명함수
var replyService = (function() {

  //신규 댓글 등록 처리 함수
  //reply : 댓글 데이터를 가지고 있는 객체
  //callback: 함수내부에서 다시 함수를 호출
  //error : 함수를 실패시 리턴되는 값
  function add(reply,callback,error) {
  	
  	 //비동기 통신방식: 클라이언트가 서버에 요청을 하고 응답처리가
  	 //오기전에 다른 요청을 계속해서 진행
  	 $.ajax({
  	     type: "post", //전송방식
  	     url: "/replies/new", //요청하는 URL
  	     //매개변수로 전달되는 객체타입을 JSON문자열로 변환
  	     data: JSON.stringify(reply),
  	     //서버로 보내는 데이터 자료형을 선언
  	     contentType: "application/json;charset=utf-8",
  	     //ajax 성공시 처리
  	     //result : 리턴되는 데이터를 가지고 있는 변수
  	     success: function(result,status,xhr) {
  	          if(callback){
  	             callback(result);
  	          }
  	     },
  	     //ajax 실패시 처리
  	     error: function(xhr,status,er){
  	     	  if(error){
  	     	  	error(er);
  	     	  }	
  	     }
  	 });  
  }
  
  //댓글 목록 처리
  //param: 댓글리스트의 형태인 매개변수
  function getList(param,callback,error){
  	
  	var qnId = param.qnId;//게시물번호
  	var page = param.page || 1;//페이지번호
  	
  	//서버로 부터 URL 처리후 JSON 형태의 데이터를 가져온다.
  	//http://localhost:8080/replies/pages/게시물번호/페이지번호.json
  	$.getJSON("/replies/pages/" + qnId + "/" + page + ".json",
  		  //data : 리턴된 특정 게시물번호에 대한 댓글 리스트
  	      function(data){
  	      	if(callback){
  	      	  //data.replyCnt: 댓글총건수
  	      	  //data.list: 댓글목록
  	      	  callback(data.replyCnt,data.list);
  	      	}
  	      }).fail(function(xhr,status,err){
  	      	if(error){
  	      		error();
  	      	}
  	      });
  }
  
  //p408 특정 댓글 삭제처리
  function remove(reId,content,callback,error){
  
  		$.ajax({
  		 type: "delete", //전송방식
  	     url: "/replies/" + reId, //요청하는 URL
  	     data: JSON.stringify({reId: reId,content: content}),
  	     contentType: "application/json;charset=utf-8",  	     
  	     success: function(deleteResult,status,xhr) {
  	          if(callback){
  	             callback(deleteResult);
  	          }
  	     },
  	     //ajax 실패시 처리
  	     error: function(xhr,status,er){
  	     	  if(error){
  	     	  	error(er); 
  	     	  }	
  	     }
  	 });
  }
  
  //p410 특정 댓글 수정
  //reply : 댓글데이터를 가지는 변수
  function update(reply,callback,error){
  	
  	  $.ajax({
  		 type: "put", //전송방식
  	     url: "/replies/" + reply.reId, //요청하는 URL
  	     data: JSON.stringify(reply),
  	     contentType: "application/json;charset=utf-8",
  	     success: function(result,status,xhr) {
  	          if(callback){
  	             callback(result);
  	          }
  	     },
  	     //ajax 실패시 처리
  	     error: function(xhr,status,er){
  	     	  if(error){
  	     	  	error(er);
  	     	  }	
  	     }
  		});
  }
  
  //p412 특정 댓글 상세보기 테스트
 function get(reId,callback,error){
 	
 	//result : 특정 댓글내역을 가지는 변수
 	$.get("/replies/" + reId + ".json",
 	              function(result){
         if(callback){
            callback(result);
         }
  	     }).fail(function(xhr,status,er){
  	     	  if(error){
  	     	  	error(er);
  	     	  }	
  		}); 
 }
 
  
  return {
    //변수: 함수명
    add: add,
    getList: getList,
    remove: remove,
    update: update,
    get: get
  };
 })();
 
 
 
  