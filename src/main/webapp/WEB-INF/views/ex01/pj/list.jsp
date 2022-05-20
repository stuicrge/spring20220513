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
		
			<h1>글 목록</h1>
	<table class="table">
		<thead>
			<tr>
				<th><i class="fa-solid fa-hashtag"></i></th>
				<th>title</th>
				<th><i class="fa-solid fa-calendar"></i></th>
				
			</tr>
		</thead>			
		<tbody>
			<c:forEach items="${pjList }" var = "pj"> 
				<tr>
					<td>${pj.id }</td>
					<td>
						<c:url value="/ex01/pj/${pj.id }" var="link"></c:url>
					<a href="${link }">
						${pj.title }
					</a>
					<c:if test="${pj.numOfReply > 0 }">
						[${pj.numOfReply }]
					</c:if>
					</td>
					<td>${pj.inserted }</td>				
				</tr>	
			</c:forEach>
		</tbody>
	</table>	
		</div>
	</div>
</div>	


</body>
</html>