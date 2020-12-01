
<%@page import="study.java.myschool.service.impl.StudentServiceImpl"%>
<%@page import="study.java.myschool.service.StudentService"%>
<%@page import="study.java.myschool.MyBatisConnectionFactory"%>
<%@page import="study.java.myschool.model.Student"%>
<%@page import="java.util.List"%>

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
	String ans = request.getParameter("studno");
	Student stud = new Student();
	stud.setStudno(Integer.parseInt(ans));
	/** 처리 결과를 기록할 Lof4J 객체 생성 */
	Logger logger = LogManager.getFormatterLogger("stud_view.jsp");

	/** 데이터 베이스 접속*/
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

	/** 데이터 처리 수행 */
	// 비지니스 로직을 위한 Service 객체 생성
	// --> import study.java.myschool.service.StudentService;
	// --> import study.java.myschool.service.impl.StudentServiceImpl;
	StudentService studentService = new StudentServiceImpl(sqlSession);
	// 조회 결과가 저장될 객체 선언
	Student item = null;

	try {
		// 학과 조회하기
		item = studentService.getStudentItem(stud);
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
		<h1 class="page-header">학생 명단</h1>
		<h3>조회 결과</h3>

		<ul class="list-group">
			<li class="list-group-item">학번 : <%=item.getStudno()%></li>
			<li class="list-group-item">이름 : <%=item.getName()%></li>
			<li class="list-group-item">아이디 : <%=item.getUserid()%></li>
			<li class="list-group-item">학년 : <%=item.getGrade()%></li>
			<li class="list-group-item">주민등록번호 : <%=item.getIdnum()%></li>
			<li class="list-group-item">생년월일 : <%=item.getBirthdate()%></li>
			<li class="list-group-item">전화번호 : <%=item.getTel()%></li>
			<li class="list-group-item">키 : <%=item.getHeight()%></li>
			<li class="list-group-item">몸무게 : <%=item.getWeight()%></li>
			<li class="list-group-item">소속학과번호 : <%=item.getDeptno()%></li>
			<li class="list-group-item">담당교수 : <%=item.getProfno()%></li>
		</ul>
		<p class="text-right">
			<a href="stud_add.jsp" class="btn btn-primary">추가</a> 
			<a href="stud_list.jsp" class="btn btn-default">목록</a>
			<a href="stud_delete.jsp?studno=<%=ans%>" class="btn btn-danger">삭제</a>
		</p>




	</div>
</body>
</html>
<%
	/**데이터 베이스 접속 해제*/
	sqlSession.close();
%>