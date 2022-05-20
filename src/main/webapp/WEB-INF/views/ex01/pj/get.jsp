<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<!DOCTYPE html>
<html>
<head>

<script>
	$(document).ready(function() {
		$("#edit-button1").click(function() {
			$("#input1").removeAttr("readonly");
			$("#textarea1").removeAttr("readonly");
			$("#modify-submit1").removeClass("d-none");
			$("#delete-submit1").removeClass("d-none");
		});
		$("#delete-submit1").click(function(e) {
			e.preventDefault();

			if (confirm("삭제하시겠습니까?")) {
				let form2 = $("#form2");
				form2.submit();
			}

			//	let form1 = $("#form1");
			//	let actionAttr= "/jsp20220405/board/remove";
			//	form1.attr("action",actionAttr);

		});

		$(".reply-edit-toggle-button").click(function() {
		
			const replyId = $(this).attr("data-reply-id");
			const displayDivId = "#replyDisplayContainer" + replyId;
			const editFormId = "#replyEditFormContainer" + replyId;
			
			$(displayDivId).hide();
			$(editFormId).show();
		});
		// reply-delete-button 클릭시 ]
		$(".reply-delete-button").click(function(){
			const replyId = $(this).attr("data-reply-id");
			const message= "댓글을 삭제하시겠습니까?";
			
			if(confirm(message)){
				$("#replyDeleteInput1").val(replyId);
				$("#replyDeleteForm1").submit();
			}
		});
	});
</script>




<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/spr/ex01/pj/list"><i class="fa-solid fa-house"></i></a>

    <div class="navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">

        <li class="nav-item">
       			<c:url value="/ex01/pj/write" var="writeLink"></c:url>
				<a href="${ writeLink }">글 쓰기</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">
	<div class="row">
		<div class="col">
			<h1>
	${board.id } 게시물 보기
		<button id="edit-button1" class="btn btn-secondary">
			<i class="fa-solid fa-pen-to-square"></i>
		</button>
	
	</h1>
	
	
	
	<form id="form1" action="${appRoot }/ex01/pj/modify?id=${board.id }" method="post">
	<input type="hidden" name="id" value="${board.id }"/>
	
	<div>
	 <label class="form-label" for="input1">제목</label>
	<input class="form-control" type="text" value="${board.title }" name="title" required id="input1"/>
	</div>
	
	
	<div>
	<label class="form-label" for="textarea1">본문</label>
	 <textarea class="form-control" id="textarea" cols="30" rows="10" name="body">${board.body }</textarea>
	</div>
	
	<div>
	<label class="form-label" for="input2">작성일시</label>	
	<input class="form-control" type="datetime-local" value="${board.inserted}" readonly/>
	</div>

	<button id="modify-submit1" class="btn btn-primary">수정</button>
	</form>
	
	<c:url value= "/ex01/pj/remove" var="removeLink"/>
	<form id="form2" action="${removeLink }" method="post">
		<input type="hidden" name="id" value="${board.id }"/>
		<button id="delete-submit1"  class="btn btn-danger">삭제</button>
	</form>
		</div>
	</div>
</div> 
	
	
	
	<div class="container mt-3">
		<div class="row">
			<div class="col">
	<c:url value="/ex02/reply/add" var="replyAddLink"/>
	<form action="${replyAddLink }" method="post">
		<input type="hidden" name="boardId" value="${board.id}" />
		댓글 : <input class="form-control" type = "text" name="content" size="50"/>
			<button class="btn btn-outline-secondary">
					<i class="fa-solid fa-comment-dots"></i>
			</button>
			
	</form>
	</div>
	</div>
	</div>
	
	
	
	
	<div>
		<c:forEach items="${replyList }" var="reply">
			
			<div style="border: 1px solid black; margin-bottom: 3px">
				${reply.inserted } : ${reply.content }
				<c:url value="/ex02/reply/modify" var="replyModifyLink"/>
				<form action="${replyModifyLink }" method="post"> 
					<input type="hidden" value="${reply.id }" name="id" />
					<input type="hidden" name="boardId" value="${board.id}"/>
					<input type="text" value="${reply.content }" name="content"/>
					<button>수정</button>
				</form>
				<c:url value="/ex02/reply/remove" var="replyRemoveLink" />
				<form action="${replyRemoveLink}" method="post">
					<input type="hidden" name="id" value="${reply.id }" />
					<input type="hidden" name="boardId" value="${board.id }" />
					<button>삭제</button>
				</form>
				
			</div>
		</c:forEach>
	
	</div>
		<div class="d-none">
		<form id="replyDeleteForm1" action="/spr/ex02/reply/remove" method="post">
			<input id="replyDeleteInput1" type = "text" name="id"/>
			<input type = "text" name="boardId" value="${board.id }"/>
		</form>
	</div>
</body>
</html>