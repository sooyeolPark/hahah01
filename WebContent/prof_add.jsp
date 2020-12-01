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
	<div class="container">
		<form name="myform" method="post" action="prof_add_ok.jsp" role="form">
			<fieldset>
				<legend>교수 추가하기</legend>
				<div class="form-group">
					<label for="name">교수이름</label>
					<input type="text" name="name" id="name" class="form-control" />
					<label for="userid">아이디</label>
					<input type="text" name="userid" id="userid" class="form-control" />
					<label for="position">직급</label>
					<input type="text" name="position" id="position" class="form-control" />
					<label for="sal">급여</label>
					<input type="text" name="sal" id="sal" class="form-control" />
					<label for="hiredate">입사일</label>
					<input type="text" name="hiredate" id="hiredate" class="form-control" />
					<label for="comm">수당</label>
					<input type="text" name="comm" id="comm" class="form-control" />
					<label for="deptno">학과번호</label>
					<input type="text" name="deptno" id="deptno" class="form-control" />
				</div>
				
				<button type="submit" class="btn btn-primary">추가하기</button>
			</fieldset>
		</form>
	</div>
</body>
</html>