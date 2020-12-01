
<%@page import="study.java.myschool.service.impl.ProfessorServiceImpl"%>
<%@page import="study.java.myschool.service.ProfessorService"%>
<%@page import="study.java.myschool.MyBatisConnectionFactory"%>
<%@page import="study.java.myschool.model.Professor"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	//파라미터의 문자열 셋을 설정한다. (페이지 상단에서 최초 1회)
	request.setCharacterEncoding("UTF-8");

	String profno_str = request.getParameter("profno");
	int profno = 0;
	if (profno_str != null) {
		profno = Integer.parseInt(profno_str);
	}

	/** 처리 결과를 기록할 Log4J 객체 생성 */
	// 파라미터는 현재 클래스의 이름(String)
	// --> import org.apache.logging.log4j.LogManager;
	// --> import org.apache.logging.log4j.Logger;
	Logger logger = LogManager.getFormatterLogger("prof_view.jsp");

	/** 조회할 데이터의 일련번호를 저장하고 있는 Beans 객체 생성 */
	// --> import study.javamyschool.model.Department;
	Professor prof = new Professor();
	prof.setProfno(profno);

	/** 데이터베이스 접속 */
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

	/** 데이터 처리 수행 */
	// 비즈니스 로직을 위한 Service 객체 생성
	// --> import study.java.myschool.service.DepartmentService;
	// --> import study.java.myschool.service.impl.DepartmentServiceImpl;
	ProfessorService professorService = new ProfessorServiceImpl(sqlSession);
	// 조회 결과가 저장될 객체 선언
	Professor item = null;

	try {
		// 학과 조회하기
		item = professorService.getProfessorItem(prof);
		// 처리 결과를 로그에 기록하기
		logger.debug("조회된 데이터 >> " + item.toString());
	} catch (NullPointerException e) {
		logger.error("조회된 데이터가 없습니다.");
	} catch (Exception e) {
		logger.error("데이터 조회에 실패했습니다." + e.getMessage());
	}
%>
<!doctype html>
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
		<h1 class="page-header">교수목록</h1>
		<h3>조회 결과</h3>
		<ul class="list-group">
			<%
				if (item != null) {
			%>
			<li class="list-group-item"><%=item.getProfno()%></li>
			<li class="list-group-item"><%=item.getName()%></li>
			<li class="list-group-item"><%=item.getUserid()%></li>
			<li class="list-group-item"><%=item.getPosition()%></li>
			<li class="list-group-item"><%=item.getSal()%></li>
			<li class="list-group-item"><%=item.getHiredate()%></li>
			<li class="list-group-item"><%=item.getComm()%></li>
			<li class="list-group-item"><%=item.getDeptno()%></li>
			<%
				}
			%>
		</ul>
		<p class="text-right">
			<a href="prof_add.jsp" class="btn btn-primary">추가</a> 
			<a href="prof_list.jsp" class="btn btn-default">목록</a>
			<a href="prof_delete.jsp?profno=<%=profno%>" class="btn btn-danger">삭제</a>
		</p>
	</div>
</body>
</html>
