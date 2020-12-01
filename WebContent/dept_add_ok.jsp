<%@page import="study.java.myschool.service.impl.DepartmentServiceImpl"%>
<%@page import="study.java.myschool.service.DepartmentService"%>
<%@page import="study.java.myschool.model.Department"%>
<%@page import="study.java.myschool.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<% 	// 파라미터의 문자열 셋을 설정한다. (페이지 상단에서 최초 1회)
request.setCharacterEncoding("UTF-8");
//<input> 태그의 name 속성값을 사용하여 사용자의 입력값을 받는다.
String dname = request.getParameter("dname");
String loc = request.getParameter("loc");


/** 처리 결과를 기록할 Lof4J 객체 생성 */
Logger logger = LogManager.getFormatterLogger("dept_add_ok.jsp");

/** 데이터 베이스 접속*/
SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

/** 저장될 데이터를 담고있는 Beans 객체 생성 */
Department dept = new Department();
dept.setDname(dname);
dept.setLoc(loc);


/** 데이터 처리 수행 */
// 비지니스 로직을 위한 Service 객체 생성
DepartmentService departmentService = new DepartmentServiceImpl(sqlSession);
// 저장된 결과를 받기 위한 Beans 객체
Department result = null;

//학과 저장하기
try {
	result = departmentService.addDepartment(dept);
	//저장결과를 데이터 베이스에 반영하기
	sqlSession.commit();
	// 처리결과를 로그에 기록하기
	logger.debug("저장된 데이터 >>" + result.toString());
} catch (NullPointerException e) {
	// 저장된 데이터가 없는 경우
	logger.error("저장된 데이터가 없습니다.");
} catch (Exception e) {
	// SQL문에 문제가 있는 경우
	logger.error("데이터 저장에 실패했습니다."+e.getMessage());
}

Department item = null;

try {
	// 학과 조회하기
	item = departmentService.getDepartmentItem(dept);
	// 처리 결과를 로그에 기록하기
	logger.debug("조회된 데이터 >> " + item.toString());
} catch (NullPointerException e) {
	logger.error("조회된 데이터가 없습니다.");
} catch (Exception e) {
	logger.error("데이터 조회에 실패했습니다." + e.getMessage());
}

%>
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
		<h1 class="page-header">학과 추가 완료!</h1>
		<p class="text-right">
			<a href="dept_list.jsp" class="btn btn-info">목록으로 가기</a> <a
				href="dept_delete.jsp?deptno=<%=item.getDeptno()%>" class="btn btn-warning">삭제 하기</a>
		</p>

		<ul class="list-group">
			<li class="list-group-item">학과 번호 : <%=item.getDeptno()%></li>
			<li class="list-group-item">학과 명 : <%=item.getDname()%></li>
			<li class="list-group-item">위 치 : <%=item.getLoc()%></li>
		</ul>
	</div>
</body>
</html>
<% /** 데이터 베이스 접속 해제 */
sqlSession.close(); %>