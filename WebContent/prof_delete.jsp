
<%@page import="study.java.myschool.service.ProfessorService"%>
<%@page import="study.java.myschool.service.impl.ProfessorServiceImpl"%>
<%@page import="study.java.myschool.model.Professor"%>
<%@page import="study.java.myschool.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
	Logger logger = LogManager.getFormatterLogger("prof_delete.jsp");
	
	/** 삭제될 데이터를 담고 있는 Beans 객체 생성 */
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
	
	try {
		// 삭제하기
		professorService.deleteProfessor(prof);
		// 삭제결과를 데이터베이스에 반영하기
		sqlSession.commit();
		// 처리 결과를 로그에 기록하기
		logger.debug("데이터 삭제 완료");
	} catch (NullPointerException e) {
		logger.error("삭제된 데이터가 없습니다.");
	} catch (Exception e) {
		logger.error("데이터 삭제에 실패했습니다." + e.getMessage());
	}
	
	/** 데이터베이스 접속 해제 */
	sqlSession.close();
	
	// 목록 페이지로 강제 이동
	response.sendRedirect("prof_list.jsp");
%>