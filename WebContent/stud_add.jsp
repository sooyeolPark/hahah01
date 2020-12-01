<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>My JSP Page</title>
<!-- Twitter Bootstrap3 & jQuery -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<form name="myform" method="post" action="stud_add_ok.jsp" role="form">
			<fieldset>
				<legend>학생 추가</legend>

				<div class="form-group">
					<label for="name">이름</label> <input type="text"
						name="name" id="name" class="form-control" />
				</div>
				<div class="form-group">
					<label for="userid">아이디</label> <input type="text"
						name="userid" id="userid" class="form-control" />
				</div>
				<div class="form-group">
					<label for="grade">학년</label> <input type="text"
						name="grade" id="grade" class="form-control" />
				</div>
				<div class="form-group">
					<label for="idnum">주민등록번호</label> <input type="text"
						name="idnum" id="idnum" class="form-control" />
				</div>
				<div class="form-group">
					<label for="birthdate">생일</label> <input type="text"
						name="birthdate" id="birthdate" class="form-control" />
				</div>
				<div class="form-group">
					<label for="tel">전화번호</label> <input type="text"
						name="tel" id="tel" class="form-control" />
				</div>
				<div class="form-group">
					<label for="height">키</label> <input type="text"
						name="height" id="height" class="form-control" />
				</div>
				<div class="form-group">
					<label for="weight">몸무게</label> <input type="text"
						name="weight" id="weight" class="form-control" />
				</div>
				<div class="form-group">
					<label for="deptno">소속 학과 번호</label> <input type="text"
						name="deptno" id="deptno" class="form-control" />
				</div>
				<div class="form-group">
					<label for="profno">담당 교수 번호</label> <input type="text"
						name="profno" id="profno" class="form-control" />
				</div>
				<button type="submit" class="btn btn-danger">Submit</button>
			</fieldset>
		</form>
	</div>
</body>
</html>