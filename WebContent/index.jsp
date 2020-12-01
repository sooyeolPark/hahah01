<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>My JSP Page</title>
	<!-- Twitter Bootstrap3 & jQuery -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />
	<script src="http://code.jquery.com/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>
<body>
		<main role="main">

		  <div class="jumbotron">
		    <div class="container">
		      <h1>학교 관리 프로그램</h1>
		    </div>
		  </div>
		
		  <div class="container">
		    <div class="row">
		      <div class="col-md-3">
		      	<svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-file-earmark-medical" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path d="M4 0h5.5v1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h1V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2z"/>
				  <path d="M9.5 3V0L14 4.5h-3A1.5 1.5 0 0 1 9.5 3z"/>
				  <path fill-rule="evenodd" d="M7 5a.5.5 0 0 1 .5.5v.634l.549-.317a.5.5 0 1 1 .5.866L8 7l.549.317a.5.5 0 1 1-.5.866L7.5 7.866V8.5a.5.5 0 0 1-1 0v-.634l-.549.317a.5.5 0 1 1-.5-.866L6 7l-.549-.317a.5.5 0 0 1 .5-.866l.549.317V5.5A.5.5 0 0 1 7 5zm-2 5.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
				</svg>
		        <h2>학과 관리</h2>
		        <p><a class="btn btn-primary btn-lg" href="dept_list.jsp" role="button">바로가기 »</a></p>
		      </div>
		      <div class="col-md-3">
		      <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-person-badge" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			  <path fill-rule="evenodd" d="M2 2.5A2.5 2.5 0 0 1 4.5 0h7A2.5 2.5 0 0 1 14 2.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2.5zM4.5 1A1.5 1.5 0 0 0 3 2.5v10.795a4.2 4.2 0 0 1 .776-.492C4.608 12.387 5.937 12 8 12s3.392.387 4.224.803a4.2 4.2 0 0 1 .776.492V2.5A1.5 1.5 0 0 0 11.5 1h-7z"></path>
			  <path fill-rule="evenodd" d="M8 11a3 3 0 1 0 0-6 3 3 0 0 0 0 6zM6 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5z"></path>
			</svg>
		        <h2>교수 관리</h2>
		        <p><a class="btn btn-primary btn-lg" href="prof_list.jsp" role="button">바로가기 »</a></p>
		      </div>
		      <div class="col-md-3">
				<svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-person-lines-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm7 1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm-2-3a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm2 9a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z"/>
				</svg>
		        <h2>학생 관리</h2>
		        <p><a class="btn btn-primary btn-lg" href="stud_list.jsp" role="button">바로가기 »</a></p>
		      </div>
		    </div>
		  </div>
		
		</main>
</body>
</html>