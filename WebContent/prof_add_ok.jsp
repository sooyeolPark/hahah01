
<%@page import="study.java.myschool.service.impl.ProfessorServiceImpl"%>
<%@page import="study.java.myschool.service.ProfessorService"%>
<%@page import="study.java.myschool.MyBatisConnectionFactory"%>
<%@page import="study.java.myschool.model.Professor"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	// 파라미터의 문자열 셋을 설정한다. (페이지 상단에서 최초 1회)
	request.setCharacterEncoding("UTF-8");

	// <input>태그의 name속성값을 사용하여 사용자의 입력값을 받는다.
	String name = request.getParameter("name");
	String userid = request.getParameter("userid");
	String position = request.getParameter("position");
	String sal = request.getParameter("sal");
	String hiredate = request.getParameter("hiredate");
	String comm = request.getParameter("comm");
	String deptno = request.getParameter("deptno");
	
	Logger logger = LogManager.getFormatterLogger("prof_add_ok.jsp");
	
	// 앞, 뒤 공백제거
	name = name.trim();
	userid = userid.trim();
	position = position.trim();
	sal = sal.trim();
	hiredate = hiredate.trim();
	comm = comm.trim();
	deptno = deptno.trim();
	
	/** 저장될 데이터를 담고 있는 Beans 객체 생성 */
	// --> import study.javamyschool.model.Department;
	Professor prof = new Professor();
	prof.setName(name);
	prof.setUserid(userid);
	prof.setPosition(position);
	prof.setSal(Integer.parseInt(sal));
	prof.setHiredate(hiredate);
	prof.setComm(Integer.parseInt(comm));
	prof.setDeptno(Integer.parseInt(deptno));
	
	/** 데이터베이스 접속 */
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	
	/** 데이터 처리 수행 */
	// 비즈니스 로직을 위한 Service 객체 생성
	ProfessorService professorService = new ProfessorServiceImpl(sqlSession);
	// 저장된 결과를 리턴받기 위한 Beans 객체
	Professor result = null;
	
	try {
		// 학과 저장하기
		result = professorService.addProfessor(prof);
		// 저장된 결과를 데이터베이스에 반영하기
		sqlSession.commit();
		// 처리 결과를 로그에 기록하기
		logger.debug("저장된 데이터 >> " + result.toString());
	} catch (NullPointerException e) {
		// 저장된 데이터가 없는 경우
		logger.error("저장된 데이터가 없습니다.");
	} catch (Exception e) {
		// SQL문에 문제가 있는 경우
		// 데이터베이스로부터 전달되는 에러메시지를 상세히 확인하기 위하여
		// e.getMessage()의 리턴값을 함께 기록한다.
		logger.error("데이터 저장에 실패했습니다." + e.getMessage());
	}
	
	/** 데이터베이스 접속 해제 */
	sqlSession.close();
	
	// 읽기 페이지로 강제 이동
	response.sendRedirect("prof_view.jsp?profno=" + result.getProfno());
%>