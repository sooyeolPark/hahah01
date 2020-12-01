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
		<form name="myform" method="post" action="dept_add_ok.jsp" role="form">
			<fieldset>
				<legend>학과 추가</legend>

				<div class="form-group">
					<label for="dname">학과 이름</label> <input type="text"
						name="dname" id="dname" class="form-control" />
				</div>
				<div class="form-group">
					<label for="loc">위치</label> <input type="text"
						name="loc" id="loc" class="form-control" />
				</div>
				<button type="submit" class="btn btn-danger">Submit</button>
			</fieldset>
		</form>
	</div>
</body>
</html>