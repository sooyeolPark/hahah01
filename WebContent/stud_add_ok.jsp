<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@page import="study.java.myschool.model.Student"%>
<%@page import="java.util.List"%>
<%@page import="study.java.myschool.service.impl.StudentServiceImpl"%>
<%@page import="study.java.myschool.service.StudentService"%>
<%@page import="study.java.myschool.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%    // 파라미터의 문자열 셋을 설정한다. (페이지 상단에서 최초 1회)
request.setCharacterEncoding("UTF-8");
//<input> 태그의 name 속성값을 사용하여 사용자의 입력값을 받는다.
String name = request.getParameter("name");
String userid = request.getParameter("userid");
String grade = request.getParameter("grade");
String idnum = request.getParameter("idnum");
String birthdate = request.getParameter("birthdate");
String tel = request.getParameter("tel");
String height = request.getParameter("height");
String weight = request.getParameter("weight");
String deptno = request.getParameter("deptno");
String profno = request.getParameter("profno");

/** 처리 결과를 기록할 Lof4J 객체 생성 */
Logger logger = LogManager.getFormatterLogger("stud_add_ok.jsp");

/** 데이터 베이스 접속*/
SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

/** 저장될 데이터를 담고있는 Beans 객체 생성 */
Student stud = new Student();
stud.setName(name.trim());
stud.setUserid(userid.trim());
stud.setGrade(Integer.parseInt(grade.trim()));
stud.setIdnum(idnum.trim());
stud.setBirthdate(birthdate.trim());
stud.setTel(tel.trim());
stud.setHeight(Integer.parseInt(height.trim()));
stud.setWeight(Integer.parseInt(weight.trim()));
stud.setDeptno(Integer.parseInt(deptno.trim()));
stud.setProfno(Integer.parseInt(profno.trim()));


/** 데이터 처리 수행 */
// 비지니스 로직을 위한 Service 객체 생성
StudentService studentService = new StudentServiceImpl(sqlSession);
// 저장된 결과를 받기 위한 Beans 객체
Student result = null;

//학과 저장하기
try {
   result = studentService.addStudent(stud);
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
    /** 데이터 베이스 접속 해제 */
   sqlSession.close();

   // 목록 페이지로 강제 이동
   response.sendRedirect("stud_view.jsp?studno="+result.getStudno());
%>