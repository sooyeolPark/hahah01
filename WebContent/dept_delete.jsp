<%@page import="study.java.myschool.model.Department"%>
<%@page import="java.util.List"%>
<%@page import="study.java.myschool.service.impl.DepartmentServiceImpl"%>
<%@page import="study.java.myschool.service.DepartmentService"%>
<%@page import="study.java.myschool.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	// 파라미터 수신에 사용할 문자 셋 설정 (각 페이지당 최 상단에서 1회 설정)
	request.setCharacterEncoding("UTF-8");

	// 파라미터 받기
	String ans = request.getParameter("deptno");
	Department dept = new Department();
	dept.setDeptno(Integer.parseInt(ans));
	/** 처리 결과를 기록할 Lof4J 객체 생성 */
	Logger logger = LogManager.getFormatterLogger("dept_delete.jsp");

	/** 데이터 베이스 접속*/
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

	/** 데이터 처리 수행 */
	// 비지니스 로직을 위한 Service 객체 생성
	// --> import study.java.myschool.service.DepartmentService;
	// --> import study.java.myschool.service.impl.DepartmentServiceImpl;
	DepartmentService departmentService = new DepartmentServiceImpl(sqlSession);
	try {
		departmentService.deleteDepartment(dept);
		// 삭제 결과를 데이터 베이스에 반영하기
		sqlSession.commit();
		// 처리결과를 로그에 기록하기
		logger.debug("데이터 삭제 완료");
	} catch (NullPointerException e) {
		// 저장된 데이터가 없는 경우
		logger.error("삭제된 데이터가 없습니다.");
	} catch (Exception e) {
		// SQL문에 문제가 있는 경우
		logger.error("데이터 삭제에 실패했습니다."+e.getMessage());
	}
	List<Department> list = null;

	try {
		//학과 조회하기

		list = departmentService.getDepartmentList();
	} catch (NullPointerException e) {
		logger.error("조회된 데이터가 없습니다.");
	} catch (Exception e) {
		logger.error("데이터 조회에 실패했습니다." + e.getMessage());
	}
	/**데이터 베이스 접속 해제*/
	sqlSession.close();
	// 목록 페이지로 강제 이동
		response.sendRedirect("dept_list.jsp");
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
<h1> 안보이지</h1>
	</div>
</body>
</html>

	
