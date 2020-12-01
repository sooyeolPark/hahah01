
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
	Logger logger = LogManager.getFormatterLogger("stud_delete.jsp");

	/** 데이터 베이스 접속*/
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

	/** 데이터 처리 수행 */
	// 비지니스 로직을 위한 Service 객체 생성
	// --> import study.java.myschool.service.StudentService;
	// --> import study.java.myschool.service.impl.StudentServiceImpl;
	StudentService studentService = new StudentServiceImpl(sqlSession);
	try {
		studentService.deleteStudent(stud);
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
	List<Student> list = null;

	try {
		//학과 조회하기

		list = studentService.getStudentList();
	} catch (NullPointerException e) {
		logger.error("조회된 데이터가 없습니다.");
	} catch (Exception e) {
		logger.error("데이터 조회에 실패했습니다." + e.getMessage());
	}
	/**데이터 베이스 접속 해제*/
	sqlSession.close();
	// 목록 페이지로 강제 이동
		response.sendRedirect("stud_list.jsp");
%>

	
